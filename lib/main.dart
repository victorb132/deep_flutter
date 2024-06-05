import 'package:deep_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DeepFlutter());
}

class DeepFlutter extends StatelessWidget {
  const DeepFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deep Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
