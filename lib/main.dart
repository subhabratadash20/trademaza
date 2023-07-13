import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademaza/screens/onboard/welcome_page.dart';
import 'package:trademaza/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: const WelcomePage(),
    );
  }
}
