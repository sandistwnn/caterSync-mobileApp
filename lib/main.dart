import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screen/onboarding_screen.dart';
import 'screen/login_screen.dart';
import 'screen/home_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/api_provider.dart';
import 'services/notification_service.dart';
// Nanti file provider ini akan kita buat di langkah selanjutnya
// import 'providers/auth_provider.dart';
// import 'providers/api_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.initialize();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    // MultiProvider digunakan untuk membungkus seluruh aplikasi dengan State Management
    return MultiProvider(
      providers: [
        // Kita siapkan Provider dummy dulu agar tidak error.
        // Nanti kita ganti dengan AuthProvider & ApiProvider yang asli.
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ApiProvider()),
      ],
      child: MaterialApp(
        title: 'CaterSync',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color(0xFFFF4B3A),
        ),
        
        // LOGIKA PENGECEKAN:
        // Jika isLoggedIn true (sudah login), langsung tembak ke /home.
        // Jika false (belum login), masuk ke /onboarding.
        initialRoute: isLoggedIn ? '/home' : '/onboarding',
        
        routes: {
          '/onboarding': (context) => const OnboardingScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}