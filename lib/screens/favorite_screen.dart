import 'package:cozinha/components/meal_item.dart';
import 'package:cozinha/models/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      favoriteMeals.isEmpty 
      ? Center(child: Text('Nenhuma refeição favoritada'),)
      : ListView(
        children: favoriteMeals.map((meal) {
          return MealItem(meal);
        }).toList(),
      )
    );
  }
}