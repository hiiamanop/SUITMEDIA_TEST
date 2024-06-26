import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suit_test_app/provider/app_state.dart';
import 'package:suit_test_app/views/1stScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: FirstScreen(),
    );
  }
}