import 'package:flutter/material.dart';
import 'package:flutter_assignment/Meals_app/screen/meal_screen.dart';
import 'package:flutter_assignment/Theme/theme_screen.dart';
import 'package:flutter_assignment/home_screen.dart';

import 'Bmi/bmi_screen.dart';
import 'Cal_app/Cal_app.dart';
import 'Expenec_app/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: BMIScreen(),
      //home: CalculatorHomePage(),
      //home: expence_screen(),
     // home: MealScreen(),
      home : HomeScreen(),
    );
  }
}
