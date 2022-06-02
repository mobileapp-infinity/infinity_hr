import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_hr/api/api_urls.dart';
import 'package:infinity_hr/models/get_today_in_out_time_model.dart';
import 'package:infinity_hr/models/last_in_out_model.dart';
import 'package:infinity_hr/screens/login_screen.dart';
import 'package:infinity_hr/utils/custom_colors.dart';
import 'package:infinity_hr/widgets/my_badge.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final RxBool _isWhichSelected = true.obs;
  String _empCode = "";
  String _empId = "";
  String _userId = "";
  LastInOutModel? lastInOutModel;
  GetTodayInOutTimeModel? getTodayInOutTimeModel;
  SharedPreferences? sharedPreferences;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    _prefs.then(
      (prefeInstance) {
        sharedPreferences = prefeInstance;
        getPreferences();
        lastInOutApiCall();
        getTodayInOutTimeApiCall();
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
                scale: 1,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Log Out'),
              onTap: () {
                logOut().then(
                  (_) => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen())),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
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
                                      : Colors.black54),
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
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 160,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              padding: const EdgeInsets.all(20),
              children: [
                Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/view_leave_final_red.png"),
                      Text(
                        textAlign: TextAlign.center,
                        "View Leaves",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/add_leave_final_red.png"),
                      Text(
                        textAlign: TextAlign.center,
                        "Add Leave",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/leave_balance_final_red.png"),
                      Text(
                        textAlign: TextAlign.center,
                        "Leave Balance",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                          "assets/images/view_cancel_leave_final_red.png"),
                      Text(
                        textAlign: TextAlign.center,
                        "View Cancel Leaves",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/leave_approval_final_red.png"),
                      Text(
                        textAlign: TextAlign.center,
                        "Leave Approval",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                          "assets/images/cancel_leave_approval_final_red.png"),
                      Text(
                        textAlign: TextAlign.center,
                        "Cancel Leave Approval",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet:
          // Padding(
          //   padding:
          //       EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          //   child:
          Container(
        color: CustomColor.colorPrimary,
        child: Row(
          children: [
            SizedBox(
              height: 45,
              width: 45,
              // margin: EdgeInsets.all(10),
              child: MyBadge(
                top: 6,
                right: 2,
                value: "10",
                child: Image.asset(
                  "assets/images/edt_profile.png",
                  scale: 2.5,
                ),
              ),
            ),
            Text(
              "Employe Code: $_empCode",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  lastInOutApiCall() async {
    try {
      final response = await http.get(
          Uri.parse('${ApiUrls.BASE_URL}Get_Dashboard_detail?&emp_id=$_empId'));
      if (response.statusCode == 200) {
        List<LastInOutModel> lastinoutmodel = (json.decode(response.body)
                as List)
            .map((e) => LastInOutModel.fromJson(e))
            .toList(); //  LoginCheckModel.fromJson(jsonDecode(response.body[0]));

        print("last in${lastinoutmodel[0].lastIn}");
        print("last out${lastinoutmodel[0].lastOut}");
        print("is parent${lastinoutmodel[0].isParent}");
        print("coffIsDisplay${lastinoutmodel[0].coffIsDisplay}");
      } else {
        // Get.snackbar("oops!", "something went wrong");
        throw Exception("Something Went Wrong");
      }
    } catch (error) {
      print(error.toString());
    }
  }

  getTodayInOutTimeApiCall() async {
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

  Future<void> logOut() async {
    await sharedPreferences!.clear();
  }

  getPreferences() {
    _empCode = sharedPreferences!.getString('emp_code') ?? "";
    _empId = sharedPreferences!.getString('emp_id') ?? "";
    _userId = sharedPreferences!.getString('usrm_id') ?? "";
  }
}
