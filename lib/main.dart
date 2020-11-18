import 'package:aplikasi_nama_planet/Planet_Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planbet',
      theme: ThemeData(
        primarySwatch: Colors.black,
        canvasColor: Colors.black45,
      ),
      home: PlanetHome(),
    );
  }
}
