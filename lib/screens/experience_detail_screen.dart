import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/config.dart';
import 'package:myportofolio_mobile/models/experience.dart';

class ExperienceDetailScreen extends StatelessWidget {
  const ExperienceDetailScreen({
    super.key,
    required this.experience,
  });

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    final endedAt = experience.endedAt;

    final endDate = endedAt == null
        ? 'Belum berakhir'
        : MaterialLocalizations.of(context)
            .formatMediumDate(endedAt.toLocal());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pengalaman',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:
            Theme.of(context).colorScheme.primary,
        iconTheme:
            const IconThemeData(color: Colors.white),
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
                      child: Center(
                        child: Icon(Icons.broken_image),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],

            Text(
              experience.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(
                  label: Text(experience.category),
                ),
                Chip(
                  label: Text(
                    experience.isOngoing
                        ? 'Ongoing'
                        : 'Completed',
                  ),
                  backgroundColor: experience.isOngoing
                      ? Colors.green.shade100
                      : Colors.grey.shade200,
                ),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            Text(experience.description),

            const SizedBox(height: 16),

            const Text(
              'Tanggal Berakhir',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            Text(endDate),

            const SizedBox(height: 16),

            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const SizedBox(width: 8),
                Text('${experience.starCount} Stars'),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              'Starred by: ${experience.starredByNames.isEmpty ? '-' : experience.starredByNames}',
            ),

            Text(
              'Is starred: ${experience.isStarred ? 'Yes' : 'No'}',
            ),

            const SizedBox(height: 16),

            Text(
              'Thumbnail: ${experience.thumbnail.isEmpty ? '-' : experience.thumbnail}',
            ),

            const SizedBox(height: 8),

            SelectableText(
              'ID: ${experience.id ?? '-'}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}