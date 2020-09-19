import 'package:flutter/material.dart';
import 'package:food/Screens/DisplayItems.dart';
import 'package:food/models/Category.dart';

import '../models/Meal_Model.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> avaliableItems;
  CategoryMealsScreen(this.avaliableItems);
  static String id = '/CategoryMeals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category item;
  List getItems;
  bool _loadedData = false;
  @override
  void didChangeDependencies() {
    if (!_loadedData) {
      item = ModalRoute.of(context).settings.arguments;
      getItems = widget.avaliableItems.where((element) {
        return element.categories.contains(item.id);
      }).toList();
      _loadedData = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void handleEvent(String mealID) {
    setState(() {
      print(mealID);
      getItems.removeWhere((element) => element.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 15,
          centerTitle: true,
          title: Text(item.title),
        ),
        body: Card(
          elevation: 10,
          child: Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return DisplayItems(getItems[index], handleEvent);
              },
              itemCount: getItems.length,
            ),
          ),
        ),
      ),
    );
  }
}
