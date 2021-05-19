import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/items/meal_screen_item.dart';
import 'package:meals_app/models/meal.dart';


class CategoriesMealScreen extends StatefulWidget {
  static const routName='/category_meal';
  // final String id ;
  // final String title;
  //
  // CategoriesMealScreen(this.id , this.title);
  final List<Meal> _availableMeals;
  CategoriesMealScreen(this._availableMeals);
  @override
  _CategoriesMealScreenState createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catTitle = routs['title'];
    final catId = routs['id'];
    final categories = widget._availableMeals.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            catTitle,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealScreenItem(
              id: categories[index].id,
              title: categories[index].title,
              imageUrl: categories[index].imageUrl,
              complexity: categories[index].complexity,
              affordability: categories[index].affordability,
              duration: categories[index].duration
            );
          },
          itemCount: categories.length,
        ));
  }
}
