import 'package:flutter/material.dart';
import 'categories_meal_screen.dart';
import 'file:///C:/Users/aalma/AndroidStudioProjects/meals_app/lib/items/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('DeliMeals'),
      // ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((catData) {
          return CategoryItem(title: catData.title, color: catData.color ,id: catData.id,);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
      ),
    );
  }
}
