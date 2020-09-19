import 'package:flutter/material.dart';
import 'package:food/models/Meal_Model.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favourites;
  Favourites(this.favourites);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 15,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(
                        favourites[index].imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54,
                        ),
                        width: 300,
                        child: Text(
                          favourites[index].title,
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
                          Text('${favourites[index].duration} min'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.work),
                          SizedBox(
                            width: 4,
                          ),
                          Text(favourites[index].duration.toString()),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.attach_money),
                          SizedBox(
                            width: 4,
                          ),
                          Text(favourites[index]
                              .affordability
                              .toString()
                              .substring(14)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          },
          itemCount: favourites.length,
        ),
      ),
    );
  }
}
