import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../services/notification_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk mengambil data dari inputan text field
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _registerNameController = TextEditingController();
  final TextEditingController _registerEmailController = TextEditingController();
  final TextEditingController _loginPasswordController = TextEditingController();
  final TextEditingController _registerPasswordController = TextEditingController();
  final TextEditingController _registerConfirmPasswordController = TextEditingController();

  bool _loginObscure = true;
  bool _registerObscure = true;
  bool _registerConfirmObscure = true;

  @override
  void dispose() {
    _loginEmailController.dispose();
    _registerNameController.dispose();
    _registerEmailController.dispose();
    _loginPasswordController.dispose();
    _registerPasswordController.dispose();
    _registerConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFF4B3A);
    const backgroundColor = Color(0xFFF5F5F5); // Warna abu-abu terang latar belakang

    return DefaultTabController(
      length: 2, // 2 Tab: Login dan Sign-up
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: SizedBox(
            // Memastikan tinggi halaman pas dengan layar agar background abu-abu penuh
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                // 1. HEADER CARD (Bagian Putih Atas yang Melengkung)
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.42, // Ambil 42% tinggi layar
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1A000000),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const SafeArea(
                    bottom: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        // Tempat Logo Topi Koki CaterSync
                        Icon(
                          Icons.restaurant_menu,
                          size: 80,
                          color: primaryColor,
                        ),
                        Spacer(),
                        
                        // TabBar (Tombol Pindah Login / Sign-up)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: primaryColor,
                            indicatorWeight: 3,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF Pro Text',
                            ),
                            unselectedLabelStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF Pro Text',
                            ),
                            tabs: [
                              Tab(text: 'Login'),
                              Tab(text: 'Sign-up'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 2. KONTEN FORM (Mengikuti Tab yang Sedang Aktif)
                Expanded(
                  child: TabBarView(
                    children: [
                      // Tampilan Form Login
                      _buildLoginForm(primaryColor),
                      
                      // Tampilan Form Sign-up
                      _buildSignUpForm(primaryColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget Form Login
  Widget _buildLoginForm(Color primaryColor) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          _buildTextField(
            label: 'Email address',
            controller: _loginEmailController,
            hint: 'sandisetiawan@gmail.com',
          ),
          const SizedBox(height: 20),
          _buildPasswordField(
            label: 'Password',
            controller: _loginPasswordController,
            hint: '*********',
            obscureText: _loginObscure,
            onToggle: () {
              setState(() {
                _loginObscure = !_loginObscure;
              });
            },
          ),
          const Spacer(),
          // Tombol Login Terintegrasi Provider, Shared Preferences & Notifikasi
          Consumer<AuthProvider>(
            builder: (context, auth, child) {
              return _buildActionButton(
                text: auth.isLoading ? 'Loading...' : 'Login',
                color: primaryColor,
                onPressed: auth.isLoading ? () {} : () async {
                  String email = _loginEmailController.text;
                  String password = _loginPasswordController.text;
                  
                  if (email.isNotEmpty && password.isNotEmpty) {
                    bool success = await auth.login(email);
                    
                    if (success && context.mounted) {
                      // Memunculkan Fitur Perangkat: Local Notification
                      NotificationService.showNotification(
                        id: 1,
                        title: 'Login Berhasil! 🎉',
                        body: 'Selamat datang kembali di CaterSync.',
                      );
                      
                      // Pindah Halaman ke Home
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Email dan Password tidak boleh kosong!')),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget Form Sign-up
  Widget _buildSignUpForm(Color primaryColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              label: 'Name',
              controller: _registerNameController,
              hint: 'Sandi Setiawan',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Email address',
              controller: _registerEmailController,
              hint: 'sandisetiawan@gmail.com',
            ),
            const SizedBox(height: 16),
            _buildPasswordField(
              label: 'Password',
              controller: _registerPasswordController,
              hint: '*********',
              obscureText: _registerObscure,
              onToggle: () {
                setState(() {
                  _registerObscure = !_registerObscure;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildPasswordField(
              label: 'Confirm Password',
              controller: _registerConfirmPasswordController,
              hint: '*********',
              obscureText: _registerConfirmObscure,
              onToggle: () {
                setState(() {
                  _registerConfirmObscure = !_registerConfirmObscure;
                });
              },
            ),
            const SizedBox(height: 30),
            // Tombol Sign-up
            _buildActionButton(
              text: 'Sign-up',
              color: primaryColor,
              onPressed: () {
                if (_registerEmailController.text.isNotEmpty && _registerNameController.text.isNotEmpty) {
                  // Simulasi pendaftaran langsung masuk ke Home
                  NotificationService.showNotification(
                    id: 2,
                    title: 'Pendaftaran Berhasil! 🚀',
                    body: 'Akun CaterSync Anda telah aktif.',
                  );
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Semua field wajib diisi!')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Komponen Input Teks Biasa
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
            fontFamily: 'SF Pro Text',
          ),
        ),
        TextField(
          controller: controller,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black.withValues(alpha: 0.2)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black87, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ],
    );
  }

  // Komponen Input Password dengan Toggle Mata Obscure
  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required bool obscureText,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
            fontFamily: 'SF Pro Text',
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black.withValues(alpha: 0.2)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black87, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.black38,
              ),
              onPressed: onToggle,
            ),
          ),
        ),
      ],
    );
  }

  // Komponen Tombol Utama di bagian bawah form
  Widget _buildActionButton({
    required String text,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'SF Pro Text',
          ),
        ),
      ),
    );
  }
}