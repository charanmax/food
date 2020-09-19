import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Meal_Model.dart';
import 'ItemDetails.dart';

class DisplayItems extends StatelessWidget {
  final Meal meal;
  final Function handleEvent;

  DisplayItems(this.meal, this.handleEvent);
  String get complexity {
    if (meal.complexity == Complexity.Simple) {
      return 'Simple';
    } else if (meal.complexity == Complexity.Challenging) {
      return 'Medium';
    } else {
      return 'Hard';
    }
  }

  String get affordability {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Pricey:
        return 'Pricey';

      case Affordability.Luxurious:
        return 'Luxurious';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ItemDetails.id, arguments: meal).then(
          (value) {
            print(value);
            handleEvent(value);
          },
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 15,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54,
                    ),
                    width: 300,
                    child: Text(
                      meal.title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 4,
                      ),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 4,
                      ),
                      Text('$complexity'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 4,
                      ),
                      Text('$affordability'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
