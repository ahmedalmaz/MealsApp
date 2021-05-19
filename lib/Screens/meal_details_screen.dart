import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';

class MealDetailsScreen extends StatefulWidget {
  Function handler;
  Function isFavorite;
  MealDetailsScreen(this.handler, this.isFavorite);

  static const routeName = '/category_meal_item';

  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(selectedMeal.imageUrl),
              height: 350,
              width: double.infinity,
            ),
            Container(
              child: Text(
                'Ingredients',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
                height: 150,
                width: 300,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: EdgeInsets.all(4),
                      color: Colors.teal,
                      elevation: 5,
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 15),
              child: Text(
                'Steps',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              color: Colors.white,
              width: 300,
              height: 150,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.teal,
                          child: Text(
                            '# $index',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider()
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon( widget.isFavorite(id)?Icons.favorite:Icons.favorite_border),

        onPressed: (){
          setState(() {
            widget.handler(id);
          });
        },
      ),
    );

  }
}
