
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinity_hr/another_screen.dart';
import 'package:infinity_hr/utils/icon_utils.dart';

import 'utils/custom_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SizedBox(),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    iipl_logo,
                    width: 200,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'Infinity Infoway PVT.LTD.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.6,
                      letterSpacing: 1.4,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AnotherScreen()),
              );
            }, child: Text('Going To Other Screen'),),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Card(
                elevation: 4.0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Design & Developed by: ',
                        style: TextStyle(
                            color: CustomColor.colorPrimary,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      SvgPicture.asset(
                        iipl_logo,
                        height: 38.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
