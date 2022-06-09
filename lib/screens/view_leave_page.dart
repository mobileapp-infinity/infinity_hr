import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:infinity_hr/api/api_urls.dart';
import 'package:infinity_hr/models/employee_leave_balance_model.dart';
import 'package:infinity_hr/utils/custom_colors.dart';
import 'package:infinity_hr/utils/navigator_constants.dart';
import 'package:infinity_hr/widgets/my_badge.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ViewLeaveScreen extends StatefulWidget {
  const ViewLeaveScreen({Key? key}) : super(key: key);

  @override
  State<ViewLeaveScreen> createState() => _ViewLeaveScreenState();
}

class _ViewLeaveScreenState extends State<ViewLeaveScreen> {
  RxInt totalPenCount = 0.obs;
  String _empCode = "";
  String _empId = "";
  String _userId = "";
  SharedPreferences? sharedPreferences;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late RxBool _pendingAllSwitch = false.obs;
  late RxList<LeaveListModel> viewLeaveListModelList =
      RxList<LeaveListModel>([]);
  late RxBool _isLoading = true.obs;

  @override
  void initState() {
    _prefs.then(
      (prefsInstance) {
        sharedPreferences = prefsInstance;
        getPreferencesAndVersionInfo();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            "assets/images/ic_back_final.png",
            color: Colors.black,
            scale: 3.5,
          ),
        ),
        title: const Text(
          "View Leaves",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(
            top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
        child: Card(
          margin: const EdgeInsets.only(bottom: 50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Obx(
            () => _isLoading.value == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : viewLeaveListModelList.isEmpty
                    ? const Center(
                        child: Text('No Data Found!'),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'View Leaves',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'Pending/All',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Obx(
                                    () => Switch(
                                      value: _pendingAllSwitch.value,
                                      onChanged: (value) {
                                        _pendingAllSwitch.value = value;
                                        getLeaveListApiCall(
                                            value == true ? '1' : '2');
                                      },
                                      activeColor: Colors.yellow,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'Status',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'From Date',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'To Date',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 50,
                              itemBuilder: (context, index) {
                                return Container(
                                  color: index % 2 == 0
                                      ? Colors.red.shade100
                                      : Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '${viewLeaveListModelList[index].Leave_Status}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        '${viewLeaveListModelList[index].From_date}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        '${viewLeaveListModelList[index].To_date}',
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: CustomColor.colorPrimary,
        child: Row(
          children: [
            SizedBox(
              height: 45,
              width: 45,
              // margin: EdgeInsets.all(10),
              child: Obx(
                () => MyBadge(
                  top: 6,
                  right: 2,
                  value: totalPenCount.toString(),
                  child: Image.asset(
                    "assets/images/edt_profile.png",
                    scale: 2.5,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Employee Code: $_empCode",
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
      ),
    );
  }

  void getLeaveListApiCall(String status) async {
    try {
      viewLeaveListModelList.clear();
      _isLoading.value = true;
      final response = await http.get(Uri.parse(
          '${ApiUrls.baseUrl}Get_leave_application_list?&emp_id=$_empId&RowsPerPage=1000&PageNumber=1&status=$status'));
      if (response.statusCode == 200) {
        viewLeaveListModelList.value = (json.decode(response.body) as List)
            .map((e) => LeaveListModel.fromJson(e))
            .toList();
      }
      _isLoading.value = false;
    } catch (error) {
      _isLoading.value = false;
      _showToast(msg: error.toString());
    }
  }

  void _showToast({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: CustomColor.colorPrimary,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void getPreferencesAndVersionInfo() async {
    _empCode = sharedPreferences!.getString('emp_code') ?? "";
    _empId = sharedPreferences!.getString('emp_id') ?? "";
    _userId = sharedPreferences!.getString('usrm_id') ?? "";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    NavigatorConstants.APP_VERSION.value = packageInfo.version;
    getLeaveListApiCall('1');
  }
}
