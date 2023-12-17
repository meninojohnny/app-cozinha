import 'package:cozinha/models/category.dart';
import 'package:cozinha/utils/app_routes.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(.5),
              category.color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}