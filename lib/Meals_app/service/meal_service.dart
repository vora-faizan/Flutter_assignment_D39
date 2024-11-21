import 'dart:convert';

import 'package:flutter_assignment/Meals_app/model/meal_model.dart';

class MealService {
  static Future<List<Meal>> getMeals() async {
    // Simulating fetching from a local API
    final response = '''
    [
      {"name": "Veggie Pizza", "isVeg": true},
      {"name": "Grilled Salmon", "isVeg": false},
      {"name": "Paneer Butter Masala", "isVeg": true},
      {"name": "Beef Stroganoff", "isVeg": false},
      {"name": "Grilled Vegetable Salad", "isVeg": true},
      {"name": "Chicken Tikka Masala", "isVeg": false},
      {"name": "Mushroom Risotto", "isVeg": true},
      {"name": "Lamb Chops", "isVeg": false},
      {"name": "Veggie Tacos", "isVeg": true},
      {"name": "Shrimp Scampi", "isVeg": false}
    ]
    ''';

    final List<dynamic> data = json.decode(response);
    return data.map((mealData) => Meal.fromJson(mealData)).toList();
  }
}