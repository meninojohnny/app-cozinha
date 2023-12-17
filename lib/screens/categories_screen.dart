import 'package:cozinha/components/category_item.dart';
import 'package:cozinha/data/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5,
        ),
        children: DUMMY_CATEGORIES.map((cat) {
          return CategoryItem(category: cat);
        }).toList(),
      ),
    );
  }
}