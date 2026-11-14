# Individual Assignment: Personal Portfolio Mobile

Aplikasi portofolio pribadi milik **Azzam Zawawi Al Rasyid**, dikembangkan menggunakan **Flutter dan Dart** sebagai bagian dari mata kuliah **Pemrograman Berbasis Platform (CSGE602022)**, Fakultas Ilmu Komputer, Universitas Indonesia. Proyek ini melanjutkan portofolio berbasis Django ke pengembangan aplikasi mobile.

**Nama:** Azzam Zawawi Al Rasyid  
**NPM:** 2506618723  
**Kelas:** PBP A  
**Repositori Website:** [myportofolio (Django)](https://github.com/AzzamZR/myportofolio)

---

## Deskripsi Proyek

`myportofolio_mobile` merupakan aplikasi Flutter yang dibuat sebagai pengembangan awal versi mobile dari website portofolio pribadi saya. Pada tahap Tutorial 08 dan Individual Assignment 7, aplikasi masih berfokus pada halaman menu utama, penampilan identitas pemilik, serta tombol interaktif. Belum ada integrasi dengan database atau API Django, sehingga tombol menu belum membuka halaman proyek ataupun menjalankan proses logout yang sebenarnya.

Aplikasi menggunakan pendekatan berbasis *widget*, dengan pemisahan kode inisialisasi pada `main.dart` dan halaman utama pada `menu.dart`. Komponen `InfoCard` digunakan kembali untuk menampilkan informasi profil, sedangkan `ItemHomepage` menyimpan data tombol yang kemudian ditampilkan melalui `ItemCard`.

---

## Fitur Utama

- **Informasi Profil (`InfoCard`):** Menampilkan NPM, nama lengkap, dan kelas PBP dalam tiga kartu pada halaman utama.
- **Menu Portofolio (`ItemCard`):** Menampilkan tiga tombol, yaitu Lihat Proyek, Tambah Proyek, dan Logout, dengan ikon yang sesuai.
- **Warna Tombol Berbeda:** Setiap menu menyimpan atribut `color` pada model `ItemHomepage` sehingga warna kartu dapat diatur tanpa percabangan berdasarkan nama tombol.
- **SnackBar Interaktif:** Ketika tombol ditekan, aplikasi menampilkan pesan sesuai nama tombol. Saya juga menambahkan aksi **Tutup** untuk menyembunyikan SnackBar secara manual, tanpa menghilangkan perilaku penutupan otomatis dalam kondisi normal.
- **Struktur Widget Terpisah:** `main.dart` digunakan untuk inisialisasi aplikasi dan tema, sedangkan `menu.dart` berisi susunan halaman serta komponen UI.

---

## Progres Mingguan

### Tutorial 08

Pada Tutorial 08, saya mulai mempelajari Flutter dan bahasa Dart sebagai kelanjutan pengembangan portofolio yang sebelumnya menggunakan Django. Saya melakukan setup Flutter SDK dan lingkungan pengembangan, lalu membuat proyek `myportofolio_mobile`. Setelah mengenali struktur folder proyek, saya memisahkan halaman utama ke dalam `lib/menu.dart` agar `lib/main.dart` tetap berfokus pada inisialisasi aplikasi dan pengaturan tema.

Saya mengubah `MyHomePage` dari `StatefulWidget` menjadi `StatelessWidget` karena halaman utama belum memerlukan state lokal yang berubah. Kemudian, saya membuat `InfoCard` untuk menampilkan identitas pribadi dan `ItemHomepage` serta `ItemCard` untuk menyusun tombol menu. Tombol menggunakan `InkWell` untuk menerima interaksi pengguna dan `ScaffoldMessenger` untuk menampilkan SnackBar. Saya juga menyesuaikan data contoh Burhan dengan NPM, nama, dan kelas saya sendiri.

### Individual Assignment 7

Pada Individual Assignment 7, saya melanjutkan kode Tutorial 08 tanpa mengubah struktur utamanya. Saya menambahkan atribut `Color color` pada `ItemHomepage` beserta parameter constructornya, lalu memberikan warna biru, hijau, dan merah pada ketiga tombol. Sebelumnya, seluruh `ItemCard` mengambil warna dari `Theme.of(context).colorScheme.secondary`. Sekarang, warna latar kartu menggunakan `item.color`, sehingga setiap tombol memiliki warna sendiri dan tidak memerlukan percabangan `if-else`.

Sebagai tambahan interaktivitas sederhana, saya menambahkan `SnackBarAction` berlabel **Tutup** pada notifikasi yang muncul ketika tombol ditekan. Saya memilih perubahan ini karena masih berkaitan langsung dengan komponen yang dipelajari pada Tutorial 08, tidak menambah package baru, dan tidak mengharuskan pembuatan halaman atau class tambahan.

Saat pengerjaan, saya sempat menemukan error `Instance member 'blue' can't be accessed using static access` karena menulis `Color.blue` alih-alih `Colors.blue`. Saya juga perlu memperhatikan posisi parameter `action` agar berada di dalam constructor `SnackBar`, bukan widget lain. Dari proses tersebut, saya lebih memahami perbedaan tipe `Color` dan kumpulan warna `Colors`, serta hubungan antarkomponen melalui parameter constructor.

---

## Struktur Proyek

```text
myportofolio_mobile/
├── lib/
│   ├── main.dart         # Entry point, MaterialApp, dan tema
│   └── menu.dart         # MyHomePage, InfoCard, ItemHomepage, ItemCard
├── test/
│   └── widget_test.dart  # Pengujian widget menu utama
├── android/               # Konfigurasi proyek Android
├── ios/                   # Konfigurasi proyek iOS
├── web/                   # Konfigurasi aplikasi web
├── pubspec.yaml           # Konfigurasi proyek dan dependensi
└── README.md              # Dokumentasi proyek
```

## Menjalankan Proyek

Pastikan Flutter SDK sudah terpasang dan bisa digunakan dari terminal. Jalankan perintah berikut dari direktori proyek:

```bash
flutter doctor
flutter pub get
flutter run -d chrome
```

Untuk memeriksa kode dan menjalankan pengujian widget:

```bash
flutter analyze
flutter test
```

Perintah di atas adalah langkah verifikasi yang dapat dijalankan secara lokal. Hasil eksekusinya perlu diperiksa pada versi kode terbaru sebelum dinyatakan bebas masalah.

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
