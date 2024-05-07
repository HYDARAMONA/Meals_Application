import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/models/meal_blueprint.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  MealItem({
    super.key,
    required this.meal,
    required this.onShowMealDetails,
  });

  final Meal meal;
  final void Function(Meal meal) onShowMealDetails;

  String get affordabilityFormatter {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  String get complixityFormatter {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () => onShowMealDetails(meal),
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                fadeInCurve: Easing.linear,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.watch_later_outlined,
                          label: '${meal.duration} min',
                        ),
                        SizedBox(width: 10),
                        MealItemTrait(
                          icon: Icons.work,
                          label: complixityFormatter,
                        ),
                        SizedBox(width: 10),
                        MealItemTrait(
                          icon: Icons.attach_money_outlined,
                          label: affordabilityFormatter,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
