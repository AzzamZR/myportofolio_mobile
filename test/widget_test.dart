import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/screens/login_screen.dart';

void main() {
  testWidgets('Home displays profile and menu', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('MyPortfolio'), findsOneWidget);
    expect(find.text('2506618723'), findsOneWidget);
    expect(find.text('Azzam Zawawi Al Rasyid'), findsOneWidget);
    expect(find.text('PBP A'), findsOneWidget);

    expect(find.text('Lihat Proyek'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);
    expect(find.text('Tambah Pengalaman'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Logout'), findsNothing);
  });

  testWidgets('Adding a project requires login', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Tambah Proyek'));
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
