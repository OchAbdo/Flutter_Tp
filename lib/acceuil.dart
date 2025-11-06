import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertp/cars.dart';
import 'package:fluttertp/detailpage.dart';
import 'package:fluttertp/provider/apiprovider.dart';
import 'package:provider/provider.dart';

class Acceuil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Apiprovider>();
    Future.microtask(() {
      if (provider.listcars.isEmpty) {
        context.read<Apiprovider>().fetchcar();
        print(context.watch<Apiprovider>().getlist);
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Title(color: Colors.green, child: Text("Flutter App")),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ */
              CarouselSlider(
                options: CarouselOptions(
                  height: 600,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),
                items: context.watch<Apiprovider>().getlist.map((car) {
                  print(car);
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          // 👉 Lors du clic, on envoie l'objet car à la page DetailPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailPage(car: car),
                            ),
                          );
                        },
                        child: Container(
                          width: 900,
                          height: 900,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Image de la voiture
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: Image.network(
                                  car.primaryPhotoUrl,
                                  fit: BoxFit.cover,
                                  height: 450,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 180,
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          color: Colors.grey,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // Détails du véhicule
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${car.make} ${car.model}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      car.price,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              /*     ],
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
