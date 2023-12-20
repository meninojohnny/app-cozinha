import 'package:cozinha/data/dummy_data.dart';
import 'package:cozinha/models/meal.dart';
import 'package:cozinha/models/settings.dart';
import 'package:cozinha/screens/categories_meals_screen.dart';
import 'package:cozinha/screens/categories_screen.dart';
import 'package:cozinha/screens/meals_details_screen.dart';
import 'package:cozinha/screens/settings_screen.dart';
import 'package:cozinha/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:cozinha/utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<Meal> _avaliableMeals = DUMMY_MEALS;

  Settings _settings = Settings();

  List<Meal> favoriteMeals = [];

  void _filterMels(Settings settings) {
    _avaliableMeals = DUMMY_MEALS.where((meal) {
      final bool filterGluten = !meal.isGlutenFree && settings.isGlutenFree;
      final bool filterLactose = !meal.isLactoseFree && settings.isLactoseFree;
      final bool filterVegan = !meal.isVegan && settings.isVegan;
      final bool filterVegetarian = !meal.isVegetarian && settings.isVegetarian;
      return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
    }).toList();
  }

  void _toggleFavorite(Meal meal) {
    favoriteMeals.contains(meal) 
    ? favoriteMeals.remove(meal) 
    : favoriteMeals.add(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Cozinha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: const TextStyle(
            fontSize: 15,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        AppRoutes.HOME:  (_) => TabsScreen(favoriteMeals: favoriteMeals,),
        AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(meals: _avaliableMeals),
        AppRoutes.MEALS_DETAILS: (_) => MealsDetailsScreen(onPressed: _toggleFavorite,),
        AppRoutes.SETTINGS: (_) => SettingsScreen(onSettingsChanged: _filterMels, settings: _settings,),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      },
    );
  }
}