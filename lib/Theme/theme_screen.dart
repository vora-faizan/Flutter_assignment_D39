import 'package:flutter/material.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  Color themeColor = Colors.white;

  void changeToRed() {
    setState(() {
      themeColor = Colors.red;
    });
  }

  // Function to change theme to yellow
  void changeToYellow() {
    setState(() {
      themeColor = Colors.yellow;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeColor,  // Use the current theme color as background
        appBar: AppBar(
          title: const Text("Change Theme Color",
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.teal,
          // Change app bar color with the theme
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: changeToRed,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Change to Red",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 20),  // Spacer between buttons
              ElevatedButton(
                onPressed: changeToYellow,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                child: const Text("Change to Yellow",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
