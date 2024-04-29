import 'package:flutter/material.dart';
import 'package:meals_app/data/categories_data.dart';
import 'package:meals_app/models/category_blueprint.dart';
import 'package:meals_app/models/meal_blueprint.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/screens/meals.dart';

class CategorisScreen extends StatelessWidget {
  CategorisScreen({
    super.key,
    required this.mealsFilteredBaseOnFilterVluesS,
  });

  final List<Meal>
      mealsFilteredBaseOnFilterVluesS; //this is the meals list after choosing the filters

  void _selectCtegory(BuildContext context, Category category) {
    final filteredList = mealsFilteredBaseOnFilterVluesS
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MealsScreen(
        title: category.title,
        mealsList: filteredList,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryItem(
            category: category,
            onSelectCategory: () => _selectCtegory(context, category),
          )
      ],
    );
  }
}
