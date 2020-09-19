import 'package:flutter/material.dart';
import 'package:food/models/Category.dart';
import 'Category_meals.dart';

class CategoryItems extends StatelessWidget {
  final Category item;
  CategoryItems(this.item);
  @override
  Widget build(BuildContext context) {
    return Card(
//      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 15,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, CategoryMealsScreen.id, arguments: item);
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
//        margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [item.color.withOpacity(0.7), item.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            item.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
