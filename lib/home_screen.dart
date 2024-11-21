import 'package:flutter/material.dart';
import 'package:flutter_assignment/Bmi/bmi_screen.dart';
import 'package:flutter_assignment/Cal_app/Cal_app.dart';
import 'package:flutter_assignment/Expenec_app/screen.dart';
import 'package:flutter_assignment/Meals_app/screen/meal_screen.dart';
import 'package:flutter_assignment/Theme/theme_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Center buttons vertically
          children: [
            const SizedBox(height: 150,),
            const Text("Flutter Assignment",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50
              ),
            ),
            const SizedBox(height: 50,),
            SizedBox(
              height: 50, // Set height for the button
              width: 200, // Set width for the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BMIScreen()));
                },
                child: const Text('BMI_Cal'),
              ),
            ),
            const SizedBox(height: 10), // Space between buttons
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorHomePage()));
                },
                child: Text('Calculator'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => expence_screen()));
                },
                child: const Text('Expense_App'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MealScreen()));
                },
                child: const Text('Meal_App'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ThemeScreen()));
                },
                child: const Text('Theme_App'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
