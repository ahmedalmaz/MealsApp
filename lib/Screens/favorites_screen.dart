import 'package:flutter/material.dart';
import 'package:meals_app/items/meal_screen_item.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  List<Meal> _favoriteMeals;
  FavoritesScreen(this._favoriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget._favoriteMeals.isEmpty){
      return Center(child: Container(
        child: Text(' No Favorite Meals Start Add Some ',
        style: Theme.of(context).textTheme.title,
        ),
      ));
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealScreenItem(
              id: widget._favoriteMeals[index].id,
              title: widget._favoriteMeals[index].title,
              imageUrl: widget._favoriteMeals[index].imageUrl,
              complexity: widget._favoriteMeals[index].complexity,
              affordability: widget._favoriteMeals[index].affordability,
              duration: widget._favoriteMeals[index].duration
          );
        },
        itemCount: widget._favoriteMeals.length,
      );
    }

  }
}
