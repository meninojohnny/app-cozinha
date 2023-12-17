import 'package:cozinha/models/meal.dart';
import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem(this.meal);

  void _mealSelect(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.MEALS_DETAILS, arguments: meal);
    }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _mealSelect(context),
      child: Card(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10), 
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 20,),
                      const SizedBox(width: 6,),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work, size: 20,),
                      const SizedBox(width: 6,),
                      Text(meal.complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money, size: 20,),
                      const SizedBox(width: 6,),
                      Text(meal.costText),
                    ],
                  )  
                ],
              ),
            )
            

          ],
        ),
      ),
    );
  }
}