import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/food_model.dart';

class ApiProvider with ChangeNotifier {
  List<Food> _foods = [];
  bool _isLoading = false;

  List<Food> get foods => _foods;
  bool get isLoading => _isLoading;

  Future<void> fetchFoods() async {
    _isLoading = true;
    Future.microtask(() => notifyListeners()); // Beri tahu layar untuk memunculkan loading

    try {
      // Ini adalah contoh URL API Mockup.
      // API ini akan merespon dengan data JSON berisi daftar makanan.
      final url = Uri.parse('https://65f3a093105614e654a0f443.mockapi.io/api/v1/foods');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _foods = data.map((item) => Food.fromJson(item)).toList();
      } else {
        throw Exception('Gagal memuat data dari server');
      }
    } catch (error) {
      debugPrint('Error: $error');
      // FALLBACK: Jika internet mati / API error, tampilkan data cadangan ini
      _foods = [
        Food(id: '1', name: 'Nasi Telur (Offline)', price: 'Rp 15.000', image: 'assets/images/nasi_telur.png'),
        Food(id: '2', name: 'Capcay (Offline)', price: 'Rp 18.000', image: 'assets/images/capcay.png'),
      ];
    }

    _isLoading = false;
    notifyListeners(); // Beri tahu layar bahwa data sudah siap
  }
}