import 'Category_screen.dart';
import 'package:flutter/material.dart';
import 'FavouriteScreen.dart';
import 'MainDrawer.dart';
import '../models/Meal_Model.dart';

class BottomNavBar extends StatefulWidget {
  final List<Meal> favourites;
  BottomNavBar(this.favourites);
  static final String id = '/BottomNavbar';
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _handleEvent(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> screens = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': Favourites(widget.favourites),
        'title': 'Favourites',
      },
    ];
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(screens[_selectedIndex]['title']),
        elevation: 5,
        centerTitle: true,
      ),
      body: screens[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _handleEvent(index);
          },
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Theme.of(context).accentColor,
          elevation: 5,
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text('Favourites'),
            )
          ]),
    );
  }
}
