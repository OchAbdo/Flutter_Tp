import 'package:flutter/material.dart';
import 'package:fluttertp/Models/CardOb.dart';
import 'package:fluttertp/Providerfilm.dart';
import 'package:fluttertp/detail.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ProviderFilm(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => PageHome(), '/detail': (context) => Detail()},
    );
  }
}

class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProviderFilm>();
    Future.microtask(() {
      if (!provider.isloading && provider.list.isEmpty)
        context.read<ProviderFilm>().fetchFilm();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Tp3"),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Center(
        child: provider.isloading
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: context.watch<ProviderFilm>().getlist.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            context.read<ProviderFilm>().setindex(i);
                            Navigator.pushNamed(context, '/detail');
                          },
                          child: Formcard(
                            movie: context.watch<ProviderFilm>().getlist[i],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class Formcard extends StatelessWidget {
  CardOb movie;
  Formcard({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Container(
                height: 500,
                width: double.infinity,
                child: Image.network(movie.url, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                movie.titre,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
