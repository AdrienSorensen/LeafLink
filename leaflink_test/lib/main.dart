import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(LeafLinkApp());
}

class LeafLinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeafLink',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFF6FFF8),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
