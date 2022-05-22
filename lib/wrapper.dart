import 'package:flutter/material.dart';
import 'package:myapp/provider/monument_state.dart';
import 'package:myapp/ui/screens/home_screen.dart';
import 'package:myapp/ui/screens/login_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MonumentState>(create: (_) => MonumentState()),
      ],
      child: HomeScreen(),
    );
  }
}