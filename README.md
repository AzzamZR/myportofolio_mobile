[![CI](https://github.com/AzzamZR/myportofolio_mobile/actions/workflows/main.yaml/badge.svg)](https://github.com/AzzamZR/myportofolio_mobile/actions/workflows/main.yaml)
# Individual Assignment: Personal Portfolio Mobile

Aplikasi portofolio pribadi milik **Azzam Zawawi Al Rasyid**, dikembangkan menggunakan **Flutter dan Dart** sebagai bagian dari mata kuliah **Pemrograman Berbasis Platform (CSGE602022)**, Fakultas Ilmu Komputer, Universitas Indonesia. Proyek ini melanjutkan portofolio berbasis Django ke pengembangan aplikasi mobile.

**Nama:** Azzam Zawawi Al Rasyid  
**NPM:** 2506618723  
**Kelas:** PBP A  
**Repositori Website:** [myportofolio (Django)](https://github.com/AzzamZR/myportofolio)

---

## Deskripsi Proyek

myportofolio_mobile merupakan aplikasi portofolio pribadi berbasis Flutter dan Dart yang dikembangkan sebagai versi mobile dari proyek myportofolio berbasis Django. Aplikasi ini dirancang untuk menampilkan dan mengelola berbagai informasi portofolio, seperti profil, proyek, dan pengalaman, melalui antarmuka mobile yang interaktif.

Pengembangan aplikasi dilakukan secara bertahap sebagai bagian dari mata kuliah Pemrograman Berbasis Platform (PBP). Proyek ini menerapkan berbagai konsep pengembangan Flutter, mulai dari penyusunan antarmuka berbasis widget, pengelolaan state, navigasi antarhalaman, hingga integrasi data dengan backend pada tahap pengembangan selanjutnya.

Struktur aplikasi dirancang secara modular agar setiap halaman dan komponen dapat dikembangkan serta dipelihara secara terpisah seiring bertambahnya fitur.

---

## Fitur Utama

- **Informasi Profil (`InfoCard`):** Menampilkan NPM, nama lengkap, dan kelas PBP pada halaman utama.
- **Menu Portofolio (`ItemCard`):** Menampilkan lima kartu menu untuk melihat dan menambahkan proyek maupun pengalaman, serta Login atau Logout sesuai status autentikasi.
- **Navigasi Antarhalaman:** Menggunakan `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()` untuk mengelola perpindahan halaman.
- **Integrasi Django REST Framework:** Mengambil dan mengirimkan data melalui REST API dengan menggunakan `ApiClient`.
- **Daftar dan Detail Portofolio:** Menampilkan data proyek dan pengalaman dari backend, dilengkapi kondisi loading, error, retry, empty state, dan pull-to-refresh.
- **JSON Serialization:** Menggunakan `json_serializable` untuk mengonversi data JSON menjadi objek Dart dan sebaliknya.
- **Token Authentication:** Mengelola autentikasi pengguna melalui `AuthState` dan melindungi operasi yang memerlukan login menggunakan `ensureLoggedIn()`.
- **Formulir Proyek dan Pengalaman:** Menyediakan formulir dengan validasi input dan pengiriman data secara langsung ke database Django melalui HTTP POST.
- **Thumbnail Preview:** Menampilkan gambar secara dinamis berdasarkan URL yang dimasukkan pada formulir pengalaman.
- **Delete Experience:** Menghapus pengalaman melalui HTTP DELETE terautentikasi, dilengkapi dialog konfirmasi dan pembaruan daftar secara otomatis.
- **Layout Responsif:** Menggunakan `LayoutBuilder` dan `SingleChildScrollView` untuk menyesuaikan tampilan berdasarkan ukuran layar.
- **CI/CD:** Menggunakan GitHub Actions untuk menjalankan pemeriksaan kode, pengujian otomatis, dan pembuatan APK release.

---

## Progres Mingguan

### Tutorial 08

Pada Tutorial 08, saya mulai mempelajari Flutter dan bahasa Dart sebagai kelanjutan pengembangan portofolio yang sebelumnya menggunakan Django. Saya melakukan setup Flutter SDK dan lingkungan pengembangan, lalu membuat proyek `myportofolio_mobile`. Setelah mengenali struktur folder proyek, saya memisahkan halaman utama ke dalam `lib/menu.dart` agar `lib/main.dart` tetap berfokus pada inisialisasi aplikasi dan pengaturan tema.

Saya mengubah `MyHomePage` dari `StatefulWidget` menjadi `StatelessWidget` karena halaman utama belum memerlukan state lokal yang berubah. Kemudian, saya membuat `InfoCard` untuk menampilkan identitas pribadi dan `ItemHomepage` serta `ItemCard` untuk menyusun tombol menu. Tombol menggunakan `InkWell` untuk menerima interaksi pengguna dan `ScaffoldMessenger` untuk menampilkan SnackBar. Saya juga menyesuaikan data contoh Burhan dengan NPM, nama, dan kelas saya sendiri.

### Individual Assignment 7

Pada Individual Assignment 7, saya melanjutkan kode Tutorial 08 tanpa mengubah struktur utamanya. Saya menambahkan atribut `Color color` pada `ItemHomepage` beserta parameter constructornya, lalu memberikan warna biru, hijau, dan merah pada ketiga tombol. Sebelumnya, seluruh `ItemCard` mengambil warna dari `Theme.of(context).colorScheme.secondary`. Sekarang, warna latar kartu menggunakan `item.color`, sehingga setiap tombol memiliki warna sendiri dan tidak memerlukan percabangan `if-else`.

Sebagai tambahan interaktivitas sederhana, saya menambahkan `SnackBarAction` berlabel **Tutup** pada notifikasi yang muncul ketika tombol ditekan. Saya memilih perubahan ini karena masih berkaitan langsung dengan komponen yang dipelajari pada Tutorial 08, tidak menambah package baru, dan tidak mengharuskan pembuatan halaman atau class tambahan.

Saat pengerjaan, saya sempat menemukan error `Instance member 'blue' can't be accessed using static access` karena menulis `Color.blue` alih-alih `Colors.blue`. Saya juga perlu memperhatikan posisi parameter `action` agar berada di dalam constructor `SnackBar`, bukan widget lain. Dari proses tersebut, saya lebih memahami perbedaan tipe `Color` dan kumpulan warna `Colors`, serta hubungan antarkomponen melalui parameter constructor.

### Tutorial 09

Pada Tutorial 09, saya mulai mempelajari navigasi antarhalaman, pembuatan formulir, dan pengelolaan input pada Flutter. Saya membuat `LeftDrawer` sebagai menu navigasi yang memungkinkan pengguna berpindah antara halaman utama dan formulir penambahan proyek. Saya juga mempelajari perbedaan penggunaan `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()` dalam mengelola perpindahan halaman.

Selanjutnya, saya membuat `ProjectFormPage` menggunakan `StatefulWidget`, `Form`, dan `GlobalKey<FormState>`. Formulir tersebut memiliki beberapa input untuk nama proyek, deskripsi, kategori, teknologi, dan tautan proyek. Saya menggunakan `TextFormField` dan `DropdownButtonFormField` untuk menerima input, serta `validator` untuk memeriksa field yang wajib diisi. Setelah validasi berhasil, data ditampilkan melalui `AlertDialog`, tanpa disimpan ke database.

Pada akhir tutorial, saya melakukan refactoring dengan memisahkan halaman ke dalam folder `screens` dan komponen yang dapat digunakan kembali ke dalam folder `widgets`. Pemisahan ini membuat struktur proyek lebih rapi dan memudahkan pengelolaan kode.

### Individual Assignment 8

Pada Tugas 8, saya melanjutkan aplikasi dari Tutorial 09 dengan membuat formulir baru untuk bagian Pengalaman (*Experience*) yang disesuaikan dengan model pada proyek Django saya. Formulir ini memiliki empat input, yaitu judul pengalaman, deskripsi, kategori, dan URL thumbnail. Saya menggunakan `TextFormField` untuk input teks dan `DropdownButtonFormField` untuk pemilihan kategori.

Saya membuat `ExperienceFormPage` menggunakan `StatefulWidget` agar dapat mengelola nilai input melalui state. Formulir dilengkapi validasi dasar untuk memastikan judul dan deskripsi tidak kosong. Setelah pengguna menekan tombol Save dan input lolos validasi, aplikasi menampilkan ringkasan data melalui `AlertDialog`. Seperti pada Tutorial 09, data masih disimpan sementara dalam state aplikasi dan belum terhubung dengan database.

Saya juga menambahkan kartu Tambah Pengalaman pada halaman utama dan opsi Add Experience pada Drawer. Navigasi melalui kartu menggunakan `Navigator.push()`, sedangkan navigasi melalui Drawer menggunakan `Navigator.pushReplacement()`. Dengan demikian, halaman formulir dapat diakses melalui dua cara berbeda.

Sebagai pengembangan interaktivitas tambahan, saya menambahkan fitur **Thumbnail Preview** pada `ExperienceFormPage` yang memungkinkan pengguna melihat gambar secara langsung berdasarkan URL thumbnail yang dimasukkan. Fitur ini memanfaatkan state `_thumbnail` dan `Image.network()` untuk menampilkan gambar secara dinamis tanpa perlu menekan tombol **Save**.

Preview hanya ditampilkan ketika URL tidak kosong dan menggunakan `BoxFit.contain` agar gambar tetap terlihat secara utuh. Saya juga menerapkan `loadingBuilder` untuk menampilkan indikator selama proses pemuatan gambar serta `errorBuilder` untuk menangani gambar yang gagal dimuat. Fitur ini berfungsi sebagai pratinjau visual dan tidak melibatkan penyimpanan data permanen.

### Tutorial 10

Pada Tutorial 10, saya mulai mengintegrasikan aplikasi Flutter dengan backend Django yang telah dikembangkan sebelumnya. Saya melakukan konfigurasi Django REST Framework, CORS, dan Token Authentication agar aplikasi Flutter dapat berkomunikasi dengan backend melalui HTTP request.

Pada sisi Flutter, saya membuat model `Project` menggunakan `json_serializable` dan menyesuaikan atributnya dengan serializer pada Django. Saya juga membuat `ApiClient` untuk memisahkan logika komunikasi dengan backend dari widget yang bertanggung jawab terhadap tampilan aplikasi.

Selanjutnya, saya membuat halaman daftar dan detail proyek menggunakan data yang diperoleh melalui API. Saya menggunakan `FutureBuilder` untuk menangani kondisi loading, error, dan data yang berhasil diperoleh, serta `RefreshIndicator` untuk memungkinkan pengguna mengambil ulang data.

Saya juga menerapkan autentikasi menggunakan `AuthState`, `ChangeNotifierProvider`, dan `MultiProvider`. Pengguna dapat melihat daftar proyek tanpa login, tetapi perlu melakukan autentikasi sebelum menambahkan proyek. Formulir proyek yang sebelumnya hanya menampilkan ringkasan input melalui `AlertDialog` kini dapat mengirimkan data ke backend menggunakan HTTP POST.

Pada akhir tutorial, saya mengimplementasikan CI/CD menggunakan GitHub Actions untuk melakukan pemeriksaan format kode, analisis statis, pengujian, serta pembuatan APK release. Saya juga menyesuaikan versi Flutter pada workflow karena terdapat perbedaan versi antara lingkungan pengembangan lokal dan GitHub Actions.

### Individual Assignment 9

Pada Tugas 9, saya melanjutkan implementasi Tutorial 10 dengan mengintegrasikan bagian Pengalaman (*Experience*) ke backend Django. Saya membuat model `Experience` menggunakan `json_serializable` dan menambahkan method `getExperiences()` serta `createExperience()` pada `ApiClient` yang sudah tersedia.

Saya membuat `ExperienceListScreen` dan `ExperienceDetailScreen` untuk menampilkan data pengalaman yang diperoleh melalui API. Halaman daftar menggunakan `FutureBuilder` dan `RefreshIndicator`, sedangkan halaman detail menampilkan informasi pengalaman, termasuk kategori, deskripsi, thumbnail, status pengalaman, tanggal berakhir, dan informasi star.

Saya juga mengembangkan `ExperienceFormPage` agar dapat mengirimkan data secara langsung ke backend menggunakan HTTP POST dengan token autentikasi. Beberapa nilai input disesuaikan dengan skema API Django tanpa menghilangkan fitur Thumbnail Preview yang telah dikembangkan pada Tugas 8. Formulir juga dilengkapi penanganan kegagalan request dan mekanisme login ulang ketika server mengembalikan HTTP 401.

Sebagai pengembangan tambahan, saya mengimplementasikan fitur **Delete Experience** yang memungkinkan pengguna dengan izin yang sesuai untuk menghapus pengalaman melalui aplikasi Flutter. Fitur ini menggunakan HTTP DELETE dengan token autentikasi dan dialog konfirmasi untuk mencegah penghapusan yang tidak disengaja.

Setelah penghapusan berhasil, halaman detail mengembalikan nilai melalui `Navigator.pop(context, true)` agar halaman daftar dapat mengambil ulang data dari backend secara otomatis. Saya memilih fitur ini karena berkaitan langsung dengan materi networking, asynchronous programming, autentikasi, dan pengiriman data antarrute, sekaligus memperluas kemampuan aplikasi dalam mengelola data portofolio.

---

## Struktur Proyek

```text
myportofolio_mobile/
├── .github/
│   └── workflows/
│       └── main.yaml
├── lib/
│   ├── main.dart
│   ├── config.dart
│   ├── models/
│   │   ├── project.dart
│   │   └── experience.dart
│   ├── services/
│   │   ├── api_client.dart
│   │   └── auth_state.dart
│   ├── screens/
│   │   ├── menu.dart
│   │   ├── login_screen.dart
│   │   ├── project_form.dart
│   │   ├── project_list_screen.dart
│   │   ├── project_detail_screen.dart
│   │   ├── experience_form.dart
│   │   ├── experience_list_screen.dart
│   │   └── experience_detail_screen.dart
│   └── widgets/
│       ├── item_card.dart
│       ├── left_drawer.dart
│       └── auth_guard.dart
├── test/
│   └── widget_test.dart
├── android/
├── ios/
├── web/
├── analysis_options.yaml
├── pubspec.yaml
└── README.md
```

## Menjalankan Proyek

### Prasyarat

- Flutter SDK 3.47.9
- Dart SDK yang kompatibel dengan `pubspec.yaml`
- Backend Django yang dapat diakses oleh aplikasi Flutter

Repositori dan deployment backend:

- **Repositori Django:** [myportofolio](https://github.com/AzzamZR/myportofolio)
- **Website:** [MyPortfolio](https://azzam-zawawi-myportofolio.pws.cs.ui.ac.id/)
- **Project API:** [Projects](https://azzam-zawawi-myportofolio.pws.cs.ui.ac.id/api/v1/projects/)
- **Experience API:** [Experiences](https://azzam-zawawi-myportofolio.pws.cs.ui.ac.id/api/v1/experiences/)

### Instalasi Dependensi

Clone repositori dan jalankan perintah berikut:

```bash
git clone https://github.com/AzzamZR/myportofolio_mobile.git
cd myportofolio_mobile
flutter doctor
flutter pub get
```

Lakukan code generation untuk model Project dan Experience:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Menjalankan dengan Backend Lokal

Pastikan backend Django sudah dikonfigurasi, migrasi database telah dijalankan, dan server aktif melalui perintah:

```bash
python manage.py runserver
```

Untuk menjalankan aplikasi pada Chrome:

```bash
flutter run -d chrome --dart-define=API_BASE_URL=http://localhost:8000
```

Untuk menjalankan aplikasi pada Android Emulator:

```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000
```

### Menjalankan dengan Backend Deployment

Aplikasi juga dapat diarahkan ke backend yang telah di-deploy menggunakan konfigurasi `API_BASE_URL`.

```bash
flutter run --dart-define=API_BASE_URL=https://azzam-zawawi-myportofolio.pws.cs.ui.ac.id
```

### Pemeriksaan Kode dan Pengujian

```bash
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
```

### Build APK

Untuk menghasilkan APK release secara lokal:

```bash
flutter build apk --release --dart-define=API_BASE_URL=https://azzam-zawawi-myportofolio.pws.cs.ui.ac.id
```

APK juga dapat diunduh melalui artefak `app-release-apk` pada workflow GitHub Actions yang berhasil dijalankan.

### CI/CD

Proyek menggunakan GitHub Actions dengan dua job utama:

- `build`: menjalankan code generation, pemeriksaan format, analisis statis, dan pengujian otomatis menggunakan `very_good_workflows`.
- `build_apk`: menghasilkan APK release setelah job `build` berhasil dan mengunggahnya sebagai artefak.

Versi Flutter ditentukan secara eksplisit pada kedua job agar lingkungan CI konsisten dengan lingkungan pengembangan lokal. URL backend untuk APK dikonfigurasi melalui repository variable `API_BASE_URL`.

Status pipeline dapat dilihat pada halaman [GitHub Actions](https://github.com/AzzamZR/myportofolio_mobile/actions).

---

## Pertanyaan Reflektif

### Tugas 7

**1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!**

*Widget tree* adalah susunan hierarkis widget yang membentuk tampilan aplikasi Flutter. Sebuah widget dapat memiliki widget anak melalui properti `child`, atau beberapa anak melalui `children`. Widget induk menentukan struktur dan batasan tata letak bagi anaknya, sedangkan anak membangun bagian tampilan yang lebih spesifik.

Pada proyek saya, `MaterialApp` menggunakan `MyHomePage` sebagai halaman awal. Di dalam `MyHomePage`, `Scaffold` menyediakan `AppBar` dan `body`. Selanjutnya, `Column` menyusun bagian profil dan menu secara vertikal, `Row` menempatkan tiga `InfoCard` secara horizontal, dan `GridView.count` mengatur tiga `ItemCard`. Jika salah satu widget diubah, hasil tampilannya dapat dipengaruhi oleh struktur dan batasan widget induknya.

**2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!**

Widget utama yang saya gunakan adalah:

- `MyApp` dan `MyHomePage` (`StatelessWidget`): masing-masing mengatur konfigurasi aplikasi dan membangun halaman menu utama.
- `MaterialApp`: menyediakan konfigurasi aplikasi, tema Material, dan halaman awal.
- `Scaffold`: menyediakan kerangka halaman, termasuk `AppBar` dan `body`.
- `AppBar`: menampilkan judul pada bagian atas halaman.
- `Text` dan `TextStyle`: menampilkan serta mengatur gaya teks.
- `Padding` dan `Container`: mengatur jarak, ukuran, dan wadah untuk isi widget.
- `Column` dan `Row`: menyusun widget secara vertikal dan horizontal.
- `Center`: menempatkan widget anak di tengah area yang tersedia.
- `Card`: menampilkan informasi profil dalam bentuk kartu dengan elevasi.
- `SizedBox`: memberikan jarak tetap antara judul dan isi `InfoCard`.
- `GridView.count`: menyusun tombol menu dalam grid dengan jumlah kolom tertentu.
- `Material`: menjadi permukaan kartu tombol beserta warna dan bentuk sudutnya.
- `InkWell`: mendeteksi sentuhan pada tombol dan memberikan efek interaksi Material.
- `Icon`: menampilkan ikon yang disimpan di `ItemHomepage`.
- `SnackBar`: menampilkan pesan singkat ketika tombol ditekan.
- `SnackBarAction`: menambahkan aksi **Tutup** pada SnackBar.
- `InfoCard` dan `ItemCard`: widget buatan sendiri yang dapat digunakan kembali untuk informasi profil dan tombol menu.

Selain widget, proyek ini menggunakan `ThemeData`, `ColorScheme`, `MediaQuery`, `EdgeInsets`, dan `BorderRadius` untuk konfigurasi tampilan. `ItemHomepage` sendiri bukan widget, melainkan class untuk menyimpan data sebuah menu. `ScaffoldMessenger` digunakan untuk mengelola penampilan SnackBar.

**3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!**

`MaterialApp` berfungsi sebagai pembungkus utama aplikasi yang menggunakan sistem Material Design. Widget ini menyediakan konfigurasi seperti tema, judul aplikasi, halaman awal, dan dukungan navigasi. Karena pengaturan tersebut sering dibutuhkan oleh banyak halaman sekaligus, `MaterialApp` biasanya ditempatkan di bagian atas widget tree.

Dalam proyek saya, `MaterialApp` dibuat pada method `build()` milik `MyApp`. Properti `theme` mengatur skema warna yang berasal dari `Colors.indigo`, sedangkan `home: MyHomePage()` menentukan halaman yang pertama kali tampil. Dengan demikian, pengaturan aplikasi tidak perlu ditulis ulang pada setiap komponen halaman.

**4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?**

`StatelessWidget` digunakan ketika widget tidak perlu mengelola state lokal yang berubah selama digunakan. Tampilan tetap dapat dibangun ulang ketika konfigurasi dari induknya berubah, tetapi class tersebut tidak memiliki objek `State` sendiri untuk memanggil `setState()`. Contohnya adalah `InfoCard`, `ItemCard`, dan `MyHomePage` pada proyek saya, karena datanya sudah ditentukan dan interaksi tombol hanya menampilkan SnackBar.

Sebaliknya, `StatefulWidget` digunakan ketika widget perlu menyimpan dan memperbarui state, misalnya angka penghitung, pilihan tab yang aktif, atau status tampilan yang berubah setelah pengguna berinteraksi. Perubahan biasanya dilakukan melalui `setState()` agar Flutter membangun ulang bagian tampilan yang berkaitan. Jadi, pemilihannya bergantung pada kebutuhan pengelolaan state, bukan sekadar ada atau tidaknya tombol.

**5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?**

`BuildContext` merupakan objek yang menunjukkan posisi sebuah widget di dalam widget tree. Context penting karena beberapa informasi atau layanan dari widget induk dapat diakses berdasarkan posisi tersebut. Parameter `context` diterima oleh method `build(BuildContext context)` pada widget saya.

Sebagai contoh, `Theme.of(context).colorScheme.primary` digunakan untuk mengambil warna utama dari tema pada `AppBar`. Pada `InfoCard`, `MediaQuery.of(context).size.width` digunakan untuk membaca lebar layar agar ukuran kartu dapat disesuaikan. Dalam `ItemCard`, `ScaffoldMessenger.of(context)` digunakan untuk menampilkan dan menyembunyikan SnackBar. Karena pencarian dilakukan berdasarkan posisi widget, context yang digunakan harus berada pada bagian widget tree yang sesuai.

**6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?**

*Hot reload* memungkinkan perubahan kode Dart diterapkan pada aplikasi yang sedang berjalan tanpa mengulang keseluruhan proses mulai dari awal. Flutter membangun ulang bagian tampilan yang diperlukan, sementara state aplikasi umumnya tetap dipertahankan. Ini berguna ketika saya mengubah warna tombol atau tampilan widget dan ingin segera melihat hasilnya.

*Hot restart* menjalankan kembali aplikasi Dart dari awal dan menghapus state yang sedang tersimpan. Cara ini lebih cocok jika perubahan berkaitan dengan inisialisasi atau state awal yang tidak diterapkan hanya melalui hot reload. Sementara itu, *full restart* menghentikan dan menjalankan ulang proses aplikasi, misalnya ketika ada perubahan native, konfigurasi platform, atau dependensi yang membutuhkan proses build ulang. Jadi, hot reload paling praktis untuk perubahan UI biasa, tetapi tidak dapat digunakan untuk semua jenis perubahan.

### Tugas 8

**1. Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.**

`Navigator.push()` digunakan untuk membuka halaman baru dengan menambahkannya ke dalam stack navigasi, sehingga halaman sebelumnya masih tersimpan dan pengguna dapat kembali menggunakan tombol Back. Sementara itu, `Navigator.pushReplacement()` mengganti halaman yang sedang aktif dengan halaman baru, tanpa menambahkannya di atas halaman lama. Berbeda dengan keduanya, `Navigator.pop()` digunakan untuk menutup halaman atau dialog yang sedang aktif dan kembali ke route sebelumnya.

Pada proyek saya, kartu Tambah Proyek dan Tambah Pengalaman menggunakan `Navigator.push()` agar pengguna dapat kembali ke halaman utama setelah membuka formulir. Sementara itu, opsi pada Drawer menggunakan `Navigator.pushReplacement()` untuk mengganti halaman yang sedang ditampilkan. Ketika pengguna memilih Home dari halaman formulir, aplikasi akan membuka kembali `MyHomePage` sebagai halaman utama. Saya juga menggunakan `Navigator.pop()` untuk menutup `AlertDialog` setelah pengguna menekan tombol OK.

**2. Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.**

`Scaffold` berfungsi sebagai kerangka utama halaman yang menyediakan tempat untuk `AppBar`, `Drawer`, dan `body`. Dengan menggunakan struktur yang sama pada setiap halaman, tampilan dan navigasi aplikasi menjadi lebih konsisten. `AppBar` digunakan untuk menampilkan judul halaman, sedangkan `Drawer` menyediakan akses ke halaman lain tanpa perlu membuat menu navigasi yang berbeda pada setiap layar.

Pada proyek saya, halaman utama dan `ExperienceFormPage` sama-sama menggunakan `Scaffold` dan komponen `LeftDrawer`. Saya juga menggunakan `Theme.of(context).colorScheme.primary` sebagai warna latar `AppBar` pada kedua halaman tersebut. Dengan mengambil warna dari tema yang sama, tampilan aplikasi tetap selaras meskipun halaman memiliki isi yang berbeda.

**3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.**

Saya menggunakan `Column` karena input formulir lebih mudah dibaca dan diisi ketika disusun secara vertikal. Setiap input dibungkus dengan `Padding` agar memiliki jarak dari tepi halaman dan tidak terlalu berdekatan dengan input lainnya. Penyusunan ini juga mengikuti pola formulir yang sudah dipelajari pada Tutorial 09.

Untuk mengatasi keterbatasan tinggi layar, saya menggunakan `SingleChildScrollView` sehingga seluruh input dan tombol Save tetap dapat dijangkau dengan menggulir halaman. Selain itu, pada halaman utama saya menggunakan `LayoutBuilder` untuk menyesuaikan jumlah kolom kartu berdasarkan lebar layar. Ketika susunan dua kolom membuat konten lebih tinggi daripada layar, saya juga menggunakan `SingleChildScrollView` untuk mengatasi overflow. Dari perubahan tersebut, saya memahami bahwa responsivitas tidak hanya berkaitan dengan lebar komponen, tetapi juga tinggi konten yang tersedia.

**4. Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.**

`GlobalKey<FormState>` digunakan untuk mengakses state dari widget `Form`. Melalui key tersebut, saya dapat memanggil `validate()` ketika tombol Save ditekan. Method `validate()` menjalankan fungsi `validator` pada field yang memiliki aturan validasi. Jika ada input yang tidak valid, validator mengembalikan pesan kesalahan yang ditampilkan pada field terkait. Jika seluruh pemeriksaan berhasil, aplikasi dapat melanjutkan proses dengan menampilkan `AlertDialog`.

Contohnya, pada field Judul Pengalaman, input yang hanya berisi spasi akan ditolak karena validator menggunakan `value.trim().isEmpty`. Hal yang sama juga berlaku pada Deskripsi Pengalaman. Pemeriksaan ini penting karena penggunaan `TextFormField` atau pemilihan jenis keyboard hanya membantu pengguna memasukkan data, tetapi tidak menjamin bahwa isinya sesuai dengan aturan yang dibutuhkan. Oleh karena itu, validasi tetap harus dilakukan melalui kode agar input yang tidak sesuai dapat ditolak.

### Assignment 9

**1. Mengapa kita menggunakan `@JsonSerializable(fieldRename: FieldRename.snake)` dan `@JsonKey(includeToJson: false)` alih-alih mengirim objek `Map<String, dynamic>` mentah langsung dari widget? Jelaskan satu bug yang dicegah atau dapat dicegah oleh pendekatan ini pada model bagianmu.**

Penggunaan `@JsonSerializable` memungkinkan proses konversi antara JSON dan objek Dart dilakukan secara otomatis melalui code generation. Dengan menggunakan model yang memiliki tipe data jelas, proses pengolahan data menjadi lebih terstruktur dan tidak perlu dilakukan secara manual pada setiap widget.

Parameter `fieldRename: FieldRename.snake` digunakan untuk menyesuaikan penamaan atribut Dart yang menggunakan camelCase dengan penamaan field pada API Django yang menggunakan snake_case. Sementara itu, `@JsonKey(includeToJson: false)` digunakan untuk mengecualikan atribut tertentu ketika objek dikonversi menjadi JSON untuk dikirim ke backend.

Pada model `Experience` milik saya, salah satu bug yang dapat dicegah adalah kesalahan penamaan atribut `endedAt` ketika dikirim ke Django. Tanpa pemetaan nama yang sesuai, Flutter dapat mengirimkan key `endedAt`, padahal backend menggunakan `ended_at`. Selain itu, atribut seperti `id`, `isOngoing`, dan `starCount` tidak ikut dikirim ketika melakukan POST karena nilainya ditentukan oleh backend. Pendekatan ini membantu menjaga konsistensi data dan memisahkan tanggung jawab model dari widget.

**2. Mengapa Future yang diteruskan ke FutureBuilder harus diinisialisasi di dalam initState() alih-alih langsung di dalam build(), dan mengapa ApiClient sebaiknya melempar ApiException daripada mengembalikan null pada respons HTTP non-2xx?**

Method `build()` dapat dipanggil berkali-kali ketika terjadi perubahan state atau ketika Flutter perlu membangun ulang widget. Jika Future dibuat langsung di dalam `build()`, HTTP request dapat dijalankan kembali setiap kali terjadi rebuild. Hal tersebut dapat menyebabkan request yang tidak diperlukan, penggunaan jaringan yang berlebihan, dan tampilan loading yang berulang.

Pada `ExperienceListScreen`, saya menginisialisasi `_experiencesFuture` di dalam `initState()` agar pengambilan data awal dilakukan satu kali untuk setiap instance State. Ketika pengguna ingin mengambil ulang data, saya menggunakan method `_reload()` untuk memperbarui Future melalui `setState()`.

`ApiClient` sebaiknya melempar `ApiException` karena respons yang gagal perlu dibedakan dari respons yang berhasil tetapi tidak memiliki data. Exception juga dapat menyimpan informasi seperti HTTP status code sehingga aplikasi dapat memberikan penanganan yang sesuai.

Sebagai contoh, ketika backend mengembalikan HTTP 401, aplikasi dapat menghapus sesi autentikasi dan meminta pengguna melakukan login kembali. Jika kegagalan tersebut hanya mengembalikan `null`, aplikasi akan lebih sulit mengetahui penyebab kegagalan dan menentukan tindakan yang diperlukan.

**3. Bandingkan SessionAuthentication milik Django (dari Tutorial 04/07) dengan TokenAuthentication milik DRF (dari Tutorial 10). Mengapa myportfolio_mobile menggunakan TokenAuthentication sementara SessionAuthentication tetap diaktifkan pada backend Django?**

`SessionAuthentication` menggunakan session yang dikelola oleh Django. Setelah pengguna berhasil login, browser menyimpan session ID melalui cookie yang dikirimkan kembali pada request berikutnya. Mekanisme ini sesuai untuk aplikasi web berbasis Django yang menggunakan browser dan dilengkapi perlindungan CSRF untuk request yang mengubah data.

Sementara itu, `TokenAuthentication` menggunakan token yang diperoleh setelah pengguna mengirimkan kredensial yang valid ke endpoint autentikasi. Token tersebut kemudian dikirim melalui header `Authorization` pada setiap request yang memerlukan autentikasi.

Pada proyek saya, aplikasi Flutter menggunakan `TokenAuthentication` karena berkomunikasi dengan backend melalui REST API dan tidak bergantung pada mekanisme session cookie browser. Token disimpan sementara pada `AuthState` dan digunakan oleh `ApiClient` ketika melakukan operasi seperti POST dan DELETE.

`SessionAuthentication` tetap diaktifkan agar request REST API berbasis sesi dari website Django masih dapat digunakan. Dengan demikian, backend dapat mendukung aplikasi web dan mobile tanpa harus mengganti mekanisme autentikasi yang sudah diterapkan pada website sebelumnya.

**4. Jelaskan peran job build (very_good_workflows) dan build_apk dalam pipeline `.github/workflows/main.yaml` milikmu (termasuk pemeriksaan apa saja yang dijalankan very_good_workflows di balik layar). Mengapa berkas `*.g.dart` dimasukkan ke .gitignore meskipun CI membutuhkannya untuk menganalisis dan membangun aplikasi?**

Job `build` berfungsi untuk memeriksa kualitas dan kebenaran kode sebelum aplikasi dibangun. Pada proyek saya, job ini menggunakan reusable workflow dari `very_good_workflows` yang melakukan checkout repository, setup Flutter, instalasi dependensi, code generation melalui perintah setup, pemeriksaan format kode, analisis statis, serta pengujian otomatis dan pengumpulan test coverage.

Job `build_apk` bertugas menghasilkan APK release yang dapat digunakan pada perangkat Android. Job ini memiliki konfigurasi `needs: build`, sehingga hanya dijalankan apabila seluruh pemeriksaan pada job `build` berhasil. Pada job tersebut, dependensi dipasang kembali, file hasil code generation dibuat, dan APK dibangun dengan konfigurasi `API_BASE_URL`. Hasilnya kemudian diunggah sebagai artefak `app-release-apk`.

File `*.g.dart` dimasukkan ke `.gitignore` karena merupakan hasil code generation, bukan kode yang ditulis dan dikelola secara langsung. Menyimpan file tersebut dalam repository dapat menimbulkan perubahan yang tidak diperlukan serta kemungkinan ketidaksesuaian dengan model aslinya.

Meskipun tidak disimpan dalam repository, file tersebut tetap dibutuhkan untuk proses analisis, pengujian, dan build aplikasi. Oleh karena itu, saya menjalankan `build_runner` pada masing-masing job agar file yang dibutuhkan dapat dihasilkan kembali sesuai dengan model dan dependensi proyek. Saya juga menentukan versi Flutter secara eksplisit pada workflow untuk menghindari perbedaan perilaku antara lingkungan lokal dan CI.

---

## AI Disclosure

### Tutorial 08 & Individual Assignment 7

Pada tahap ini, saya menggunakan **ChatGPT** sebagai alat bantu untuk mempelajari struktur proyek Flutter dan memahami sintaks Dart yang masih baru bagi saya. Saya menyertakan modul Tutorial 08, instruksi Tugas 7, dan ZIP proyek agar penjelasan merujuk pada kode yang sudah saya kerjakan. Strategi prompting yang saya gunakan adalah meminta pembahasan satu per satu sebelum menerapkan perubahan, sehingga pengerjaan tetap mengikuti materi tutorial dan saya dapat memahami alasan setiap penyesuaian.

**Bagian yang Dibantu AI:**

- Menjelaskan hubungan `main.dart`, `menu.dart`, `MyHomePage`, `InfoCard`, `ItemHomepage`, dan `ItemCard`.
- Membantu memahami fungsi constructor, `final`, `Color`, `Colors`, serta alur data dari model `ItemHomepage` ke widget `ItemCard`.
- Memberikan panduan bertahap untuk menambahkan atribut warna, memperbarui daftar tombol, dan menggunakan `item.color` pada `Material`.
- Membantu menelusuri pesan error saat penulisan warna dan saat menambahkan parameter `action` pada `SnackBar`.

**Bagian yang Saya Kerjakan dan Putuskan Sendiri:**

- Mengerjakan setup dan pengembangan dasar aplikasi berdasarkan Tutorial 08, serta menggunakan identitas pribadi sebagai isi `InfoCard`.
- Memilih perubahan warna tombol yang tetap sederhana dan mengikuti petunjuk Tugas 7.
- Memutuskan untuk menambahkan tombol **Tutup** pada SnackBar sebagai interaktivitas tambahan.
- Menerapkan perubahan kode secara bertahap, menelusuri kesalahan penulisan `Colors`, serta melakukan commit terhadap perubahan yang telah dibuat.
- Mempertahankan struktur dasar kode dan tidak menambahkan navigasi atau fitur yang belum dibutuhkan pada tahap ini.

#### AI Chat / Prompting Log

1. **Mengerjakan perubahan secara bertahap**

   > "Sekarang ajari aku mengerjakan Tugas 7 secara bertahap, mulai dari modifikasi ItemHomepage, sambil jelaskan logika dan perubahan setiap kode. Jangan langsung kerjakan semuanya."

   **Konteks & Tujuan:** Saya membagi perubahan ke dalam tahap model data, daftar menu, dan widget agar hubungan antarbagian lebih mudah dipahami.

2. **Menelusuri error saat menambahkan warna**

   > "Instance member 'blue' can't be accessed using static access."

   **Konteks & Tujuan:** Saya menemukan bahwa penyebabnya adalah penulisan `Color.blue`, bukan `Colors.blue`. Kesalahan sederhana ini membantu saya memahami perbedaan class `Color` dan konstanta warna dalam `Colors`.

3. **Memeriksa konfigurasi warna yang tidak lagi dipakai**

   > "apakah baris \"secondary: Colors.amber[700]\" pada main.dart berarti bisa dihapus?"

   **Konteks & Tujuan:** Saya ingin memastikan perubahan warna di `ItemCard` tetap konsisten dengan konfigurasi tema dan menghindari pengaturan yang tidak diperlukan.

4. **Memahami perilaku tombol SnackBar**

   > "apakah saat kita menambahkan action pada SnackBar, SnackBar jadi harus kita tutup manual?"

   **Konteks & Tujuan:** Saya ingin mengetahui apakah penambahan tombol mengubah perilaku penutupan otomatis SnackBar sebelum mempertahankan fitur tersebut.

#### Keterbatasan AI dan Pemahaman Saya

Selama pengerjaan, saya menyadari bahwa hasil dan saran dari AI tidak selalu sepenuhnya sesuai dengan kondisi proyek, sehingga tetap perlu dipahami dan diperiksa kembali sebelum diterapkan. AI cukup membantu dalam menjelaskan konsep, memahami alur kode, serta memberikan alternatif penyelesaian ketika menemukan kendala. Namun, saya tetap perlu menyesuaikan saran tersebut dengan struktur dan kebutuhan proyek yang sedang dikembangkan.

Oleh karena itu, saya memilih untuk mengerjakan perubahan secara bertahap agar lebih mudah memahami fungsi dan hubungan antarbagian kode. Saya juga berusaha untuk tidak hanya mengikuti solusi yang diberikan, tetapi memahami alasan di balik penerapannya. Dengan begitu, AI berperan sebagai alat bantu pembelajaran, sedangkan proses implementasi, pengambilan keputusan, dan pemeriksaan hasil akhir tetap menjadi tanggung jawab saya.

### Tutorial 09 & Individual Assignment 8

Pada tahap ini, saya menggunakan **ChatGPT** sebagai alat bantu untuk memahami penerapan navigasi, pengelolaan state, validasi formulir, dan responsivitas pada Flutter. Saya memberikan modul Tutorial 09, instruksi Tugas 8, serta beberapa file kode agar pembahasan dapat disesuaikan dengan struktur proyek yang sedang saya kerjakan.

Strategi prompting yang saya gunakan adalah meminta penjelasan secara bertahap, membandingkan implementasi dengan tutorial, dan mendiskusikan alasan di balik penggunaan widget maupun perubahan logika. Saya juga menggunakan AI untuk membantu menganalisis masalah yang muncul setelah perubahan kode, kemudian memeriksa hasilnya secara langsung.

**Bagian yang Dibantu AI:**

- Menjelaskan perbedaan `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()` serta pengaruhnya terhadap navigation stack.
- Membantu memahami hubungan antara `StatefulWidget`, `setState()`, `GlobalKey<FormState>`, dan proses validasi input.
- Menjelaskan bagaimana nilai input disimpan sementara dalam state dan mengapa `AlertDialog` tidak berarti data sudah tersimpan ke database.
- Membantu memahami penggunaan `LayoutBuilder` untuk menyesuaikan jumlah kolom berdasarkan lebar layar.
- Membantu menganalisis penyebab overflow setelah perubahan layout dan memahami peran `SingleChildScrollView`.
- Membantu memahami penerapan *conditional rendering* dan penggunaan `setState()` untuk memperbarui thumbnail preview berdasarkan perubahan input.
- Menjelaskan fungsi `Image.network()`, `loadingBuilder`, dan `errorBuilder` dalam menampilkan gambar serta menangani kondisi loading dan error.
- Membantu membandingkan penggunaan `BoxFit.cover` dan `BoxFit.contain` untuk menentukan tampilan gambar yang sesuai dengan kebutuhan preview.

**Bagian yang Saya Kerjakan dan Putuskan Sendiri:**

- Memilih Pengalaman sebagai formulir baru dan menyesuaikan field dengan model portofolio Django.
- Memilih penggunaan `List<String>` untuk kategori agar tetap sesuai dengan pola yang dipelajari pada tutorial.
- Menyederhanakan formulir menjadi empat input tanpa tanggal selesai.
- Menerapkan navigasi melalui kartu pada halaman utama dan menu Drawer.
- Mengganti nama `project_card.dart` menjadi `item_card.dart` agar lebih sesuai dengan tanggung jawab widget.
- Memilih responsivitas halaman utama sebagai pengembangan tambahan dan mempertahankan implementasi yang sederhana.
- Melakukan implementasi, pengujian tampilan, dan commit secara bertahap.
- Memutuskan untuk menambahkan Thumbnail Preview sebagai pengembangan interaktivitas tanpa membuat fitur penyimpanan yang belum dibutuhkan.
- Memilih `BoxFit.contain` agar gambar dapat ditampilkan secara utuh tanpa terpotong.
- Mempertahankan mekanisme formulir yang sudah ada dan membatasi perubahan pada bagian thumbnail.

#### AI Chat / Prompting Log

1. **Memahami hubungan antara input, state, dan penyimpanan data**

   > "lalu yang aku save, disimpan dimana?"

   **Konteks & Tujuan:** Saya ingin memahami apa yang sebenarnya terjadi ketika tombol Save ditekan. Dari pembahasan tersebut, saya mengetahui bahwa data pada formulir masih disimpan sementara dalam variabel state, sedangkan `AlertDialog` hanya menampilkan hasil input. Hal ini membantu saya membedakan pengelolaan state di Flutter dengan penyimpanan data secara permanen.

2. **Memahami hubungan URL dengan penampilan gambar**

   > "ketika kita menyimpan url gambar, bagaimana kita mununjukannya nanti?"

   **Konteks & Tujuan:** Saya ingin mengetahui bagaimana URL yang disimpan sebagai String dapat digunakan untuk menampilkan gambar. Melalui pembahasan `Image.network()`, saya memahami bahwa menyimpan alamat gambar dan mengambil gambar dari alamat tersebut merupakan dua proses yang berbeda. Saya juga mempelajari pentingnya menangani kemungkinan gambar gagal dimuat, meskipun fitur preview belum diterapkan.

3. **Memahami variabel dan constraints pada LayoutBuilder**

   > "Undefined name 'constrains'. Try correcting the name to one that is defined, or defining the name. mengapa tidak dapat digunakan?"

   **Konteks & Tujuan:** Ketika mencoba menerapkan layout responsif, saya menemukan error karena menggunakan nama variabel yang tidak sesuai dengan parameter `constraints` pada `LayoutBuilder`. Dari masalah ini, saya memahami bahwa nilai lebar yang digunakan harus berasal dari parameter builder yang benar dan bahwa penamaan variabel harus konsisten.

4. **Menganalisis pengaruh perubahan layout terhadap tinggi konten**

   > "ini kenapa?"

   **Konteks & Tujuan:** Setelah jumlah kolom kartu disesuaikan dengan lebar layar, aplikasi mengalami `BOTTOM OVERFLOWED`. Dari pembahasan tersebut, saya memahami bahwa perubahan jumlah kolom pada `GridView` juga memengaruhi ukuran serta tinggi keseluruhan konten. Saya kemudian menggunakan `SingleChildScrollView` agar halaman tetap dapat digulir ketika kontennya melebihi ruang yang tersedia.

5. **Memahami cakupan pengembangan fitur thumbnail**

   > "Tapi aplikasinya kan belum bisa menyimpan atau menampilkan data yang sudah ditambahkan?"

   **Konteks & Tujuan:** Saya ingin memastikan fitur tambahan yang dikembangkan tetap sesuai dengan cakupan Tugas 8. Dari pembahasan ini, saya memahami perbedaan antara menampilkan preview gambar dan mengelola data yang sudah disimpan. Saya kemudian memilih untuk mengembangkan **Thumbnail Preview** karena fitur tersebut dapat meningkatkan interaktivitas formulir tanpa memerlukan sistem penyimpanan atau halaman baru.

6. **Menyesuaikan tampilan gambar pada Thumbnail Preview**

   > "Bagaimana cara mengatur tampilan gambar agar ukurannya lebih sesuai dan tidak terpotong?"

   **Konteks & Tujuan:** Saya ingin menampilkan gambar dengan proporsi yang sesuai tanpa memotong bagian tertentu. Dari pembahasan ini, saya memahami perbedaan `BoxFit.cover` dan `BoxFit.contain`, terutama dalam menyesuaikan gambar dengan ukuran area yang tersedia. Saya memilih menggunakan `BoxFit.contain` agar gambar dapat ditampilkan secara utuh pada bagian preview.

#### Keterbatasan AI dan Pemahaman Saya

Selama pengerjaan, saya menyadari bahwa saran dari AI tidak selalu sesuai dengan kebutuhan dan kondisi proyek yang sedang dikembangkan. Beberapa solusi yang diberikan terkadang mencakup perubahan yang lebih luas dari yang diperlukan. Oleh karena itu, saya perlu memahami setiap saran terlebih dahulu dan menyesuaikannya dengan struktur kode, materi yang sudah dipelajari, serta tujuan pengembangan aplikasi.

Saya juga memahami bahwa kode yang terlihat benar belum tentu menghasilkan perilaku atau tampilan yang sesuai. Hal ini membuat saya perlu melakukan pengujian secara langsung, terutama ketika mengubah layout, mengelola state, atau menambahkan interaktivitas baru. Melalui proses tersebut, saya semakin memahami pentingnya hubungan antar-widget dan bagaimana perubahan pada satu bagian dapat memengaruhi bagian lainnya.

Secara keseluruhan, AI membantu saya memahami konsep, mengeksplorasi alternatif implementasi, dan mencari penyebab masalah. Namun, saya tetap perlu mengevaluasi solusi yang diberikan, menentukan perubahan yang sesuai, serta memastikan hasil implementasinya berjalan sebagaimana mestinya.

### Tutorial 10 & Individual Assignment 9

Pada tahap ini, saya menggunakan **ChatGPT** sebagai alat bantu untuk memahami integrasi Flutter dengan backend Django, JSON serialization, asynchronous programming, token authentication, dan CI/CD. Saya memberikan modul tutorial, instruksi tugas, materi perkuliahan, serta akses terhadap repository agar pembahasan dapat disesuaikan dengan struktur proyek yang sedang saya kerjakan.

Strategi prompting yang saya gunakan adalah membagi pengerjaan menjadi beberapa tahap, meminta penjelasan mengenai implementasi, dan memeriksa kesesuaiannya dengan instruksi tutorial. Saya juga meminta AI untuk membantu melakukan review kode setelah perubahan di-commit serta menganalisis pesan error yang muncul selama pengerjaan.

**Bagian yang Dibantu AI:**

- Membantu memahami konfigurasi Django REST Framework, CORS, dan Token Authentication.
- Membantu menyesuaikan model Flutter dengan serializer dan struktur data Django.
- Memberikan panduan serta contoh implementasi HTTP GET, POST, dan DELETE melalui `ApiClient`.
- Membantu memahami penggunaan `FutureBuilder`, `initState()`, dan `RefreshIndicator` dalam pengambilan data asynchronous.
- Menjelaskan pengelolaan autentikasi melalui `AuthState`, Provider, dan mekanisme route guard.
- Membantu mengembangkan penanganan HTTP 401, HTTP 403, dan kegagalan komunikasi dengan backend.
- Membantu menyusun konfigurasi GitHub Actions dan menganalisis penyebab kegagalan pipeline CI/CD.
- Memberikan alternatif pengembangan tambahan berdasarkan materi perkuliahan dan rubrik penilaian.
- Membantu menyusun dokumentasi dan jawaban pertanyaan reflektif berdasarkan implementasi proyek.

**Bagian yang Saya Kerjakan dan Putuskan Sendiri:**

- Memilih Pengalaman sebagai bagian portofolio yang diintegrasikan pada Tugas 9.
- Memutuskan untuk mempertahankan struktur backend Django dan menyesuaikan model Flutter sesuai dengan kebutuhan API.
- Mempertahankan fitur Thumbnail Preview yang telah dikembangkan pada Tugas 8.
- Memilih Delete Experience sebagai pengembangan tambahan dengan membatasi cakupan perubahan pada operasi penghapusan.
- Menerapkan perubahan kode secara bertahap dan menjalankan pemeriksaan menggunakan `dart format`, `flutter analyze`, dan `flutter test`.
- Mengelola branch, commit, push, dan pull request selama proses pengembangan.

#### AI Chat / Prompting Log

1. **Memahami penyesuaian struktur data antara Flutter dan Django**

   > Dalam proses integrasi Flutter dengan Django, terdapat perbedaan antara atribut pada formulir Flutter dan field yang tersedia pada model Django. Apakah penyesuaian sebaiknya dilakukan pada model Flutter atau backend Django? Jelaskan pertimbangan dan dampak dari kedua pendekatan tersebut terhadap konsistensi data dan implementasi yang sudah ada.

   **Konteks & Tujuan:** Saya ingin memahami pendekatan yang tepat ketika terdapat perbedaan struktur data antara frontend dan backend. Dari pembahasan tersebut, saya memahami pentingnya menjadikan skema API sebagai acuan dalam pengembangan model Flutter serta dampak perubahan model terhadap database dan aplikasi yang sudah dikembangkan sebelumnya.

2. **Menganalisis kegagalan pipeline CI/CD**

   > Pipeline GitHub Actions mengalami kegagalan ketika saya membuat pull request untuk menggabungkan Tutorial 10 ke branch main, meskipun pemeriksaan kode secara lokal telah berhasil. Analisis log workflow untuk mengidentifikasi penyebab kegagalan tersebut dan jelaskan solusi yang dapat diterapkan tanpa mengabaikan pemeriksaan kualitas kode.

   **Konteks & Tujuan:** Saya ingin memahami penyebab perbedaan hasil pemeriksaan antara lingkungan lokal dan GitHub Actions. Dari pembahasan tersebut, saya mempelajari pentingnya konsistensi versi SDK dan dependensi dalam menjaga proses pengembangan serta build aplikasi yang dapat direproduksi.

3. **Memahami pengelolaan autentikasi dan penanganan sesi**

   > Jika status autentikasi pada Flutter ditentukan berdasarkan token yang tersimpan di AuthState, bagaimana aplikasi mengetahui bahwa token tersebut sudah tidak valid pada backend? Jelaskan hubungan antara AuthState, ApiClient, respons HTTP 401, dan mekanisme login ulang tanpa menghilangkan data yang telah dimasukkan pengguna pada formulir.

   **Konteks & Tujuan:** Saya ingin memahami perbedaan antara status autentikasi yang tersimpan pada aplikasi dan validitas token pada backend. Dari pembahasan mengenai alur autentikasi, saya memahami bahwa keberadaan token pada state lokal tidak selalu menjamin token tersebut masih valid. Oleh karena itu, aplikasi perlu menangani respons dari backend dan memperbarui status autentikasi sesuai kondisi yang sebenarnya.

4. **Memahami sinkronisasi data melalui navigation result**

   > Ketika sebuah Experience berhasil dihapus melalui HTTP DELETE pada halaman detail, bagaimana halaman daftar dapat mengetahui bahwa data tersebut telah berubah? Jelaskan bagaimana Navigator.push(), Navigator.pop(), dan FutureBuilder dapat digunakan untuk memperbarui daftar pengalaman secara otomatis tanpa membuat halaman daftar baru.

   **Konteks & Tujuan:** Saya ingin memahami bagaimana perubahan data pada suatu halaman dapat memengaruhi halaman sebelumnya. Melalui pembahasan mengenai pengembalian nilai antarrute, saya memahami bahwa hasil operasi dapat dikirimkan kembali melalui `Navigator.pop()`. Nilai tersebut kemudian digunakan untuk menentukan apakah halaman daftar perlu mengambil ulang data dari backend.

5. **Memahami penggunaan BuildContext dalam operasi asynchronous**

   > Analyzer memberikan peringatan use_build_context_synchronously ketika saya menggunakan BuildContext setelah operasi asynchronous, meskipun sudah melakukan pengecekan mounted. Jelaskan perbedaan antara mounted pada State dan context.mounted pada BuildContext, serta bagaimana menentukan pengecekan yang tepat berdasarkan context yang digunakan.

   **Konteks & Tujuan:** Saya ingin memahami hubungan antara operasi asynchronous dan lifecycle widget pada Flutter. Dari pembahasan tersebut, saya mengetahui bahwa widget atau context dapat menjadi tidak aktif ketika suatu operasi sedang berlangsung. Oleh karena itu, pengecekan yang sesuai diperlukan sebelum melakukan navigasi atau mengakses komponen lain melalui BuildContext.

#### Keterbatasan AI dan Pemahaman Saya

Selama pengerjaan, saya menyadari bahwa solusi yang diberikan AI perlu disesuaikan dengan struktur proyek, versi dependensi, dan lingkungan pengembangan yang digunakan. Implementasi yang terlihat sesuai secara teori belum tentu dapat langsung berjalan pada kondisi yang berbeda. Oleh karena itu, saya perlu memeriksa kembali setiap perubahan melalui analisis kode, pengujian, dan hasil eksekusi aplikasi.

Saya juga memahami bahwa integrasi aplikasi tidak hanya berkaitan dengan keberhasilan pengiriman data, tetapi juga bagaimana aplikasi menangani kegagalan komunikasi, autentikasi, dan perubahan state. Proses pengerjaan secara bertahap membantu saya memahami hubungan antara model, service, dan widget serta tanggung jawab masing-masing komponen.

AI membantu saya memahami konsep, memberikan alternatif implementasi, dan menelusuri penyebab masalah. Namun, saya tetap perlu mengevaluasi solusi yang diberikan, menentukan cakupan perubahan yang sesuai, dan memastikan hasil implementasinya melalui pemeriksaan secara langsung.
