import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinity_hr/api/api_urls.dart';
import 'package:infinity_hr/api/dio_client.dart';
import 'package:infinity_hr/screens/dashboard_screen.dart';
import 'package:infinity_hr/screens/login_screen.dart';
import 'package:infinity_hr/screens/verion_model.dart';
import 'package:infinity_hr/utils/app_dialogs.dart';
import 'package:infinity_hr/utils/icon_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? sharedPreferences;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    _prefs.then(
      (prefeInstance) {
        sharedPreferences = prefeInstance;
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
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void apicall() async {
    AppDialog.showCustomizeProgressDialog(
        context: context, msg: 'Please wait...');
    Response response = await DioClient.getDioClient()!
        .get(ApiUrls.BASE_URL + 'Get_app_version');
    Navigator.of(context).pop();
    if (response.statusCode == 200) {
      List<version> updateverlist = (json.decode(response.data) as List)
          .map((x) => version.fromJson(x))
          .toList();
      if (updateverlist.isNotEmpty) {
      } else {
        _showToast(
            message:
                'Something went wrong,Please try again later ${response.statusCode}');
      }
    } else {
      _showToast(
          message:
              'Something went wrong,Please try again later ${response.statusCode}');
    }
  }
}
