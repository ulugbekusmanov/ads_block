import 'package:ads_blocker/pages/instructions_pages.dart';
import 'package:ads_blocker/pages/main_page.dart';
import 'package:ads_blocker/pages/on_boarding_page.dart';
import 'package:ads_blocker/pages/paywall_screen.dart';
import 'package:ads_blocker/pages/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        home: OnBoardingPage(),
    );
  }
}


