import 'package:flutter/material.dart';
import 'package:toggle_button/toggle_button.dart';
import 'home_page.dart';
import 'dart:async';

import 'menu_view_model.dart';
import 'menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

