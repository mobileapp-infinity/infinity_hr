import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_hr/api/api_urls.dart';
import 'package:infinity_hr/models/Get_Employee_Pending_Approval_model.dart';
import 'package:infinity_hr/models/get_today_in_out_time_model.dart';
import 'package:infinity_hr/models/last_in_out_model.dart';
import 'package:infinity_hr/utils/custom_colors.dart';
import 'package:infinity_hr/utils/navigator_constants.dart';
import 'package:infinity_hr/widgets/drawer_widget.dart';
import 'package:infinity_hr/widgets/leave_widgets/grid_widget_for_leave.dart';
import 'package:infinity_hr/widgets/leave_widgets/last_in_out_widget_for_leave.dart';
import 'package:infinity_hr/widgets/miss_punch_widgets/grid_widget_for_miss_punch.dart';
import 'package:infinity_hr/widgets/miss_punch_widgets/last_in_out_for_miss_punch.dart';
import 'package:infinity_hr/widgets/my_badge.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DashboardMenuEnum {
  none,
  leaveViewLeaves,
  leaveAddLeaves,
  leaveLeaveBalance,
  leaveViewCancelLeaves,
  leaveLeaveApproval,
  leaveCancelLeaveApproval,
  missPunchViewMissPunch,
  missPunchAddMissPunch,
  missPunchMissPunchApproval,
}

enum DrawerMenuEnum {
  none,
  myProfile,
  viewLeaves,
  addLeave,
  viewCancelLeaves,
  leaveApproval,
  cancelLeaveApproval,
  leaveBalance,
  viewMissPunch,
  addMissPunch,
  missPunchApproval,
  attendanceReport,
  statistics,
  salarySlip,
  changePassword,
  logOut,
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final RxBool _isWhichSelected = true.obs;
  final RxBool _isLastInOutAvailable = false.obs;
  String _empCode = "";
  String _empId = "";
  String _userId = "";
  RxInt totalPenCount = 0.obs;
  List<LastInOutModel>? lastinoutmodel;
  GetTodayInOutTimeModel? getTodayInOutTimeModel;
  SharedPreferences? sharedPreferences;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final Rx<DashboardMenuEnum> _dashboardMenuEnum =
      Rx<DashboardMenuEnum>(DashboardMenuEnum.none);
  final Rx<DrawerMenuEnum> _drawerMenuEnum =
      Rx<DrawerMenuEnum>(DrawerMenuEnum.none);

  void onDashboardMenuSelected(DashboardMenuEnum dashboardMenuEnum) {
    _dashboardMenuEnum.value = dashboardMenuEnum;
  }

  void onDrawerMenuSelected(DrawerMenuEnum drawerMenuEnum) {
    _drawerMenuEnum.value = drawerMenuEnum;
    if (kDebugMode) {
      print(_drawerMenuEnum.value);
    }
  }

  @override
  void initState() {
    _prefs.then(
      (prefsInstance) {
        sharedPreferences = prefsInstance;
        getPreferencesAndVersionInfo();
        lastInOutApiCall();
        getTodayInOutTimeApiCall();
        getEmployeePendingApprovals();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.menu),
            color: CustomColor.colorPrimary,
            onPressed: () {
              Scaffold.of(ctx).openDrawer();
            },
          ),
        ),
        title: const Text(
          "INFINITY",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              child: Image.asset(
                "assets/images/logo.png",
                scale: 2.0,
              ),
            ),
          ),
        ],
      ),
      drawer: Obx(
        () => DrawerWidget(
          sharedprefs: sharedPreferences,
          drawerMenuEnum: _drawerMenuEnum.value,
          onDashboardMenuSelected: onDrawerMenuSelected,
        ),
      ),
      body: Obx(
        () => _isWhichSelected.value
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_isLastInOutAvailable.value)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: LastInLastOutForLeave(
                            lastinoutmodel: lastinoutmodel),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: GestureDetector(
                            onTap: () {
                              _isWhichSelected.value = true;
                            },
                            child: SizedBox(
                              height: deviceSize.height * 0.08,
                              width: deviceSize.width * 0.40,
                              child: Obx(
                                () => Card(
                                  color: _isWhichSelected.value
                                      ? CustomColor.colorPrimary
                                      : Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(13),
                                    ),
                                  ),
                                  elevation: 0,
                                  child: Center(
                                    child: Text(
                                      "Leave",
                                      style: TextStyle(
                                          fontSize:
                                              _isWhichSelected.value ? 17 : 15,
                                          fontWeight: FontWeight.bold,
                                          color: _isWhichSelected.value == true
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: GestureDetector(
                            onTap: () {
                              _isWhichSelected.value = false;
                            },
                            child: SizedBox(
                              height: deviceSize.height * 0.08,
                              width: deviceSize.width * 0.40,
                              child: Obx(
                                () => Card(
                                  color: _isWhichSelected.value == false
                                      ? CustomColor.colorPrimary
                                      : Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(13),
                                    ),
                                  ),
                                  elevation: 0,
                                  child: Center(
                                    child: Text(
                                      "Miss Punch",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: _isWhichSelected.value == false
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => GridViewForLeave(
                          dashboardMenuEnumParam: _dashboardMenuEnum.value,
                          onDashboardMenuSelected: onDashboardMenuSelected),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_isLastInOutAvailable.value)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: LastInOutForMissPunch(
                            lastinoutmodel: lastinoutmodel),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: GestureDetector(
                            onTap: () {
                              _isWhichSelected.value = true;
                            },
                            child: SizedBox(
                              height: deviceSize.height * 0.08,
                              width: deviceSize.width * 0.40,
                              child: Obx(
                                () => Card(
                                  color: _isWhichSelected.value
                                      ? CustomColor.colorPrimary
                                      : Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(13),
                                    ),
                                  ),
                                  elevation: 0,
                                  child: Center(
                                    child: Text(
                                      "Leave",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: _isWhichSelected.value == true
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: GestureDetector(
                            onTap: () {
                              _isWhichSelected.value = false;
                            },
                            child: SizedBox(
                              height: deviceSize.height * 0.08,
                              width: deviceSize.width * 0.40,
                              child: Obx(
                                () => Card(
                                  color: _isWhichSelected.value == false
                                      ? CustomColor.colorPrimary
                                      : Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(13),
                                    ),
                                  ),
                                  elevation: 0,
                                  child: Center(
                                    child: Text(
                                      "Miss Punch",
                                      style: TextStyle(
                                          fontSize:
                                              _isWhichSelected.value ? 15 : 16,
                                          fontWeight: FontWeight.bold,
                                          color: _isWhichSelected.value == false
                                              ? Colors.white
                                              : Colors.black54),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GridViewForMissPunch(
                        onDashboardMenuSelected: onDashboardMenuSelected,
                        dashboardMenuEnumParam: _dashboardMenuEnum.value),
                    const SizedBox(
                      height: 40.0,
                    ),
                  ],
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

  void lastInOutApiCall() async {
    try {
      final response = await http.get(
          Uri.parse('${ApiUrls.baseUrl}Get_Dashboard_detail?&emp_id=$_empId'));
      if (response.statusCode == 200) {
        lastinoutmodel = (json.decode(response.body) as List)
            .map((e) => LastInOutModel.fromJson(e))
            .toList(); //  LoginCheckModel.fromJson(jsonDecode(response.body[0]));
        if (lastinoutmodel != null) {
          if (lastinoutmodel!.isEmpty) {
            lastinoutmodel = [];
          } else {
            _isLastInOutAvailable.value = true;
          }
        } else {
          _isLastInOutAvailable.value = false;
        }
      } else {
        throw Exception("Something Went Wrong");
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  void getTodayInOutTimeApiCall() async {
    try {
      //http://iipl.iipl.info/ierphr.asmx/Get_Today_in_out_time?&user_id=201
      final response = await http.get(Uri.parse(
          '${ApiUrls.baseUrl}Get_Today_in_out_time?&user_id=$_userId'));
      if (response.statusCode == 200) {
        List<GetTodayInOutTimeModel> inouttimemodel =
            (json.decode(response.body) as List)
                .map((e) => GetTodayInOutTimeModel.fromJson(e))
                .toList();

        if (kDebugMode) {
          print("inTime${inouttimemodel[0].intime}");
        }
        if (kDebugMode) {
          print("outTime${inouttimemodel[0].outtime}");
        }
      } else {
        throw Exception("Something Went Wrong");
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  void getEmployeePendingApprovals() async {
    try {
      //http://iipl.iipl.info/ierphr.asmx/Get_Today_in_out_time?&user_id=201
      final response = await http.get(Uri.parse(
          '${ApiUrls.baseUrl}Get_employee_pending_approvals?&user_id=$_userId'));
      if (response.statusCode == 200) {
        List<GetEmployeePendingApproval> pendingapproval =
            (json.decode(response.body) as List)
                .map((e) => GetEmployeePendingApproval.fromJson(e))
                .toList();
        if (pendingapproval.isNotEmpty) {
          for (int i = 1; i <= pendingapproval.length; i++) {
            totalPenCount.value =
                pendingapproval[i - 1].penCount! + totalPenCount.value;
          }
        } else {
          totalPenCount.value = 0;
        }
      } else {
        throw Exception("Something Went Wrong");
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  void getPreferencesAndVersionInfo() async {
    _empCode = sharedPreferences!.getString('emp_code') ?? "";
    _empId = sharedPreferences!.getString('emp_id') ?? "";
    _userId = sharedPreferences!.getString('usrm_id') ?? "";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    NavigatorConstants.APP_VERSION.value = packageInfo.version;
  }
}
