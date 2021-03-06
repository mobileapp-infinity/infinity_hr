import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinity_hr/api/api_urls.dart';
import 'package:infinity_hr/screens/dashboard_screen.dart';
import 'package:infinity_hr/screens/login_screen.dart';
import 'package:infinity_hr/models/version_model.dart';
import 'package:infinity_hr/utils/app_dialogs.dart';
import 'package:infinity_hr/utils/custom_colors.dart';
import 'package:infinity_hr/utils/icon_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? sharedPreferences;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    _prefs.then(
      (prefsInstance) {
        sharedPreferences = prefsInstance;
        checkLoginAndGoAhead();
      },
    );
    super.initState();
  }

  void checkLoginAndGoAhead() {
    bool isLoggedIn = (sharedPreferences!.containsKey('usrm_id') &&
        sharedPreferences!.containsKey('emp_code'));
    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          splash,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: CustomColor.colorPrimary,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
