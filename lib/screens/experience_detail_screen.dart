import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/config.dart';
import 'package:myportofolio_mobile/models/experience.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class ExperienceDetailScreen extends StatefulWidget {
  const ExperienceDetailScreen({super.key, required this.experience});

  final Experience experience;

  @override
  State<ExperienceDetailScreen> createState() => _ExperienceDetailScreenState();
}

class _ExperienceDetailScreenState extends State<ExperienceDetailScreen> {
  bool _isDeleting = false;

  Experience get experience => widget.experience;

  Future<void> _deleteExperience() async {
    if (_isDeleting) return;

    final id = experience.id;
    if (id == null) return;

    setState(() {
      _isDeleting = true;
    });

    try {
      final loggedIn = await ensureLoggedIn(context);

      if (!mounted || !loggedIn) return;

      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Hapus Pengalaman?'),
            content: Text(
              'Pengalaman "${experience.title}" akan '
              'dihapus secara permanen.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Batal'),
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Hapus'),
              ),
            ],
          );
        },
      );

      if (!mounted || confirmed != true) return;

      final authState = context.read<AuthState>();
      final apiClient = context.read<ApiClient>();
      final token = authState.token;

      if (token == null) return;

      await apiClient.deleteExperience(id, token: token);

      if (!mounted) return;

      Navigator.pop(context, true);
    } on ApiException catch (e) {
      if (!mounted) return;

      if (e.statusCode == 401) {
        final authState = context.read<AuthState>();

        try {
          await authState.logout();
        } catch (_) {
          // Token lokal tetap dihapus.
        }

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sesi berakhir. Silakan login kembali.'),
          ),
        );

        await ensureLoggedIn(context);
      } else if (e.statusCode == 403) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Kamu tidak memiliki izin untuk menghapus pengalaman.',
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menghapus pengalaman (${e.statusCode}).'),
          ),
        );
      }
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal terhubung ke server.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isDeleting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final endedAt = experience.endedAt;

    final endDate = endedAt == null
        ? 'Belum berakhir'
        : MaterialLocalizations.of(context).formatMediumDate(endedAt.toLocal());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pengalaman',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          if (experience.id != null)
            IconButton(
              tooltip: 'Hapus Pengalaman',
              onPressed: _isDeleting ? null : _deleteExperience,
              icon: _isDeleting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.delete_outline),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (experience.thumbnail.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  Uri.parse(apiBaseUrl)
                      .resolve(experience.thumbnail)
                      .toString(),
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 100,
                      child: Center(child: Icon(Icons.broken_image)),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],

            Text(
              experience.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(label: Text(experience.category)),
                Chip(
                  label: Text(experience.isOngoing ? 'Ongoing' : 'Completed'),
                  backgroundColor: experience.isOngoing
                      ? Colors.green.shade100
                      : Colors.grey.shade200,
                ),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text(experience.description),

            const SizedBox(height: 16),

            const Text(
              'Tanggal Berakhir',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text(endDate),

            const SizedBox(height: 16),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 8),
                Text('${experience.starCount} Stars'),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              'Starred by: ${experience.starredByNames.isEmpty ? '-' : experience.starredByNames}',
            ),

            Text('Is starred: ${experience.isStarred ? 'Yes' : 'No'}'),

            const SizedBox(height: 16),

            Text(
              'Thumbnail: ${experience.thumbnail.isEmpty ? '-' : experience.thumbnail}',
            ),

            const SizedBox(height: 8),

            SelectableText(
              'ID: ${experience.id ?? '-'}',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
