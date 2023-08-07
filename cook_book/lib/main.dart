import 'package:flutter/material.dart';

// colour theme for app
import 'package:flex_color_scheme/flex_color_scheme.dart';

// onboarding screen
import 'screens/onBoarding/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: FlexThemeData.light(scheme: FlexScheme.vesuviusBurn),
      // darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      themeMode: ThemeMode.light,
      home: const OnBoardingScreen(),
    );
  }
}
