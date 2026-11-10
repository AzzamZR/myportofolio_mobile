import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('Menu tutorial menampilkan profil dan SnackBar setiap tombol', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('MyPortfolio'), findsOneWidget);
    expect(find.text('2506618723'), findsOneWidget);
    expect(find.text('Azzam Zawawi Al Rasyid'), findsOneWidget);
    expect(find.text('PBP A'), findsOneWidget);

    for (final name in ['Lihat Proyek', 'Tambah Proyek', 'Logout']) {
      await tester.tap(find.text(name));
      await tester.pumpAndSettle();
      expect(find.text('Kamu telah menekan tombol $name!'), findsOneWidget);
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
    }
  });
}
