import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter User Guide Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePageWithGuiding(),
    );
  }
}
