import 'package:flutter/material.dart';
import 'MainDrawer.dart';
import '../Constants/dummy_data.dart';

class FilterScreen extends StatefulWidget {
  final Function favourites;
  final Map<String, bool> favouritesSelection;
  FilterScreen(this.favourites, this.favouritesSelection);
  static final String id = '/FilterScreen';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGlutenFree;
  var isVegan;
  var isVegetarian;
  var isLactoseFree;
  @override
  void initState() {
    isGlutenFree = widget.favouritesSelection['isGlutenFree'];
    isVegan = widget.favouritesSelection['isVegan'];
    isVegetarian = widget.favouritesSelection['isVegetarian'];
    isLactoseFree = widget.favouritesSelection['isLactoseFree'];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                widget.favourites({
                  'isGlutenFree': isGlutenFree as bool,
                  'isVegan': isVegan as bool,
                  'isVegetarian': isVegetarian as bool,
                  'isLactoseFree': isLactoseFree as bool,
                });
              },
              icon: Icon(Icons.save),
            )
          ],
          title: Text('Your Filters'),
          elevation: 15,
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          Text(
            'Adjust your Filters',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          Container(
            height: 300,
            child: ListView(
              padding: EdgeInsets.all(15),
              children: <Widget>[
                SwitchListTile(
                  title: Text('Gluten free'),
                  value: isGlutenFree,
                  subtitle: Text('Gluten free Items'),
                  onChanged: (value) {
                    setState(() {
                      isGlutenFree = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan '),
                  value: isVegan,
                  subtitle: Text('Vegan  Items'),
                  onChanged: (value) {
                    setState(() {
                      isVegan = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  value: isVegetarian,
                  subtitle: Text('Vegetarian Items'),
                  onChanged: (value) {
                    setState(() {
                      isVegetarian = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose Free'),
                  value: isLactoseFree,
                  subtitle: Text('Lactose Free Items'),
                  onChanged: (value) {
                    setState(() {
                      isLactoseFree = value;
                    });
                  },
                )
              ],
            ),
          ),
        ]));
  }
}
