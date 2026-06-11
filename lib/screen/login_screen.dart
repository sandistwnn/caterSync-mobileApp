import 'package:flutter/material.dart';

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
                  decoration: BoxDecoration(
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
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        // Tempat Logo Topi Koki CaterSync
                        // Logo
                        Image.asset(
                          'images/Picture3-logo.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        const Spacer(),
                        
                        // TabBar (Tombol Pindah Login / Sign-up)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
          const SizedBox(height: 20),
          _buildTextField(
            label: 'Email address',
            controller: _loginEmailController,
            hint: 'sandisetiawan@gmail.com',
          ),
          const SizedBox(height: 24),
          // Password field
          const Text(
            'Password',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
              fontFamily: 'SF Pro Text',
            ),
          ),
          TextField(
            controller: _loginPasswordController,
            obscureText: _loginObscure,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              hintText: '********',
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black26),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 1.5),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              suffixIcon: IconButton(
                icon: Icon(_loginObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _loginObscure = !_loginObscure),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Forgot passcode'),
                    content: const Text("Password reset isn't implemented yet."),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
                    ],
                  ),
                );
              },
              child: Text('Forgot passcode?', style: TextStyle(color: primaryColor)),
            ),
          ),
          const Spacer(),
          // Tombol Login
          _buildActionButton(
            text: 'Login',
            onPressed: () {
              // Pindah ke halaman Home jika sukses login
              Navigator.pushReplacementNamed(context, '/home');
            },
            color: primaryColor,
          ),
        ],
      ),
    );
  }

  // Widget Form Sign-up
  Widget _buildSignUpForm(Color primaryColor) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 20),
          _buildTextField(
            label: 'Name',
            controller: _registerNameController,
            hint: 'Sandi Setiawan',
          ),
          const SizedBox(height: 24),
          _buildTextField(
            label: 'Email address',
            controller: _registerEmailController,
            hint: 'sandisetiawan@gmail.com',
          ),
          const SizedBox(height: 24),
          // Password
          const Text(
            'Password',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
              fontFamily: 'SF Pro Text',
            ),
          ),
          TextField(
            controller: _registerPasswordController,
            obscureText: _registerObscure,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              hintText: '********',
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black26),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 1.5),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              suffixIcon: IconButton(
                icon: Icon(_registerObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _registerObscure = !_registerObscure),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Confirm Password',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
              fontFamily: 'SF Pro Text',
            ),
          ),
          TextField(
            controller: _registerConfirmPasswordController,
            obscureText: _registerConfirmObscure,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              hintText: '********',
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black26),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 1.5),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              suffixIcon: IconButton(
                icon: Icon(_registerConfirmObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _registerConfirmObscure = !_registerConfirmObscure),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Tombol Sign-up
          _buildActionButton(
            text: 'Sign-up',
            onPressed: () {
              // Aksi setelah register, misal langsung login dan ke Home
              Navigator.pushReplacementNamed(context, '/home');
            },
            color: primaryColor,
          ),
          const SizedBox(height: 40),
        ],
      ),
      ),
    );
  }

  // Berbagi komponen TextField agar kode tetap bersih (Clean Code)
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
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.2)),
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