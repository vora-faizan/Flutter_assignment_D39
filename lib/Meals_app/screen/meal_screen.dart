import 'package:flutter/material.dart';
import 'package:flutter_assignment/Meals_app/model/meal_model.dart';
import 'package:flutter_assignment/Meals_app/service/meal_service.dart';

class MealScreen extends StatefulWidget {
  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  List<Meal> meals = [];
  List<Meal> filteredMeals = [];
  List<Meal> favoriteMeals = [];
  bool isVeg = false;
  String searchText = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    setState(() {
      isLoading = true;
    });
    final fetchedMeals = await MealService.getMeals();
    setState(() {
      meals = fetchedMeals;
      filteredMeals = fetchedMeals;
      isLoading = false;
    });
  }

  void toggleFavorite(Meal meal) {
    setState(() {
      if (favoriteMeals.contains(meal)) {
        favoriteMeals.remove(meal);
      } else {
        favoriteMeals.add(meal);
      }
    });
  }

  void filterMeals() {
    setState(() {
      filteredMeals = meals.where((meal) {
        final matchesSearch = meal.name.toLowerCase().contains(searchText.toLowerCase());
        final matchesFilter = isVeg ? meal.isVeg : true;
        return matchesSearch && matchesFilter;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals App",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite,color: Colors.red,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FavoriteScreen(favoriteMeals: favoriteMeals),
              ));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Search meals',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                  filterMeals();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Veg Only"),
              Switch(
                value: isVeg,
                onChanged: (value) {
                  setState(() {
                    isVeg = value;
                    filterMeals();
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: fetchMeals,  // Pull to refresh
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: filteredMeals.length,
                itemBuilder: (context, index) {
                  final meal = filteredMeals[index];
                  return ListTile(
                    title: Text(meal.name),
                    subtitle: Text(meal.isVeg ? 'Vegetarian' : 'Non-Vegetarian'),
                    trailing: IconButton(
                      icon: Icon(
                        favoriteMeals.contains(meal)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () => toggleFavorite(meal),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen({required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Meals'),
      ),
      body: ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          final meal = favoriteMeals[index];
          return ListTile(
            title: Text(meal.name),
            subtitle: Text(meal.isVeg ? 'Vegetarian' : 'Non-Vegetarian'),
          );
        },
      ),
    );
  }
}

