import 'dart:async';

import 'package:flutter/material.dart';

import '../assistants/assistant_methods.dart';
import '../authentication/login_screen.dart';
import '../global/global.dart';
import '../mainScreens/main_screen.dart';


class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  startTimer()
  {
    fAuth.currentUser != null ? AssistantMethods.readCurrentOnlineUserInfo() : null;

    Timer(const Duration(seconds: 3), () async
    {
      if (await fAuth.currentUser != null)
        {
          currentFirebaseUser = fAuth.currentUser;
          if(!mounted) return;
          Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));
        }
      else
        {
          if(!mounted) return;
          Navigator.push(context, MaterialPageRoute(builder: (c)=> const LoginScreen()));
        }

    });
  }

  @override
  void initState() {

    super.initState();

    startTimer();
  }
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Container(
        color: Colors.grey[850],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(70.0),
                child: Image.asset("images/Logo.png"),
              ),

              const SizedBox(height: 10,),
            ]
          )
        ),
      ),
    );
  }
}
