import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyModel extends ChangeNotifier {
  List _data = [
    {"id": 1, "name": "ade", "email": "ade@gmail.com", "gender": "Male"},
    {
      "id": 2,
      "name": "sobirin",
      "email": "sobirin@gmail.com",
      "gender": "Male"
    },
    {"id": 3, "name": "cris", "email": "cris@gmail.com", "gender": "Male"},
    {"id": 4, "name": "apis", "email": "apis@gmail.com", "gender": "Male"}
  ];

  List get data => _data;

  void updateValue(List newValue) {
    _data = newValue;
    notifyListeners();
  }
}
