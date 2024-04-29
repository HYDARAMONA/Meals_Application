import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterTypes { gluten, lactose, vegetarian, vegan }

class FilterScreenProviders extends StateNotifier<Map<FilterTypes, bool>> {
  FilterScreenProviders()
      : super({
          FilterTypes.gluten: false,
          FilterTypes.lactose: false,
          FilterTypes.vegetarian: false,
          FilterTypes.vegan: false,
        });

  void setFilters(Map<FilterTypes, bool> chosenFilters) {
    state = chosenFilters;
  }

  void toggleFilterState(FilterTypes filter, bool isSwitched) {
    state = {
      ...state,
      filter: isSwitched,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FilterScreenProviders, Map<FilterTypes, bool>>(
        (ref) => FilterScreenProviders());
