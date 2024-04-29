import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';

final mealsFilteringProvider = Provider((ref) {
  final providedMeals = ref.watch(mealsProvider);
  final currentFilters = ref.watch(filtersProvider);

  return providedMeals.where((meal) {
    if (currentFilters[FilterTypes.gluten]! && !meal.isGlutenFree) {
      return false;
    }
    if (currentFilters[FilterTypes.lactose]! && !meal.isLactoseFree) {
      return false;
    }
    if (currentFilters[FilterTypes.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (currentFilters[FilterTypes.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
