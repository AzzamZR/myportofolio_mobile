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
- **Menu Portofolio (`ItemCard`):** Menampilkan empat kartu menu, yaitu Lihat Proyek, Tambah Proyek, Tambah Pengalaman, dan Logout, dengan ikon serta warna yang berbeda.
- **Navigasi Antarhalaman:** Menggunakan `Navigator.push()` pada kartu menu dan `Navigator.pushReplacement()` pada Drawer untuk berpindah halaman.
- **Formulir Proyek (`ProjectFormPage`):** Menyediakan input informasi proyek dengan validasi dan ringkasan hasil melalui `AlertDialog`.
- **Formulir Pengalaman (`ExperienceFormPage`):** Menyediakan input judul, deskripsi, kategori, dan URL thumbnail pengalaman.
- **Thumbnail Preview:** Menampilkan gambar secara langsung berdasarkan URL yang dimasukkan pada formulir pengalaman, disertai indikator loading dan penanganan error.
- **Layout Responsif:** Menggunakan `LayoutBuilder` untuk menyesuaikan jumlah kolom menu berdasarkan lebar layar dan `SingleChildScrollView` untuk mengatasi keterbatasan ruang.
- **SnackBar Interaktif:** Menampilkan pesan sesuai tombol yang ditekan dan menyediakan aksi Tutup.
- **Struktur Widget Terpisah:** Memisahkan halaman dan komponen ke dalam folder `screens` dan `widgets` agar kode lebih terorganisasi.

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

---

## Struktur Proyek

```text
myportofolio_mobile/
├── lib/
│   ├── main.dart
│   ├── screens/
│   │   ├── menu.dart
│   │   ├── project_form.dart
│   │   └── experience_form.dart
│   └── widgets/
│       ├── item_card.dart
│       └── left_drawer.dart
├── test/
│   └── widget_test.dart
├── android/
├── ios/
├── web/
├── pubspec.yaml
└── README.md
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
