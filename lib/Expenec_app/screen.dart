import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'expence_controller.dart';
import 'expence_list_page.dart';

class expence_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ExpenseController controller = Get.put(ExpenseController());

    final TextEditingController titleController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense App',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),),
        backgroundColor: Colors.teal, // App bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  String dateText = controller.selectedDate.value != null
                      ? '${controller.selectedDate.value!.toLocal()}'
                          .split(' ')[0]
                      : 'No date selected';
                  return Text('Selected Date: $dateText');
                }),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? selected = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (selected != null &&
                        selected != controller.selectedDate.value) {
                      controller.setDate(selected);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                  ),
                  child: Text('Pick Date'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Enter Expense Details:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),

            SizedBox(
              height: 20,
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child:
              ElevatedButton(
                onPressed: () {
                  if (controller.selectedDate.value != null) {
                    final title = titleController.text.trim();
                    final amountString = amountController.text.trim();

                    if (title.isEmpty || amountString.isEmpty) {
                      Get.snackbar('Invalid Input',
                          'Please enter both title and amount');
                      return;
                    }

                    final amount = double.tryParse(amountString);

                    if (amount == null) {
                      Get.snackbar(
                          'Invalid Amount', 'Please enter a valid amount');
                      return;
                    }

                    controller.addExpense(title, amount);

                    titleController.clear();
                    amountController.clear();
                  } else {
                    Get.snackbar(
                      'No Date Selected',
                      'Please select a date before adding an expense',
                    );
                  }
                },
                child: Text('Add Expense'),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => ExpenseListPage());
                },
                child: Text('View All Expenses'),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Obx(() {
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
            ),
          ],
        ),
      ),
    );
  }
}
