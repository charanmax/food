import 'package:flutter/material.dart';
import '../Constants/dummy_data.dart';
import 'Category_items.dart';
import '../models/Meal_Model.dart';

class CategoryScreen extends StatelessWidget {
  static final String id = '/CategoryScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//        appBar: AppBar(
//          toolbarOpacity: 1,
//          bottomOpacity: 15,
//          elevation: 15,
//          title: Text(
//            'Food',
//            style: Theme.of(context).appBarTheme.textTheme.headline6,
//          ),
//          centerTitle: true,
//        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/asfalt-dark.png"),
                fit: BoxFit.cover),
          ),
          child: GridView(
            padding: EdgeInsets.all(10),
            children: DUMMY_CATEGORIES
                .map(
                  (item) => CategoryItems(item),
                )
                .toList(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
          ),
        ),
      ),
    );
  }
}
