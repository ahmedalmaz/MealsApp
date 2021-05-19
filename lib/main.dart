import 'package:flutter/material.dart';
import 'package:meals_app/Screens/filters_screen.dart';
import 'package:meals_app/Screens/meal_details_screen.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/tab_bar_screen.dart';
import 'package:meals_app/Screens/categories_meal_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'Gluten-free': false,
    'Lactose-free': false,
    'Vegan': false,
    'Vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['Gluten-free'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['Lactose-free'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['Vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['Vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isFavorite(String id )
  {
    return  _favouriteMeals.any((meal) => meal.id==id);
  }
  void toggleFavorites(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.teal.shade800,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabBarScreen(_favouriteMeals),
        CategoriesMealScreen.routName: (ctx) =>
            CategoriesMealScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(toggleFavorites,_isFavorite),
        FiltersScreen.routName: (ctx) => FiltersScreen(filters, _setFilters),
      },
    );
  }
}
