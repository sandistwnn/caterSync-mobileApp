import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const textButtonColor = Color(0xFFFA4A0C);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // Membuat gradasi latar belakang dari atas ke bawah
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF4B3A),
              Color(0xFFFF6347), // Gradasi halus ke arah bawah
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  
                  // 1. Bagian Header (Logo + Nama Brand)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      children: [
                        // Lingkaran Putih tempat Logo
                        Container(
                          width: 55,
                          height: 55,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            // Logo CaterSync
                            child: Image.asset(
                              'images/Picture3-logo.png',
                              width: 28,
                              height: 28,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Teks Brand "CaterSync"
                        const Text(
                          'CaterSync',
                          style: TextStyle(
                            fontFamily: 'SF Pro Text', // Sesuaikan font di Figma
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 40),

                  // 2. Teks Headline "Food for Everyone"
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      'Food for\nEveryone',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 56, // Ukuran teks besar khas onboarding
                        fontWeight: FontWeight.w900, // Heavy / Black font weight
                        color: Colors.white,
                        height: 1.1, // Mengatur kerapatan baris teks
                        letterSpacing: -1.0,
                      ),
                    ),
                  ),

                  // 3. Bagian Gambar Ilustrasi Karakter 3D (Mengisi ruang kosong)
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          // Gambar cewe (Girl) - lebih besar di kiri
                          Positioned(
                            bottom: -20,
                            left: 0,
                            child: Image.asset(
                              'images/Picture1-cewe.png',
                              width: 220,
                              height: 280,
                              fit: BoxFit.contain,
                            ),
                          ),
                          // Gambar cowo (Boy) - lebih kecil di kanan
                          Positioned(
                            bottom: 20,
                            right: 10,
                            child: Image.asset(
                              'images/Picture2-cowo.png',
                              width: 120,
                              height: 160,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 4. Tombol "Get starteed" di bagian paling bawah
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 36.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 65, // Tinggi tombol yang nyaman untuk ditekan
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Stadium Border melengkung penuh
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Get started',
                          style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: textButtonColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}