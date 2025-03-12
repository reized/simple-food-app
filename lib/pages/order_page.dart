import 'package:flutter/material.dart';
import 'package:tugas2_lat_kuis/models/food_item.dart';

class OrderPage extends StatefulWidget {
  final FoodItem food;
  const OrderPage({super.key, required this.food});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _quantityController = TextEditingController();
  int totalPrice = 0;

  void _calculateTotal() {
    int quantity = int.tryParse(_quantityController.text) ?? 0;
    if (quantity > 0) {
      setState(() {
        totalPrice = widget.food.price * quantity;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Total Harga: Rp $totalPrice')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan jumlah yang valid!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 4,
          title: Text('Detail Pesanan')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(widget.food.image,
                  width: 200, height: 200, fit: BoxFit.cover),
            ),
            Text(widget.food.name, style: const TextStyle(fontSize: 24)),
            Text('Rp ${widget.food.price}',
                style: const TextStyle(fontSize: 20, color: Colors.grey)),
            const SizedBox(height: 10),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah Pesanan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            if (totalPrice > 0)
              Text('Total: Rp $totalPrice',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
              onPressed: _calculateTotal,
              child: const Text('Pesan Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
