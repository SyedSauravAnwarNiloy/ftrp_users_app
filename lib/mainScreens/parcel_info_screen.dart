import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ParcelInfoScreen extends StatefulWidget {

  @override
  State<ParcelInfoScreen> createState() => _ParcelInfoScreenState();
}



class _ParcelInfoScreenState extends State<ParcelInfoScreen> {

  DatabaseReference? referenceCourierRequest;

  TextEditingController parcelMassTextEditingController = TextEditingController();
  TextEditingController parcelVolumeTextEditingController = TextEditingController();

  List<String> parcelTypesList = ["Legal Documents", "Financial Documents", "Letters", "Small Consumer Items", "Luggage"];
  String? selectedParcelType;

  double parcelInfoFeeAmount = 0;

  calculateFeeBasedOnParcelInfo(double mass, double volume)
  {
    switch(selectedParcelType)
    {
      case "Legal Documents":
        parcelInfoFeeAmount = 0.8 + mass + volume;
        break;

      case "Financial Documents":
        parcelInfoFeeAmount = 0.6 + mass + volume;
        break;

      case "Letters":
        parcelInfoFeeAmount = 0.2 + mass + volume;
        break;

      case "Small Consumer Items":
        parcelInfoFeeAmount = 0.4 + mass + volume;
        break;

      case "Luggage":
        parcelInfoFeeAmount = 0.6 + mass + volume;
        break;
    }
    return parcelInfoFeeAmount * 106;
  }

  setParcelInfo()
  {
    double mass = double.parse(parcelMassTextEditingController.text.trim()) * 0.1;
    double passedVolume = double.parse(parcelVolumeTextEditingController.text.trim());
    double volume = 0;
    if (passedVolume > 50000)
      {
        volume = passedVolume*0.0001;
      }
    else if (passedVolume > 20000)
      {
        volume = passedVolume*0.0003;
      }
    else if (passedVolume > 10000)
      {
        volume = passedVolume*0.0006;
      }
    else if (passedVolume > 5000)
      {
        volume = passedVolume*0.0008;
      }
    else
      {
        volume = passedVolume*0.001;
      }
    Map parcelInformationMap =
    {
      "parcel_type": selectedParcelType,
      "parcel_mass": parcelMassTextEditingController.text.trim(),
      "parcel_volume": parcelVolumeTextEditingController.text.trim(),
      "parcel_fee": calculateFeeBasedOnParcelInfo(mass, volume).toStringAsFixed(1),
    };

    //referenceCourierRequest = FirebaseDatabase.instance.ref().child("all courier requests").push();

    Navigator.pop(context, parcelInformationMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(70.0),
                child: Image.asset("images/Parcel.png"),
              ),

              const Text(
                "Add Parcel Details",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40,),

              DropdownButton(
                iconSize: 40,
                dropdownColor: Colors.grey[700],
                hint: const Text(
                  "Parcel Type",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                value: selectedParcelType,
                onChanged: (newValue)
                {
                  setState(() {
                    selectedParcelType = newValue.toString();
                  });
                },
                items: parcelTypesList.map((parcel) {
                  return DropdownMenuItem(
                    value: parcel,
                    child: Text (
                      parcel,
                      style: const TextStyle(
                        color: Colors.white,
                      ),

                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 15,),

              TextField(
                controller: parcelMassTextEditingController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: Colors.white
                ),
                decoration: const InputDecoration(
                  labelText: "Parcel Mass (kg)",
                  hintText: "Parcel Mass (kg)",

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),

              TextField(
                controller: parcelVolumeTextEditingController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: Colors.white
                ),
                decoration: const InputDecoration(
                  labelText: "Parcel Volume (cm^3)",
                  hintText: "Parcel Volume (cm^3)",

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),


              const SizedBox(height: 60,),

              ElevatedButton(
                onPressed: () {
                  // todo condition for parcel mass and volume
                  if(parcelMassTextEditingController.text.trim().isNotEmpty
                      && parcelVolumeTextEditingController.text.trim().isNotEmpty
                      && selectedParcelType != null)
                  {
                    setParcelInfo();
                  }
                  else
                    {
                      Fluttertoast.showToast(msg: "Please fill out all the necessary details.");
                    }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  "Search Deliverymen",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
