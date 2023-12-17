
import 'package:cozinha/components/meal_item.dart';
import 'package:cozinha/data/dummy_data.dart';
import 'package:cozinha/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          category.title, 
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: categoryMeals.map((meal) {
          return MealItem(meal);
        }).toList(),
      ),
    );
  }
}