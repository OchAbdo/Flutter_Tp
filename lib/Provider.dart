import 'package:flutter/material.dart';

class ProviderTest extends ChangeNotifier {
  List<String> listTask = [];

  List<String> get getList {
    return listTask;
  }

  void addtask(String task) {
    listTask.add(task);
    notifyListeners();
  }

  void deletefrom(int x) {
    listTask.removeAt(x);
    notifyListeners();
  }
}
