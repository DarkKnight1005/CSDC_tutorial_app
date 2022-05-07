import 'package:flutter/material.dart';
import 'package:myapp/ui/screens/home_screen.dart';
import 'package:myapp/wrapper.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }
}