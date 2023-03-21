import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:users_app/assistants/request_assistant.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/global/map_key.dart';
import 'package:users_app/models/user_model.dart';

import '../infoHandler/app_info.dart';
import '../models/directions.dart';

class AssistantMethods
{
  static Future<String> searchAddressForGeographicCoordinates(Position position, context) async
  {
    String apiUrl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";
    String humanReadableAddress="";

    var requestResponse = await RequestAssistant.receiveRequest(apiUrl);

    if(requestResponse != "Error occurred. No response.")
      {
        humanReadableAddress = requestResponse["results"][0]["formatted_address"];

        Directions userPickUpAddress = Directions();
        userPickUpAddress.locationLatitude = position.latitude;
        userPickUpAddress.locationLongitude = position.longitude;
        userPickUpAddress.locationName = humanReadableAddress;

        Provider.of<AppInfo>(context, listen: false).updatePickupLocationAddress(userPickUpAddress);

      }

    return humanReadableAddress;
  }

  static void readCurrentOnlineUserInfo() async
  {
    currentFirebaseUser = fAuth.currentUser;

    DatabaseReference usersRef = FirebaseDatabase.instance
        .ref()
        .child("users")
        .child(currentFirebaseUser!.uid);

    usersRef.once().then((snap)
        {
          if(snap.snapshot.value != null)
            {
              userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot);
              // print("name = ${userModelCurrentInfo!.name.toString()}");
              // print("email = ${userModelCurrentInfo!.email.toString()}");
            }
        });
  }
}