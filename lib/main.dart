import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
          .copyWith(background: Colors.black),
    ),
    debugShowCheckedModeBanner: false,
    home: const Home(),
  ));
}
