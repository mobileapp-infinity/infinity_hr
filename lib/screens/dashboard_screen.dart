import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_hr/api/api_urls.dart';
import 'package:infinity_hr/models/Get_Employe_Pending_Approval_model.dart';
import 'package:infinity_hr/models/get_today_in_out_time_model.dart';
import 'package:infinity_hr/models/last_in_out_model.dart';
import 'package:infinity_hr/screens/login_screen.dart';
import 'package:infinity_hr/utils/custom_colors.dart';
import 'package:infinity_hr/utils/navigator_constants.dart';
import 'package:infinity_hr/widgets/drawer_widget.dart';
import 'package:infinity_hr/widgets/leave_widgets/grid_widget_for_leave.dart';
import 'package:infinity_hr/widgets/leave_widgets/last_in_out_widget_for_leave.dart';
import 'package:infinity_hr/widgets/miss_punch_widgets/grid_widget_for_miss_punch.dart';
import 'package:infinity_hr/widgets/miss_punch_widgets/last_in_out_for_miss_punch.dart';
import 'package:infinity_hr/widgets/my_badge.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final RxBool _isWhichSelected = true.obs;
  final RxBool _isLastInOutAvailbale = false.obs;
  String _empCode = "";
  String _empId = "";
  String _userId = "";
  RxInt totalpencount = 0.obs;
  List<LastInOutModel>? lastinoutmodel;
  GetTodayInOutTimeModel? getTodayInOutTimeModel;
  SharedPreferences? sharedPreferences;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final Rx<DashboardMenuEnum> _dashboardMenuEnum =
      Rx<DashboardMenuEnum>(DashboardMenuEnum.none);

  void onDashboardMenuSelected(DashboardMenuEnum dashboardMenuEnum) {
    _dashboardMenuEnum.value = dashboardMenuEnum;
  }

  @override
  void initState() {
    _prefs.then(
      (prefeInstance) {
        sharedPreferences = prefeInstance;
        getPreferencesAndVersionInfo();
        lastInOutApiCall();
        getTodayInOutTimeApiCall();
        getEmployePendingApprovals();
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
      drawer: DrawerWidget(
        sharedprefs: sharedPreferences,
      ),
      body: Obx(
        () => _isWhichSelected.value
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_isLastInOutAvailbale.value)
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                                      "Add Leave",
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
                    if (_isLastInOutAvailbale.value)
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                  value: totalpencount.toString(),
                  child: Image.asset(
                    "assets/images/edt_profile.png",
                    scale: 2.5,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Employe Code: $_empCode",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Obx(
                () => Text(
                  NavigatorConstants.APP_VERSION.value.toString(),
                  style: TextStyle(
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
          Uri.parse('${ApiUrls.BASE_URL}Get_Dashboard_detail?&emp_id=$_empId'));
      if (response.statusCode == 200) {
        lastinoutmodel = (json.decode(response.body) as List)
            .map((e) => LastInOutModel.fromJson(e))
            .toList(); //  LoginCheckModel.fromJson(jsonDecode(response.body[0]));
        if (lastinoutmodel != null) {
          if (lastinoutmodel!.length == 0) {
            lastinoutmodel = [];
          } else {
            _isLastInOutAvailbale.value = true;
          }
        } else {
          _isLastInOutAvailbale.value = false;
        }
      } else {
        // Get.snackbar("oops!", "something went wrong");
        throw Exception("Something Went Wrong");
      }
    } catch (error) {
      print(error.toString());
    }
  }

  void getTodayInOutTimeApiCall() async {
    try {
      //http://iipl.iipl.info/ierphr.asmx/Get_Today_in_out_time?&user_id=201
      final response = await http.get(Uri.parse(
          '${ApiUrls.BASE_URL}Get_Today_in_out_time?&user_id=$_userId'));
      if (response.statusCode == 200) {
        List<GetTodayInOutTimeModel> inouttimemodel =
            (json.decode(response.body) as List)
                .map((e) => GetTodayInOutTimeModel.fromJson(e))
                .toList();

        print("inTime${inouttimemodel[0].intime}");
        print("outTime${inouttimemodel[0].outtime}");
      } else {
        throw Exception("Something Went Wrong");
      }
    } catch (error) {
      print(error.toString());
    }
  }

  void getEmployePendingApprovals() async {
    try {
      //http://iipl.iipl.info/ierphr.asmx/Get_Today_in_out_time?&user_id=201
      final response = await http.get(Uri.parse(
          '${ApiUrls.BASE_URL}Get_employee_pending_approvals?&user_id=$_userId'));
      if (response.statusCode == 200) {
        List<GetEmployePendingApproval> pendingapproval =
            (json.decode(response.body) as List)
                .map((e) => GetEmployePendingApproval.fromJson(e))
                .toList();
        if (pendingapproval.length > 0) {
          for (int i = 1; i <= pendingapproval.length; i++) {
            totalpencount.value =
                pendingapproval[i - 1].penCount! + totalpencount.value;
          }
        } else {
          totalpencount.value = 0;
        }
      } else {
        throw Exception("Something Went Wrong");
      }
    } catch (error) {
      print(error.toString());
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
