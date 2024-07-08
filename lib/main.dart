import 'package:flutter/material.dart';
import 'package:sampleproject/UI_Screen/screen1.dart';
import 'package:sampleproject/UI_Screen/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Define the initial route
      routes: {
        '/screen1': (context) =>  OrderScreen(), // Default route
        '/screen2': (context) =>  const Screen2(), // Route for Screen2
      },
        home:OrderScreen()
    );

  }
}
