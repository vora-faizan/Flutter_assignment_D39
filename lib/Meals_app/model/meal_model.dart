class Meal {
  final String name;
  final bool isVeg;

  Meal({required this.name, required this.isVeg});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['name'],
      isVeg: json['isVeg'],
    );
  }
}
