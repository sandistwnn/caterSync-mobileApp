class Food {
  final String id;
  final String name;
  final String price;
  final String image;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  // Fungsi untuk mengubah data JSON dari API menjadi objek Food
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Tanpa Nama',
      price: json['price'] ?? 'Rp 0',
      image: json['image'] ?? 'assets/images/placeholder.png', 
    );
  }
}