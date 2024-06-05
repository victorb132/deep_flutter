import 'package:deep_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
            .copyWith(background: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  );
}
