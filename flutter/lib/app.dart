import 'package:flutter/material.dart';

import 'core/theme/theme_data/theme.dart';
import 'features/auth/presentation/pages/signup_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      theme: AppTheme.lightTheme,
      home: const SignupScreen(),
    );
  }
}
