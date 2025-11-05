import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertp/cars.dart';
import 'package:http/http.dart' as http;

class Apiprovider extends ChangeNotifier {
  String url =
      "https://corsproxy.io/?https://auto.dev/api/listings?apiKey=sk_ad_Ej56PFsouZpyVC7dc_dPTsAm";

  List<Cars> listcars = [];

  List<Cars> get getlist {
    return listcars;
  }

  Future<void> fetchcar() async {
    try {
      final reponse = await http.get(Uri.parse(url));
      if (reponse.statusCode == 200) {
        final data = json.decode(reponse.body);
        List<dynamic> list = data['records'];
        listcars = list.map((c) => Cars.fromJson(c)).toList();
        //print(listcars);
      }
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }
}
