import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {

  String? message;
  ProgressDialog({this.message});


  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: Colors.black12,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const SizedBox(width: 6,),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),

              const SizedBox(width: 26,),

              Text(
                message!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
