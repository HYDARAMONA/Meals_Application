import 'package:flutter/material.dart';
import 'package:meals_app/widgets/switch_tile_item.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      body: Column(
        children: [
          SwitchTileItem(
            intialValue: activeFilters[FilterTypes.gluten]!,
            onchanged: (bool isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .toggleFilterState(FilterTypes.gluten, isChecked);
            },
            mainTitle: 'Gluten Free',
            mainSubTile: 'Only Gluten_Free Meals',
          ),
          SwitchTileItem(
            intialValue: activeFilters[FilterTypes.lactose]!,
            onchanged: (bool isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .toggleFilterState(FilterTypes.lactose, isChecked);
            },
            mainTitle: 'Lactose Free',
            mainSubTile: 'Only Lactose_Free Meals',
          ),
          SwitchTileItem(
            intialValue: activeFilters[FilterTypes.vegetarian]!,
            onchanged: (bool isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .toggleFilterState(FilterTypes.vegetarian, isChecked);
            },
            mainTitle: 'Vegetarian',
            mainSubTile: 'Only Vegetarian Meals',
          ),
          SwitchTileItem(
            intialValue: activeFilters[FilterTypes.vegan]!,
            onchanged: (bool isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .toggleFilterState(FilterTypes.vegan, isChecked);
            },
            mainTitle: 'Vegan',
            mainSubTile: 'Only Vegan Meals',
          ),
        ],
      ),
    );
  }
}
