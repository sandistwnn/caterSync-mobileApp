# CaterSync Mobile App

**Status**: Early Development  
**Platform**: Flutter (Multi-platform: iOS, Android, Web, Windows)

---

## 📋 Project Overview

CaterSync adalah aplikasi mobile untuk memesan makanan dan minuman dengan antarmuka yang menarik. Aplikasi ini dibangun menggunakan **Flutter** dengan fokus pada user experience yang baik dan design yang modern sesuai dengan Figma mockup.

### Fitur Utama
- **Onboarding Screen**: Halaman perkenalan dengan animasi dan karakter 3D
- **Login/Sign-up Screen**: Autentikasi user dengan form lengkap (email, password, confirm password)
- **Home Screen**: Menampilkan menu makanan, minuman, dan camilan dengan kategori tab
- **Navigation**: Routing antar halaman dengan Navigator
- **Responsive Design**: Mendukung berbagai ukuran layar

---

## 🛠️ Tech Stack

- **Framework**: Flutter 3.44.1
- **Language**: Dart 3.12.1
- **UI**: Material Design 3
- **State Management**: StatefulWidget (built-in Flutter)

---

## 📁 Project Structure

```
catersync_app/
├── lib/
│   ├── main.dart              # Entry point aplikasi
│   └── screen/
│       ├── onboarding_screen.dart    # Halaman perkenalan
│       ├── login_screen.dart         # Halaman login & sign-up
│       └── home_screen.dart          # Halaman menu utama
├── images/
│   ├── Picture1-cewe.png      # Gambar karakter cewe
│   ├── Picture2-cowo.png      # Gambar karakter cowo
│   └── Picture3-logo.png      # Logo CaterSync
├── pubspec.yaml               # Dependencies dan konfigurasi
├── analysis_options.yaml      # Linter rules
├── android/                   # Android native code
├── ios/                       # iOS native code
├── web/                       # Web build files
└── README.md                  # Dokumentasi ini
```

---

## 🎨 Screens & Features

### 1. **Onboarding Screen** (`lib/screen/onboarding_screen.dart`)
- **Warna**: Gradient orange-red (#FF4B3A → #FF6347)
- **Header**: Logo CaterSync + text "Food for Everyone"
- **Karakter**: Cewe (220×280px, kiri) & Cowo (120×160px, kanan)
- **CTA**: Tombol "Get started" → navigasi ke Login

### 2. **Login/Sign-up Screen** (`lib/screen/login_screen.dart`)
- **Warna**: Abu-abu terang (#F5F5F5) + putih header
- **Tab**: Login & Sign-up (DefaultTabController)
- **Form Login**:
  - Email address (TextEditingController)
  - Password dengan toggle visibility
  - Link "Forgot passcode?" (dialog popup)
  - Tombol "Login" → Home Screen
  
- **Form Sign-up** (Scrollable dengan SingleChildScrollView):
  - Name
  - Email address
  - Password dengan toggle visibility
  - Confirm Password dengan toggle visibility
  - Tombol "Sign-up" → Home Screen

### 3. **Home Screen** (`lib/screen/home_screen.dart`)
- **Header**: Menu icon + Shopping cart icon
- **Judul**: "Delicious food for you"
- **Search Bar**: TextField dengan search icon
- **Tab Menu**: Foods, Drinks, Snacks
- **Horizontal List**: Daftar menu dengan card bergambar
- **Card Item**:
  - Lingkaran foto (130×130px) di atas
  - Nama menu
  - Harga menu
  - Bayangan smooth

**Data Menu**:
- **Foods** (7 item): Nasi Telur, Capcay, Nasi Ayam Goreng, Nasi Uduk, Nasi Ayam Penyet, Ikan Mas, Ikan Tongkol Balado
- **Drinks** (7 item): Es Teh Manis, Es Jeruk Peras, Es Cendol, Es Campur, Wedang Jahe, Jus Alpukat, Es Kelapa
- **Snacks** (7 item): Pisang Goreng, Bakwan Sayur, Cireng, Tahu Isi, Singkong Goreng, Kue Pancong, Martabak

---

## 🚀 Cara Menjalankan Aplikasi

### Prerequisites
```bash
# Install Flutter (jika belum)
# Download dari: https://flutter.dev/docs/get-started/install

# Verifikasi instalasi
flutter doctor
```

### Development (Chrome/Web)
```bash
cd d:\catersync_app
flutter pub get
flutter run -d chrome
```

### Development (Android Emulator)
```bash
# 1. Buat virtual device di Android Studio
# Tools → AVD Manager → Create Virtual Device

# 2. Jalankan emulator
# Atau jalankan dari AVD Manager

# 3. Run aplikasi
cd d:\catersync_app
flutter run
```

### Build Release APK (Android)
```bash
flutter build apk
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### Build Web
```bash
flutter build web
# Output: build/web/
```

---

## 📋 Fitur yang Sudah Dikerjakan

### ✅ UI/UX Implementation
- [x] Onboarding screen dengan gradient background
- [x] Logo dan branding CaterSync
- [x] Karakter 3D (cewe & cowo) pada onboarding
- [x] Login screen dengan tab switching
- [x] Sign-up form dengan password confirmation
- [x] Home screen dengan menu categories
- [x] Responsive design untuk berbagai ukuran layar
- [x] Smooth shadow & border radius

### ✅ Navigation & Routing
- [x] Setup routes di main.dart
- [x] Get Started button → Login Screen
- [x] Login button → Home Screen
- [x] Sign-up button → Home Screen
- [x] DefaultTabController untuk tab switching

### ✅ Form & State Management
- [x] TextEditingController untuk email, password, confirm password
- [x] Password visibility toggle dengan Icon button
- [x] Forgot password dialog popup
- [x] Form validation logic (placeholder)

### ✅ Assets & Images
- [x] Setup folder struktur assets
- [x] Add images ke pubspec.yaml
- [x] Replace Icon dengan Image.asset di ketiga screen
- [x] Logo CaterSync di setiap halaman
- [x] Karakter cewe & cowo di onboarding

### ✅ Code Quality
- [x] Flutter analyze (no critical errors)
- [x] Clean code structure
- [x] Descriptive comments (Bahasa Indonesia)
- [x] Consistent styling

---

## 📝 Konfigurasi Assets

### Daftar Assets di `pubspec.yaml`
```yaml
flutter:
  assets:
    - assets/images/
    - images/
```

### Lokasi File Gambar
- `images/Picture1-cewe.png` - Karakter cewe
- `images/Picture2-cowo.png` - Karakter cowo
- `images/Picture3-logo.png` - Logo CaterSync

---

## 🔧 Customization Guide

### Ubah Warna Tema
File: `lib/main.dart` & setiap screen
```dart
const primaryColor = Color(0xFFFF4B3A);  // Warna merah-orange
const backgroundColor = Color(0xFFF5F5F5); // Abu-abu terang
```

### Ubah Ukuran Font
File: Masing-masing screen (TextStyle)
```dart
fontSize: 34,  // Ubah angka ini
fontWeight: FontWeight.bold,
```

### Tambah Menu Item
File: `lib/screen/home_screen.dart`
```dart
final List<Map<String, String>> foodMenu = [
  {'name': 'Menu Baru', 'price': 'Rp XX.XXX'},
  // ... tambah item lain
];
```

### Ganti Gambar
File: `lib/screen/onboarding_screen.dart`, `login_screen.dart`
```dart
Image.asset(
  'images/Picture3-logo.png',  // Ganti nama file
  width: 80,
  height: 80,
  fit: BoxFit.contain,
),
```

---

## ⚠️ Known Issues & TODO

### Tidak Selesai
- [ ] Backend API integration (login/register)
- [ ] Database untuk menyimpan user & order history
- [ ] Payment integration
- [ ] Order tracking
- [ ] Review & rating system
- [ ] Push notifications

### Minor Issues
- `withOpacity` deprecated → gunakan `.withValues()` di versi terbaru
- Home screen menu items masih menggunakan placeholder icon
- Forgot password dialog belum connect ke backend

---

## 📚 Dokumentasi Useful Links

- [Flutter Official Docs](https://flutter.dev/docs)
- [Dart Language](https://dart.dev)
- [Material Design 3](https://m3.material.io/)
- [Figma untuk UI Design](https://www.figma.com)

---

## 👤 Development Notes

### Font Family
- SF Pro Text (untuk body text)
- SF Pro Display (untuk heading/judul besar)
- Default: Roboto (Material Design default)

### Color Palette
| Warna | Hex Code | Keterangan |
|-------|----------|-----------|
| Primary | #FF4B3A | Merah-orange (CTA button) |
| Accent | #FA4A0C | Orange terang (button text) |
| Background | #F5F5F5 | Abu-abu terang |
| Text Dark | #000000 | Teks hitam |
| Text Light | #999999 | Teks abu-abu |

### Responsive Breakpoints
- Mobile: < 600px
- Tablet: 600px - 1200px
- Desktop: > 1200px

---

## 🔄 Workflow untuk Development Lanjutan

### 1. Setup Environment
```bash
cd d:\catersync_app
flutter pub get
```

### 2. Run Development
```bash
flutter run -d chrome
# atau untuk Android:
flutter run
```

### 3. Hot Reload
Saat aplikasi berjalan, tekan `r` di terminal untuk hot reload (cepat) atau `R` untuk full restart.

### 4. Testing
```bash
flutter test
```

### 5. Build & Deploy
```bash
# Android
flutter build apk

# iOS
flutter build ios

# Web
flutter build web
```

---

## 📞 Support & Questions

Untuk pertanyaan atau issue yang ditemukan, silakan:
1. Check `flutter analyze` untuk compile issues
2. Check terminal output untuk runtime errors
3. Lihat dokumentasi Flutter resmi

---

## 📄 License

Private Project - CaterSync

---

**Terakhir diupdate**: 11 Juni 2026  
**Flutter Version**: 3.44.1  
**Dart Version**: 3.12.1
