import 'dart:async';

import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/routes.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setBool(Preferences.is_logged_in, true));
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: Colors.amber[900],
          child: Center(
              child:
                  Text("Boilerplate Project", style: TextStyle(fontSize: 30)))),
    );
  }

  startTimer() {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigate);
  }

  navigate() async {
      Navigator.of(context).pushReplacementNamed(Routes.base);
  }
}
