import 'package:flutter/material.dart';
import 'package:movies_app/core/inject/inject.dart';
import 'package:movies_app/layers/presentation/ui/pages/home_page.dart';

void main() {
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(90, 0, 255, 1),
              Color.fromRGBO(48, 50, 67, 1),
              Color.fromRGBO(21, 21, 29, 0.8),
            ],
          ),
        ),
        child: const HomePage(),
      ),
    );
  }
}
