# meals_app

A full functional Flutter Meal Application.

## Description

This project is a Flutter Meals mobile application which gives the user the ability to :

1. view a group of meals which belongs to a specific category that the user has chosen.
2. selecting a specific meal and view its details like Ingredients and Steps.
3. add a specific meal to a favorite list that will be displayed in the favorite screen using the star button in the app bar of the meal.
4. navigate to the filters screen using side drawer.
5. filter the displayed meals in each category based on the filters that has been chosen (the favorite meals wont be affected).

## State Management

State management done using riverpod.

## Animations

1. Categories sliding into the screen coming from the bottom
   navigation bar.
2. Meal image sliding from the meal item in the meals screen
   to fill the image place in the meal details screen.
3. Favorite selection Star transitions from empty to filled
   with rotation transition when marking meal as favorite.
4. Favorite selection Star transitions from filled to empty
   with rotation transition when unmarking meal as favorite.

## Features of the app With Screenshots

| Task                   | Screenshot                                                   | Task                       | Screenshot                                                             |
| ---------------------- | ------------------------------------------------------------ | -------------------------- | ---------------------------------------------------------------------- |
| Tabs Navigation Screen | ![Tabs Navigation Screen](assets/screenshots/tabsScreen.png) | Favorite Screen            | ![Favorite Screen](assets/screenshots/favoriteScreen.png)              |
| A Category Screen      | ![A Category Screen](assets/screenshots/categoryScreen.png)  | A Filtered Category Screen | ![A Filtered Category Screen](assets/screenshots/categoryFiltered.png) |
| Filters Screen         | ![Filters Screen](assets/screenshots/filters.png)            | Meal Details screen        | ![Meal Details](assets/screenshots/mealDetails.png)                    |
