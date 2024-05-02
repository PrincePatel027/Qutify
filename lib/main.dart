import 'package:flutter/material.dart';
import 'package:quotify/screens/detail_page.dart';
import 'package:quotify/screens/home_page.dart';
import 'package:quotify/screens/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splashScreen",
      routes: {
        'splashScreen': (context) => const SplashScreen(),
        '/': (context) => const HomePage(),
        'detailPage': (context) => const DetailPage(),
      },
    ),
  );
}
