import 'package:flutter/material.dart';
import 'package:meals_app/Screens/favorites_screen.dart';
import 'package:meals_app/Screens/main_drawer.dart';
import 'package:meals_app/models/meal.dart';

import 'Screens/categories_screen.dart';

class TabBarScreen extends StatefulWidget {

  List<Meal> _favouriteMeals;
  TabBarScreen(this._favouriteMeals);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
   List<Map<String, Object>> _pages ;

  @override
  initState(){
    _pages=[
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget._favouriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites '),
          ),
        ],
      ),
    );
  }
}
