import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key key,
    @required this.meal,
  }) : super(key: key);

  final List meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.pinkAccent,
          )),
      height: 180,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: <Widget>[
                Text(
                  meal[index],
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
        itemCount: meal.length,
      ),
    );
  }
}
