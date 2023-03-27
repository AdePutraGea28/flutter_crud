import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/data.dart';
import 'screen/main_screen.dart';

// void main() {
//   runApp(const MainApp());
// }

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
          dataTableTheme: DataTableThemeData(
            dataRowColor: MaterialStateColor.resolveWith(
              (states) => Colors.white,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: MainScreen());
  }
}
