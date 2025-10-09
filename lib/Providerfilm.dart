import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertp/Models/CardOb.dart';
import 'package:http/http.dart' as http;

class ProviderFilm extends ChangeNotifier {
  List<CardOb> list = [];
  int index = 0;
  bool isloading = false;

  void setindex(int x) {
    index = x;
  }

  List<CardOb> get getlist {
    return list;
  }

  Future<void> fetchFilm() async {
    isloading = true;
    notifyListeners();
    const header = {'X-Rapidapi-Key': '', 'X-Rapidapi-Host': ''};

    try {
      final reponse = await http.get(
        Uri.parse("https://imdb-top-100-movies.p.rapidapi.com"),
        headers: header,
      );
      if (reponse.statusCode == 200) {
        List<dynamic> listj = json.decode(reponse.body);
        list = listj.map((el) => CardOb.fromJson(el)).toList();
      }
    } catch (e) {
      print("erreur");
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
