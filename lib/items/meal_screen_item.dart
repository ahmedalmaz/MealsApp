import 'package:flutter/material.dart';
import 'package:meals_app/Screens/meal_details_screen.dart';
import 'package:meals_app/models/meal.dart';

class MealScreenItem extends StatelessWidget {


  final String id ;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String get getComplexity{
    switch (complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unkown';
        break;
    }
  }
  String get getAffordability{
    switch (affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unkown';
        break;
    }
  }
  MealScreenItem(
      {this.id
      ,this.title,
      this.imageUrl,
      this.affordability,
      this.complexity,
      this.duration});

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
       MealDetailsScreen.routeName, arguments:
    id
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectMeal(context),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imageUrl , height: 250,width: double.infinity,fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    color: Colors.black54,
                    child: Text(title,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                    ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5,),
                      Text('$duration Min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5,),

                      Text(getComplexity)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),

                      Text(getAffordability)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
