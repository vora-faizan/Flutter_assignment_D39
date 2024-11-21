import 'package:get/get.dart';

class BMIController extends GetxController {
  var weightKg = 0.0.obs; // Weight in kilograms
  var feet = 0.0.obs; // Height in feet
  var inches = 0.0.obs; // Height in inches
  var bmi = 0.0.obs; // BMI value
  var status = ''.obs; // BMI status (Underweight, Normal, etc.)

  void calculateBMI() {
    // Ensure valid input for weight, feet, and inches
    if (weightKg.value > 0 && feet.value >= 0 && inches.value >= 0) {
      // Convert height (feet + inches) to total inches
      double totalHeightInches = (feet.value * 12) + inches.value;

      // Convert height from inches to meters
      double heightM = totalHeightInches / 39.37;

      // Calculate BMI: weight (kg) / height^2 (m^2)
      bmi.value = weightKg.value / (heightM * heightM);

      // Determine BMI status
      if (bmi.value < 18.5) {
        status.value = 'Underweight';
      } else if (bmi.value >= 18.5 && bmi.value < 24.9) {
        status.value = 'Normal weight';
      } else if (bmi.value >= 25 && bmi.value < 29.9) {
        status.value = 'Overweight';
      } else if (bmi.value >= 30) {
        status.value = 'Obese';
      } else {
        status.value = 'Invalid input';
      }

      // Debugging log
      //print("BMI Status: ${status.value}");
    } else {
      // If weight or height are invalid, reset BMI and status
      bmi.value = 0.0;
      status.value = 'Invalid input';
    }
  }
}
