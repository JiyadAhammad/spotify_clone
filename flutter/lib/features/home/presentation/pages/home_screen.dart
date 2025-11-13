import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static CupertinoPageRoute<HomeScreen> pageRoute() =>
      CupertinoPageRoute<HomeScreen>(
        builder: (BuildContext context) => const HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
