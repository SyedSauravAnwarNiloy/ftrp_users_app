import 'package:firebase_auth/firebase_auth.dart';
import 'package:users_app/models/user_model.dart';

import '../models/direction_details_info.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;

User? currentFirebaseUser;
UserModel? userModelCurrentInfo;

List dList = []; // deliverymen keys info list

DirectionDetailsInfo? tripDirectionDetailsInfo;

String? chosenDeliverymanId="";