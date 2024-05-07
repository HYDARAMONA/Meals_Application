import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/categories_data.dart';
import 'package:meals_app/models/category_blueprint.dart';
import 'package:meals_app/models/meal_blueprint.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/screens/meals.dart';

class CategorisScreen extends StatefulWidget {
  CategorisScreen({
    super.key,
    required this.mealsFilteredBaseOnFilterVluesS,
  });

  final List<Meal> mealsFilteredBaseOnFilterVluesS;
  @override
  State<CategorisScreen> createState() => _CategorisScreenState();
}

class _CategorisScreenState extends State<CategorisScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: const Duration(milliseconds: 300),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  //this is the meals list after choosing the filters
  void _selectCtegory(BuildContext context, Category category) {
    final filteredList = widget.mealsFilteredBaseOnFilterVluesS
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
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeIn,
          ),
        ),
        child: child,
      ),
    );
  }
}
