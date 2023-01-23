import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TikTok Clone',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
                titleTextStyle: (TextStyle(
                    color: Colors.black,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600))),
            primaryColor: const Color(0xFFE9435A),
            textSelectionTheme:
                const TextSelectionThemeData(cursorColor: Color(0xFFE9435A)),
            scaffoldBackgroundColor: Colors.white),
        home: const MainNavigationScreen());
  }
}
