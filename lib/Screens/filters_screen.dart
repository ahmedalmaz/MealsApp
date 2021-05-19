import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/Filters';
  final Function setFilters;
  final Map<String,bool> currentFilters;
  FiltersScreen(this.currentFilters,this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;

  bool _lactoseFree = false;

  bool _vegan = false;

  bool _vegetarian = false;

  @override
  initState(){
    _glutenFree=widget.currentFilters['Gluten-free'];
    _lactoseFree=widget.currentFilters['Lactose-free'];
    _vegan=widget.currentFilters['Vegan'];
    _vegetarian=widget.currentFilters['Vegetarian'];

    super.initState();
  }

  Widget buildSwitch(
      {String title, String description, bool status, Function handler}) {
    return SwitchListTile(
      title: Text(title),
      onChanged: handler,
      subtitle: Text(description),
      value: status,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters={
                  'Gluten-free': _glutenFree,
                  'Lactose-free': _lactoseFree,
                  'Vegan': _vegan,
                  'Vegetarian': _vegetarian,
                };
                widget.setFilters(selectedFilters);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Adjust Ur meals !!',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitch(
                    title: 'Gluten-free',
                    description: 'Only Included Gluten-free Meals .',
                    status: _glutenFree,
                    handler: (newValue) {
                      setState(
                        () {
                          _glutenFree = newValue;
                        },
                      );
                    },
                  ),
                  buildSwitch(
                    title: 'Lactose-free',
                    description: 'Only Included Lactose-free Meals .',
                    status: _lactoseFree,
                    handler: (newValue) {
                      setState(
                        () {
                          _lactoseFree = newValue;
                        },
                      );
                    },
                  ),
                  buildSwitch(
                    title: 'Vegan',
                    description: 'Only Included Vegan Meals .',
                    status: _vegan,
                    handler: (newValue) {
                      setState(
                        () {
                          _vegan = newValue;
                        },
                      );
                    },
                  ),
                  buildSwitch(
                    title: 'Vegetarian',
                    description: 'Only Included Vegetarian Meals .',
                    status: _vegetarian,
                    handler: (newValue) {
                      setState(
                        () {
                          _vegetarian = newValue;
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
