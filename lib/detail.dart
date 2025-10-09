import 'package:flutter/material.dart';
import 'package:fluttertp/Providerfilm.dart';
import 'package:provider/provider.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int x = context.watch<ProviderFilm>().index;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "nom de film :  ${context.watch<ProviderFilm>().getlist[x].titre}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
