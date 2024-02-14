import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:voice_verse/navigation_bar/navigation_bar.dart';




void main() {
  Paint.enableDithering= true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarWidget(),
      );
  }
}
