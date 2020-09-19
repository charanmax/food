import 'package:flutter/material.dart';
import './Screens/Category_meals.dart';
import 'Screens/ItemDetails.dart';
import 'Screens/BottomNavBar.dart';
import 'Screens/Category_screen.dart';
import 'Screens/FiltersScreen.dart';
import 'Constants/dummy_data.dart';
import 'models/Meal_Model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filteredItems = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false
  };
  List<Meal> favourites = [];
  var index;
  bool setIcon(String id) {
    return favourites.any((meal) => meal.id == id);
  }

  List<Meal> filteredList = DUMMY_MEALS;

  void setFavourites(Map<String, bool> favourites) {
    setState(() {
      filteredItems = favourites;
      print(filteredItems);
      filteredList = DUMMY_MEALS.where((meal) {
        if (filteredItems['isGlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (filteredItems['isVegan'] && !meal.isVegan) {
          return false;
        }
        if (filteredItems['isVegetarian'] && !meal.isVegetarian) {
          print('cic');
          return false;
        }
        if (filteredItems['isLactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void toggleFavourites(String id) {
    index = favourites.indexWhere((meal) {
      return meal.id == id;
    });
    if (index >= 0) {
      setState(() {
        favourites.removeAt(index);
      });
    } else {
      setState(() {
        favourites.add(DUMMY_MEALS.firstWhere((meal) {
          return meal.id == id;
        }));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        fontFamily: 'Cinzel',
        accentColor: Colors.amber,
        primarySwatch: Colors.amber,
        appBarTheme: AppBarTheme(
          color: Colors.pinkAccent,
          elevation: 15,
          textTheme: TextTheme(
            headline6: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 30,
            ),
          ),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'Cinzel',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        '/': (ctx) => BottomNavBar(favourites),
        CategoryMealsScreen.id: (ctx) => CategoryMealsScreen(filteredList),
        ItemDetails.id: (ctx) => ItemDetails(toggleFavourites, setIcon),
        CategoryScreen.id: (ctx) => CategoryScreen(),
        FilterScreen.id: (ctx) => FilterScreen(setFavourites, filteredItems),
      },
    );
  }
}
