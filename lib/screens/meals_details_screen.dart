import 'package:cozinha/models/meal.dart';
import 'package:flutter/material.dart';

class MealsDetailsScreen extends StatelessWidget {
  final Function(Meal) onPressed;
  MealsDetailsScreen({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    Widget _createSectionTitle(BuildContext context, String title) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Text(
          title, 
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    Widget _createSectionContainer({required Widget child}) {
      return Container(
        height: 200,
        width: 320,
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)
        ),
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(meal.title, style: const TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              color: Colors.red,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              child: ListView(
                children: meal.ingredients.map((igr) {
                  return Card(
                    color: Colors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Text(igr),
                    ),
                  );
                }).toList(),
              ),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      meal.steps[index], 
                      style: const TextStyle(fontSize: 13),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.star),
        onPressed: () {
          onPressed(meal);
        },
      ),
    );
  }
}