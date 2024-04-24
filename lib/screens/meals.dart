import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_blueprint.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({
    super.key,
    this.title,
    required this.mealsList,
    required this.onToggleFavorite,
  });
  final String? title;
  final List<Meal> mealsList;
  final void Function(Meal meal) onToggleFavorite;

  void _showMealDetails(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent;
    if (mealsList.isEmpty) {
      mainContent = Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Uh no....nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a differenct category',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ));
    } else {
      mainContent = ListView.builder(
        itemCount: mealsList.length,
        itemBuilder: (buildContext, index) => MealItem(
          meal: mealsList[index],
          onShowMealDetails: (meal) => _showMealDetails(context, meal),
        ),
      );
    }
    if (title == null) {
      return mainContent;
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(title!),
          ),
          body: mainContent);
    }
  }
}
