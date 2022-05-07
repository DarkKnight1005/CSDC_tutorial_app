import 'package:flutter/material.dart';
import 'package:myapp/ui/screens/home_screen.dart';
import 'package:myapp/ui/screens/login_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}