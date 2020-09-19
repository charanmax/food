import 'package:flutter/material.dart';
import '../models/Meal_Model.dart';
import 'ItemInfo.dart';

class ItemDetails extends StatelessWidget {
  final Function toggleFavorites;
  final Function setIcon;
  ItemDetails(this.toggleFavorites, this.setIcon);
  static const String id = '/ItemDetails';
  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
//      appBar: AppBar(
//        title: Text('Item Info'),
//        centerTitle: true,
//        elevation: 9,
//      ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink.withOpacity(0.7), Colors.pink],
              ),
            ),
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Text(
                  meal.title,
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Ingredients',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                ItemInfo(meal: meal.ingredients),
                Text(
                  'Steps',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                ItemInfo(meal: meal.steps),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            elevation: 15,
            onPressed: () {
              toggleFavorites(meal.id);
            },
            child: Icon(setIcon(meal.id) ? Icons.star : Icons.star_border)),
      ),
    );
  }
}
