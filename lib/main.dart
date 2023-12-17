import 'package:cozinha/screens/categories_meals_screen.dart';
import 'package:cozinha/screens/categories_screen.dart';
import 'package:cozinha/screens/meals_details_screen.dart';
import 'package:cozinha/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:cozinha/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        AppRoutes.HOME:  (_) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(),
        AppRoutes.MEALS_DETAILS: (_) => MealsDetailsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}