import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id, title, imageUrl;
  final List<String> categories, ingredients, steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree, isVegan, isVegetarian,isLactoseFree;

 const Meal(
      {@required this.affordability,
      @required this.complexity,
      @required this.id,
      @required this.title,
      @required this.categories,
      @required this.duration,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.isGlutenFree,
      @required this.isVegan,
      @required this.isVegetarian,
      @required this.steps,
      @required this.isLactoseFree });
}
