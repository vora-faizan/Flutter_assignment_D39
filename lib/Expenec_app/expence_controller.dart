import 'package:get/get.dart';

import 'model.dart'; // Import your model

class ExpenseController extends GetxController {
  var selectedDate = Rx<DateTime?>(null);
  var expenses = <Expense>[].obs;

  void setDate(DateTime date) {
    selectedDate.value = date;
  }

  void addExpense(String title, double amount) {
    if (selectedDate.value != null) {
      expenses.add(Expense(
        title: title,
        amount: amount,
        date: selectedDate.value!,
      ));
    } else {
      // Handle case where date is not selected
      print('Date is not selected');
    }
  }
}
