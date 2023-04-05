import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:users_app/global/global.dart';

class SelectNearestActiveDeliverymenScreen extends StatefulWidget {
  const SelectNearestActiveDeliverymenScreen({Key? key}) : super(key: key);

  @override
  State<SelectNearestActiveDeliverymenScreen> createState() => _SelectNearestActiveDeliverymenScreenState();
}



class _SelectNearestActiveDeliverymenScreenState extends State<SelectNearestActiveDeliverymenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: const Text(
          "Nearest online deliverymen",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          onPressed: ()
          {
            // todo delete ride request from database

            SystemNavigator.pop();
          },
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: dList.length,
        itemBuilder: (BuildContext context, int index)
        {
          return Card(
            color: Colors.grey[300],
            elevation: 3,
            shadowColor: Colors.blue,
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(top: 2.0,),
                child: Image.asset(
                  "images/${dList[index]["car_details"]["type"]}.png",
                  width: 70,
                ),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    dList[index]["name"],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    dList[index]["car_details"]["car_model"],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                  SmoothStarRating(
                    rating: 3.5,
                    color: Colors.blue,
                    borderColor: Colors.black,
                    allowHalfRating: true,
                    starCount: 5,
                    size: 15,
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "3",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2,),
                  Text(
                    "13 km",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
