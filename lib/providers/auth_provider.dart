import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  
  // Variabel untuk memantau apakah sedang loading
  bool get isLoading => _isLoading;

  // Fungsi untuk melakukan Login
  Future<bool> login(String email) async {
    _isLoading = true;
    notifyListeners(); // Memberitahu UI untuk update (misal: munculkan loading)

    // Simulasi jeda waktu seolah-olah sedang mengecek ke server internet
    await Future.delayed(const Duration(seconds: 2));

    // 1. Panggil Shared Preferences (Local Storage)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // 2. Simpan status login sebagai TRUE
    await prefs.setBool('isLoggedIn', true);
    
    // 3. (Opsional) Simpan email pengguna
    await prefs.setString('userEmail', email);

    _isLoading = false;
    notifyListeners();
    
    return true; // Kembalikan nilai true jika berhasil
  }

  // Fungsi untuk Logout (keluar aplikasi)
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Hapus semua data di local storage
    notifyListeners();
  }
}