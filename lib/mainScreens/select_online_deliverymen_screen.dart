import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:users_app/assistants/assistant_methods.dart';
import 'package:users_app/global/global.dart';

class SelectNearestActiveDeliverymenScreen extends StatefulWidget {
  DatabaseReference? referenceCourierRequest;
  String? passedFeeAmount;

  SelectNearestActiveDeliverymenScreen({this.referenceCourierRequest, this.passedFeeAmount});

  @override
  State<SelectNearestActiveDeliverymenScreen> createState() => _SelectNearestActiveDeliverymenScreenState(passedFee: passedFeeAmount);
}



class _SelectNearestActiveDeliverymenScreenState extends State<SelectNearestActiveDeliverymenScreen> {
  _SelectNearestActiveDeliverymenScreenState({this.passedFee});

  String feeAmount = "";
  String? passedFee = "";
  getFeeAmount(int index)
  {
    if(tripDirectionDetailsInfo != null)
      {
        if(dList[index]["car_details"]["type"].toString() == "Motorbike")
        {
          feeAmount = (AssistantMethods.calculateDirectionFee(tripDirectionDetailsInfo!) * 0.75).toStringAsFixed(1);
        }
        if(dList[index]["car_details"]["type"].toString() == "Car")
        {
          feeAmount = (AssistantMethods.calculateDirectionFee(tripDirectionDetailsInfo!)).toString();
        }


      }
    print("Passed Fee: ${passedFee}");
    return (double.parse(feeAmount)+double.parse(passedFee!)).toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: const Text(
          "Nearest online deliverymen",
          style: TextStyle(
            fontSize: 21,
          ),
        ),
        leading: IconButton(
          onPressed: ()
          {
            widget.referenceCourierRequest!.remove();
            Fluttertoast.showToast(msg: "You have canceled the Courier request.");

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
          return GestureDetector(
            onTap: ()
            {
              setState(() {
                chosenDeliverymanId = dList[index]["id"].toString();
              });
              Navigator.pop(context, "Deliveryman Chosen.");
            },
            child: Card(
              color: Colors.grey[300],
              elevation: 3,
              shadowColor: Colors.blue,
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 2.0,),
                  child: Image.asset(
                    "images/${dList[index]["car_details"]["type"]}.png",
                    width: 60,
                  ),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2,),
                    Text(
                      dList[index]["name"],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2,),
                    Text(
                      dList[index]["car_details"]["car_model"],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 6,),
                    SmoothStarRating(
                      rating: 3.5,
                      color: Colors.amber,
                      borderColor: Colors.black,
                      allowHalfRating: true,
                      starCount: 5,
                      size: 18,
                    ),
                    const SizedBox(height: 8,),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "৳ ${getFeeAmount(index)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2,),
                    Text(
                      tripDirectionDetailsInfo != null ? tripDirectionDetailsInfo!.duration_text! : "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 2,),
                    Text(
                      tripDirectionDetailsInfo != null ? tripDirectionDetailsInfo!.distance_text! : "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
