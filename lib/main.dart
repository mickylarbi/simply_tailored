import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/splash_screen.dart';

void main() {
  runApp(const Src());
}

class Src extends StatelessWidget {
  const Src({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.blue,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
