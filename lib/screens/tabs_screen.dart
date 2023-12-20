import 'package:cozinha/components/drawer_main.dart';
import 'package:cozinha/models/meal.dart';
import 'package:cozinha/screens/categories_screen.dart';
import 'package:cozinha/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({super.key, required this.favoriteMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  late final List<Map> _screens;

  int _selectedScreenIndex = 0;

  _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      _screens  = [
        {
          'title': 'Vamos Cozinhar?',
          'screen': const CategoriesScreen(),
        },
        {
          'title': 'Refeições Favoritas',
          'screen': FavoriteScreen(favoriteMeals: widget.favoriteMeals,),
        }
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
            _screens[_selectedScreenIndex]['title'],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: const DrawerMain(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _selectedScreenIndex,
        onTap: _selectedScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'cateogry',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'favorite'
          ),
        ],
      )
    );
  }
}