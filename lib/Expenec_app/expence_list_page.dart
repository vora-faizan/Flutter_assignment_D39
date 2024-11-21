import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'expence_controller.dart';


class ExpenseListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ExpenseController controller = Get.find(); // Use Get.find() to access the existing controller

    return Scaffold(
      appBar: AppBar(
        title: Text('All Expenses'),
      ),
      body: Obx(() {
        if (controller.expenses.isEmpty) {
          return Center(child: Text('No expenses found.'));
        }
        return ListView.builder(
          itemCount: controller.expenses.length,
          itemBuilder: (context, index) {
            final expense = controller.expenses[index];
            return ListTile(
              title: Text(expense.title),
              subtitle: Text('Amount: \$${expense.amount.toStringAsFixed(2)}'),
              trailing: Text('${expense.date.toLocal()}'.split(' ')[0]),
            );
          },
        );
      }),
    );
  }
}
