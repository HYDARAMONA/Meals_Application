import 'package:flutter/material.dart';
import 'package:meals_app/widgets/switch_tile_item.dart';

enum FilterTypes { gluten, lactose, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.initialFilters,
  });

  final Map<FilterTypes, bool> initialFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFilterChecked = false;
  var _isLactoseFilterChecked = false;
  var _isVegetarianFilterChecked = false;
  var _isVeganFilterChecked = false;

  //The code below is to set initial values to the filters so that they
  //would not be reset each time the users opend and close the side drawer
  @override
  void initState() {
    super.initState();
    _isGlutenFilterChecked = widget.initialFilters[FilterTypes.gluten]!;
    _isLactoseFilterChecked = widget.initialFilters[FilterTypes.lactose]!;
    _isVegetarianFilterChecked = widget.initialFilters[FilterTypes.vegetarian]!;
    _isVeganFilterChecked = widget.initialFilters[FilterTypes.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
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
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          Navigator.of(context).pop(
            {
              FilterTypes.gluten: _isGlutenFilterChecked,
              FilterTypes.lactose: _isLactoseFilterChecked,
              FilterTypes.vegetarian: _isVegetarianFilterChecked,
              FilterTypes.vegan: _isVeganFilterChecked,
            },
          );
        },
        child: Column(
          children: [
            SwitchTileItem(
              intialValue: _isGlutenFilterChecked,
              onchanged: (bool value) {
                setState(() {
                  _isGlutenFilterChecked = value;
                });
              },
              mainTitle: 'Gluten Free',
              mainSubTile: 'Only Gluten_Free Meals',
            ),
            SwitchTileItem(
              intialValue: _isLactoseFilterChecked,
              onchanged: (bool value) {
                setState(() {
                  _isLactoseFilterChecked = value;
                });
              },
              mainTitle: 'Lactose Free',
              mainSubTile: 'Only Lactose_Free Meals',
            ),
            SwitchTileItem(
              intialValue: _isVegetarianFilterChecked,
              onchanged: (bool value) {
                setState(() {
                  _isVegetarianFilterChecked = value;
                });
              },
              mainTitle: 'Vegetarian',
              mainSubTile: 'Only Vegetarian Meals',
            ),
            SwitchTileItem(
              intialValue: _isVeganFilterChecked,
              onchanged: (bool value) {
                setState(() {
                  _isVeganFilterChecked = value;
                });
              },
              mainTitle: 'Vegan',
              mainSubTile: 'Only Vegan Meals',
            ),
          ],
        ),
      ),
    );
  }
}





//  SwitchListTile(
//             value: _isFilterChecked,
//             onChanged: (isChecked) {
//               setState(() {
//                 _isFilterChecked = isChecked;
//               });
//             },

//             enableFeedback: true, //remember to test this one
//             title: Text(
//               'Gluten Free',
//               style: Theme.of(context)
//                   .textTheme
//                   .titleLarge!
//                   .copyWith(color: Theme.of(context).colorScheme.onBackground),
//             ),
//             subtitle: Text(
//               'Only Gluten_Free Meals',
//               style: Theme.of(context)
//                   .textTheme
//                   .titleMedium!
//                   .copyWith(color: Theme.of(context).colorScheme.onBackground),
//             ),
//             activeColor: Theme.of(context).colorScheme.tertiary,
//           )