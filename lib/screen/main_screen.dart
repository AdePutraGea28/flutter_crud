import 'package:flutter/material.dart';
import '../navigation/my_bottom_navigation.dart';
import 'beranda/beranda_content.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedMenu = 0;

  void _onTapItem(int index) {
    setState(() {
      print(index);
      _selectedMenu = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 49, 49),
      appBar: AppBar(toolbarHeight: 0, backgroundColor: Colors.black),
      body: _selectedMenu == 0
          ? BerandaContent()
          : _selectedMenu == 1
              ? const Center(
                  child: Text(
                  "INI HALAMAN SEARCH",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w800),
                ))
              : const Center(
                  child: Text(
                  "INI HALAMAN PROFILE",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.w800),
                )),
      bottomNavigationBar: MyBottomNavigation(
        selectedMenu: _selectedMenu,
        onTap: _onTapItem,
      ),
    );
  }
}
