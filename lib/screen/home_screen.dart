import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1. Data Menu Makanan (7 Pilihan sesuai request)
  final List<Map<String, String>> foodMenu = [
    {'name': 'Nasi Telur Sederhana', 'price': 'Rp 15.000'},
    {'name': 'Capcay', 'price': 'Rp 18.000'}, // Sudah diganti dari Veggie Tomato Mix
    {'name': 'Nasi Ayam Goreng', 'price': 'Rp 22.000'},
    {'name': 'Nasi Uduk Komplit', 'price': 'Rp 25.000'},
    {'name': 'Nasi Ayam Penyet', 'price': 'Rp 23.000'},
    {'name': 'Nasi Ikan Mas Goreng', 'price': 'Rp 20.000'},
    {'name': 'Nasi Ikan Tongkol Balado', 'price': 'Rp 19.000'},
  ];

  // 2. Data Menu Minuman (7 Pilihan Khas Indonesia)
  final List<Map<String, String>> drinkMenu = [
    {'name': 'Es Teh Manis', 'price': 'Rp 5.000'},
    {'name': 'Es Jeruk Peras', 'price': 'Rp 7.000'},
    {'name': 'Es Cendol Dawet', 'price': 'Rp 10.000'},
    {'name': 'Es Campur Spesial', 'price': 'Rp 12.000'},
    {'name': 'Wedang Jahe Warm', 'price': 'Rp 8.000'},
    {'name': 'Jus Alpukat Kocok', 'price': 'Rp 11.000'},
    {'name': 'Es Kelapa Muda', 'price': 'Rp 9.000'},
  ];

  // 3. Data Menu Snack/Camilan (7 Pilihan Khas Indonesia)
  final List<Map<String, String>> snackMenu = [
    {'name': 'Pisang Goreng Pasir', 'price': 'Rp 8.000'},
    {'name': 'Bakwan Sayur Garing', 'price': 'Rp 6.000'},
    {'name': 'Cireng Bumbu Rujak', 'price': 'Rp 10.000'},
    {'name': 'Tahu Isi Pedas', 'price': 'Rp 7.000'},
    {'name': 'Singkong Goreng Merekan', 'price': 'Rp 9.000'},
    {'name': 'Kue Pancong Lumer', 'price': 'Rp 12.000'},
    {'name': 'Martabak Telur Mini', 'price': 'Rp 11.000'},
  ];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFF4B3A);
    const backgroundColor = Color(0xFFF5F5F5);

    return DefaultTabController(
      length: 3, // 3 Kategori: Foods, Drinks, Snacks
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER: Tombol Menu & Keranjang Belanja
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notes_rounded, size: 30, color: Colors.black87),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined, size: 28, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // TEKS JUDUL: "Delicious food for you"
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                child: Text(
                  'Delicious\nfood for you',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Display',
                    height: 1.1,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // SEARCH BAR
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
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                      prefixIcon: Icon(Icons.search, color: Colors.black87, size: 24),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // TABBAR KATEGORI (Foods, Drinks, Snacks)
              const Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: TabBar(
                  isScrollable: true,
                  labelColor: primaryColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: primaryColor,
                  indicatorWeight: 3,
                  labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  unselectedLabelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                  tabs: [
                    Tab(text: 'Foods'),
                    Tab(text: 'Drinks'),
                    Tab(text: 'Snacks'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // TABBAR VIEW (Konten List Menu yang bisa digeser horizontal)
              Expanded(
                child: TabBarView(
                  children: [
                    _buildHorizontalMenuList(foodMenu, primaryColor, Icons.fastfood_rounded),
                    _buildHorizontalMenuList(drinkMenu, primaryColor, Icons.local_drink_rounded),
                    _buildHorizontalMenuList(snackMenu, primaryColor, Icons.cookie_rounded),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi Builder untuk membuat list menu horizontal
  Widget _buildHorizontalMenuList(List<Map<String, String>> menuList, Color primaryColor, IconData defaultIcon) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 40, right: 20, top: 40), // Top padding memberikan ruang untuk efek foto mengambang
      itemCount: menuList.length,
      itemBuilder: (context, index) {
        final item = menuList[index];
        return Container(
          width: 220,
          margin: const EdgeInsets.only(right: 30),
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none, // Mengizinkan komponen foto keluar batas atas kartu
            children: [
              // 1. Kartu Putih Latar Belakang
              Positioned(
                bottom: 0,
                child: Container(
                  width: 220,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Nama Menu
                        Text(
                          item['name']!,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.2,
                          ),
                        ),
                        // Harga Menu
                        Text(
                          item['price']!,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 2. Lingkaran Foto Menu Mengambang di Atas
              Positioned(
                top: -40,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(65),
                    // Ganti dengan Image.asset jika gambar asli dari figma sudah di-export
                    child: Icon(
                      defaultIcon,
                      size: 60,
                      color: primaryColor.withOpacity(0.7),
                    ),
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