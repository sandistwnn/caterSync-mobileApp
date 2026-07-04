import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/api_provider.dart';
import '../models/food_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  void initState() {
    super.initState();
    // Memanggil API saat halaman Home dibuka
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ApiProvider>(context, listen: false).fetchFoods();
    });
  }

  // Data Lokal untuk Minuman
  final List<Map<String, String>> drinkMenu = [
    {'name': 'Es Teh Manis', 'price': 'Rp 5.000', 'image': 'assets/images/placeholder.png'},
    {'name': 'Es Jeruk', 'price': 'Rp 7.000', 'image': 'assets/images/placeholder.png'},
  ];

  // Data Lokal untuk Snack
  final List<Map<String, String>> snackMenu = [
    {'name': 'Pisang Goreng', 'price': 'Rp 8.000', 'image': 'assets/images/placeholder.png'},
    {'name': 'Bakwan Sayur', 'price': 'Rp 6.000', 'image': 'assets/images/placeholder.png'},
  ];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFF4B3A);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: const Icon(Icons.notes_rounded, size: 30), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.shopping_cart_outlined, size: 28), onPressed: () {}),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                child: Text('Delicious\nfood for you', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, height: 1.1)),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEEEE),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: TabBar(
                  isScrollable: true,
                  labelColor: primaryColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: primaryColor,
                  tabs: [Tab(text: 'Foods'), Tab(text: 'Drinks'), Tab(text: 'Snacks')],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  children: [
                    // MENGAMBIL DATA MAKANAN DARI API
                    Consumer<ApiProvider>(
                      builder: (context, api, child) {
                        if (api.isLoading) {
                          return const Center(child: CircularProgressIndicator(color: primaryColor));
                        }
                        if (api.foods.isEmpty) {
                          return const Center(child: Text('Tidak ada data makanan'));
                        }
                        return _buildApiMenuList(api.foods, primaryColor);
                      },
                    ),
                    _buildLocalMenuList(drinkMenu, primaryColor, Icons.local_drink),
                    _buildLocalMenuList(snackMenu, primaryColor, Icons.cookie),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi Render Khusus API (Menggunakan Model Food)
  Widget _buildApiMenuList(List<Food> menuList, Color primaryColor) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 40, right: 20, top: 40),
      itemCount: menuList.length,
      itemBuilder: (context, index) {
        final item = menuList[index];
        return Container(
          width: 220,
          margin: const EdgeInsets.only(right: 30),
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: 220,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 15, offset: const Offset(0, 10))],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.name, textAlign: TextAlign.center, maxLines: 2, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(item.price, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: primaryColor)),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -40,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(65),
                    child: Icon(Icons.fastfood, size: 60, color: primaryColor.withValues(alpha: 0.7)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Fungsi Render Khusus Data Lokal Manual
  Widget _buildLocalMenuList(List<Map<String, String>> menuList, Color primaryColor, IconData icon) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 40, right: 20, top: 40),
      itemCount: menuList.length,
      itemBuilder: (context, index) {
        final item = menuList[index];
        return Container(
          width: 220,
          margin: const EdgeInsets.only(right: 30),
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: 220,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 15, offset: const Offset(0, 10))],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item['name']!, textAlign: TextAlign.center, maxLines: 2, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(item['price']!, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: primaryColor)),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -40,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(65),
                    child: Icon(icon, size: 60, color: primaryColor.withValues(alpha: 0.7)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}