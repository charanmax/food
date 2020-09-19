import 'package:flutter/material.dart';
import 'package:food/Screens/BottomNavBar.dart';
import 'package:food/Screens/FiltersScreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 15,
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.pinkAccent,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BarItems(
            title: 'Meals',
            icon: Icon(Icons.restaurant),
            handleEvent: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          BarItems(
            title: 'Filter',
            icon: Icon(Icons.settings),
            handleEvent: () =>
                Navigator.pushReplacementNamed(context, FilterScreen.id),
          ),
        ],
      ),
    );
  }
}

class BarItems extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function handleEvent;
  const BarItems({
    @required this.icon,
    @required this.title,
    @required this.handleEvent,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: handleEvent,
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            fontFamily: 'Pacifico',
          ),
        ));
  }
}
