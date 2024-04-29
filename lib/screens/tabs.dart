import 'package:flutter/material.dart';
import 'package:meals_app/providers/filtering_meals_provider.dart';

import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';

final kfallBackFilterValues = {
  FilterTypes.gluten: false,
  FilterTypes.lactose: false,
  FilterTypes.vegetarian: false,
  FilterTypes.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;

//the function below is to show a snackBar
//with a specific message
  void _showInfoMessage(message) {}

//the function below it to recive the choosen navigationBar index parameter
//from the onTap and use it to update the value of a variable
  void _selectContent(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

//the function below is to choose the filters screen or the
//meals screen from the drawer
  void _drawerScreensSelector(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      //The code below to return the values of the choosen filters
      //from the filters screen after entering them in the in the
      //filters screen in the Navigator.of(context).pop(..)
      //Then using async above and await down to store them in final variable
      // final filterResult =
      await Navigator.of(context).push<Map<FilterTypes, bool>>(
        MaterialPageRoute(
          builder: (BuildContext context) => const FiltersScreen(),
        ),
      );
      // setState(() {
      //   _selectedFilterResult = filterResult ?? kfallBackFilterValues;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    //code below is to filter the meals based on the user chosen filters
    //and storing them in a variable to pass it to the categories screen
    var mealsBasedOnFiltersValues = ref.watch(mealsFilteringProvider);

    Widget mainContent = CategorisScreen(
      mealsFilteredBaseOnFilterVluesS: mealsBasedOnFiltersValues,
    );

    String activePageTitle = 'Categories';
    final favoriteScreenListProvider = ref.watch(favoriteProvider);

    if (selectedPageIndex == 1) {
      mainContent = MealsScreen(
        mealsList: favoriteScreenListProvider,
      );
      setState(() {
        activePageTitle = 'Favorites';
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onDraweScreens: _drawerScreensSelector,
      ),
      body: mainContent,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectContent,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
