import 'package:flutter/material.dart';
import 'package:fluttertp/Models/CardOb.dart';

class ProviderFilm extends ChangeNotifier {
  List<CardOb> list = [
    new CardOb(titre: "Game Of Throne", url: "assets/got.jpg"),
    new CardOb(titre: "MiniCraft", url: "assets/mini.jpg"),
    new CardOb(titre: "Jordan Peele", url: "assets/jordanpeele.jpg"),
  ];

  List<CardOb> get getlist {
    return list;
  }
}
