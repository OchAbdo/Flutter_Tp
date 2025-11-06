import 'package:flutter/material.dart';
import 'package:fluttertp/cars.dart';

class DetailPage extends StatelessWidget {
  final Cars car;

  const DetailPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${car.make} ${car.model}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                car.primaryPhotoUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.broken_image, size: 100),
              ),
              const SizedBox(height: 16),
              Text(
                '${car.make} ${car.model}',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Prix : ${car.price}',
                style: const TextStyle(fontSize: 22, color: Colors.blueAccent),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
