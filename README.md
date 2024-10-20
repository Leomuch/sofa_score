# Sofa Score

## Pendahuluan

Sofa Score adalah aplikasi mobile yang dirancang untuk memberikan informasi skor sepak bola secara 
real-time. Aplikasi ini memungkinkan pengguna untuk mengakses data pertandingan, melihat statistik, dan 
mendapatkan pembaruan terbaru dari berbagai liga di seluruh dunia.

## Struktur Proyek

1. main.dart : Entry point dari aplikasi yang berisi untuk route aplikasi
2. pages/landing_page.dart : Halaman untuk menampilkan bagian awal dari aplikasi
3. pages/auth.dart : Halaman untuk login dan register
4. pages/home_page : Halaman utama yang menampilkan daftar pertandingan dan beberapa widget dari bottom navigation bar

### 1. 'main.dart'

```dart
@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const LandingPage(),
      '/second': (context) => const Auth(),
      '/homePage': (context) => const HomePage(),
    },
  );
} '''


Mengembalikan widget MaterialApp sebagai antarmuka pengguna utama.
Menetapkan rute awal aplikasi dan mendefinisikan rute untuk halaman landing, autentikasi, dan halaman utama.

### 2. 'landing_page.dart'

1. Menggunakan Scaffold untuk menyediakan struktur dasar halaman, termasuk AppBar dengan judul "Sofa Score".
2. Menggunakan ListView untuk menampilkan gambar logo aplikasi, judul sambutan, dan deskripsi singkat tentang aplikasi.
3. Menggunakan ElevatedButton untuk mengarahkan pengguna ke halaman login dan registrasi ketika tombol "Get Started" ditekan.

### 3. 'auth.dart'
Halaman ini memungkinkan pengguna untuk melakukan login atau registrasi ke aplikasi Sofa Score. Pengguna dapat memilih untuk login dengan email atau nomor telepon dan memasukkan kata sandi. Di sisi registrasi, pengguna dapat mengisi data pribadi seperti nama pengguna, tanggal lahir, jenis kelamin, dan negara. Halaman ini juga memiliki fitur untuk menunjukkan atau menyembunyikan kata sandi dan mengingat akun pengguna.

1. Menggunakan Scaffold untuk menyediakan struktur dasar halaman, termasuk AppBar yang berisi judul dan TabBar.
2. TabBarView digunakan untuk menampilkan konten sesuai dengan tab yang dipilih (Sign In atau Sign Up).

### 4. 'home_page.dart'
Halaman ini adalah halaman utama aplikasi yang menampilkan informasi skor, berita terbaru, dan daftar favorit pengguna. Halaman ini juga menggunakan BottomNavigationBar untuk navigasi antar tab.

