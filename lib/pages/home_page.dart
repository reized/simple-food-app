import 'package:flutter/material.dart';
import 'package:tugas2_lat_kuis/pages/login_page.dart';
import 'package:tugas2_lat_kuis/pages/order_page.dart';
import '../models/food_item.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  final List<FoodItem> foodMenu = const [
    FoodItem(name: 'Nasi Sayur', price: 8000, image: 'assets/nasi-sayur.jpg'),
    FoodItem(name: 'Nasi Pecel', price: 10000, image: 'assets/nasi-pecel.jpg'),
    FoodItem(
        name: 'Indomie Goreng',
        price: 7000,
        image: 'assets/indomie-goreng.jpeg'),
    FoodItem(
        name: 'Indomie Kuah', price: 7000, image: 'assets/indomie-kuah.jpeg'),
    FoodItem(name: 'Air Putih', price: 1000, image: 'assets/air-putih.jpg'),
    FoodItem(name: 'Es Teh', price: 3000, image: 'assets/es-teh.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 4,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Warmindo MJ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Selamat datang, $username!',
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            )
          ]),
      body: Column(
        children: [
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset('assets/banner.png',
                height: 150, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Daftar Menu',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: ListView.builder(
              itemCount: foodMenu.length,
              itemBuilder: (context, index) {
                final food = foodMenu[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(food.image,
                        width: 50, height: 50, fit: BoxFit.cover),
                  ),
                  title: Text(food.name),
                  subtitle: Text('Rp ${food.price}'),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderPage(food: food),
                        ),
                      );
                    },
                    child: const Text('Pesan'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
