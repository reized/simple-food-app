import 'package:flutter/material.dart';
import 'package:tugas2_lat_kuis/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warmindo MJ',
      theme: ThemeData(
          primaryColor: Color(0xFF03A54F),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: Color(0xFF03A54F)),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                      Color(0xFF03A54F)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xFF03A54F),
                  width: 2),
            ),
          )),
      home: const LoginPage(),
    );
  }
}
