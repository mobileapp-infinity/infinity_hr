import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_hr/utils/custom_colors.dart';
import 'package:infinity_hr/utils/navigator_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonBottomSheet extends StatefulWidget {
  CommonBottomSheet({super.key, required this.devicesize});

  Size devicesize;

  @override
  State<CommonBottomSheet> createState() => _CommonBottomSheetState();
}

class _CommonBottomSheetState extends State<CommonBottomSheet> {


  SharedPreferences? sharedPreferences;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
String empName = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.devicesize.height * 0.05,
      color: CustomColor.colorPrimary,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                  "Employee Code: ${empName}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Obx(
              () => Text(
                NavigatorConstants.APP_VERSION.value.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _prefs.then(

          (prefsInstance) {
        sharedPreferences = prefsInstance;
        empName = sharedPreferences!.getString('emp_code') ?? "";
        setState((){});
      },
    );
  }
}
