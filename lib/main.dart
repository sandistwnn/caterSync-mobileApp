import 'package:flutter/material.dart';
import 'screen/onboarding_screen.dart';
import 'screen/login_screen.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CaterSync',
      debugShowCheckedModeBanner: false, // Menghilangkan banner DEBUG di pojok kanan atas
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFFFF4B3A),
      ),
      // Halaman pertama yang akan muncul saat aplikasi dibuka
      home: const OnboardingScreen(), 
      
      // Mendaftarkan rute halaman agar nanti perpindahan halaman tinggal panggil namanya
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}