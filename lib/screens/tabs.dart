import 'package:flutter/material.dart';
import 'package:meals_app/data/meals_data.dart';
import 'package:meals_app/models/meal_blueprint.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

final kfallBackFilterValues = {
  FilterTypes.gluten: false,
  FilterTypes.lactose: false,
  FilterTypes.vegetarian: false,
  FilterTypes.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  Map<FilterTypes, bool> _selectedFilterResult = {
    FilterTypes.gluten: false,
    FilterTypes.lactose: false,
    FilterTypes.vegetarian: false,
    FilterTypes.vegan: false,
  };

//the function below is to show a snackBar
//with a specific message
  void _showInfoMessage(message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

//the function below is to add and remove the meals
//from the favorite meals screen and it uses
//another function to show a snackBar
  void _toggleFavoriteMealsStatus(Meal meal) {
    final isAvailable = _favoriteMeals.contains(meal);

    if (isAvailable == true) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Oops Not Favorite Any More');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage('So a New Favorite Meal');
    }
  }

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
      final filterResult =
          await Navigator.of(context).push<Map<FilterTypes, bool>>(
        MaterialPageRoute(
          builder: (BuildContext context) => FiltersScreen(
            initialFilters: _selectedFilterResult,
          ),
        ),
      );
      setState(() {
        _selectedFilterResult = filterResult ?? kfallBackFilterValues;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //code below is to filter the meals based on the user chosen filters
    //and storing them in a variable to pass it to the categories screen
    var mealsBasedOnFiltersValues = dummyMeals.where((meal) {
      if (_selectedFilterResult[FilterTypes.gluten]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilterResult[FilterTypes.lactose]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilterResult[FilterTypes.vegetarian]! &&
          !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilterResult[FilterTypes.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    // print(mealsBasedOnFiltersValues);

    Widget mainContent = CategorisScreen(
      onToggleFavorite: _toggleFavoriteMealsStatus,
      mealsFilteredBaseOnFilterVluesS: mealsBasedOnFiltersValues,
    );
    String activePageTitle = 'Categories';
    if (selectedPageIndex == 1) {
      mainContent = MealsScreen(
        onToggleFavorite: _toggleFavoriteMealsStatus,
        mealsList: _favoriteMeals,
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
