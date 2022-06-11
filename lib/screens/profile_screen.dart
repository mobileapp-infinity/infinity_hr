import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_hr/utils/custom_colors.dart';
import 'package:infinity_hr/widgets/common_appbar.dart';
import 'package:infinity_hr/widgets/common_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  RxInt totalPenCount = 0.obs;
  String _empId = "";
  String _empName = "";
  String _empReportingTo = "";
  String _empBranch = "";
  String _empDepartment = "";
  String _empDesignation = "";
  SharedPreferences? sharedPreferences;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late final RxBool _isLoading = true.obs;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppBar(title: "Profile"),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  color: CustomColor.colorPrimary,
                ),
              ),
              const Expanded(
                flex: 6,
                child: SizedBox(),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Container(
                    height: deviceSize.height * 0.20,
                    child: Card(
                      elevation: 10,
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(600),
                        child: Image.asset(
                          'assets/images/noimage.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Card(
                  elevation: 10,
                  margin: const EdgeInsets.only(
                    bottom: 60.0,
                    left: 16.0,
                    right: 16.0,
                    top: 16.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 5),
                              leading: Image.asset(
                                'assets/images/user_profile.png',
                                height: 40.0,
                                width: 40.0,
                              ),
                              title: Text('Employee Code'),
                              subtitle: _empId == "null"
                                  ? Text("-")
                                  : Text(_empId.toString()),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 5),
                              leading: Image.asset(
                                'assets/images/user_profile.png',
                                height: 40.0,
                                width: 40.0,
                              ),
                              title: Text('Employee Name'),
                              subtitle: _empName == "null"
                                  ? Text("-")
                                  : Text(_empName.toString()),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 5),
                              leading: Image.asset(
                                'assets/images/reporting.png',
                                height: 40.0,
                                width: 40.0,
                              ),
                              title: Text('Reporting To'),
                              subtitle: _empReportingTo == "null"
                                  ? Text("-")
                                  : Text(_empReportingTo.toString()),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 5),
                              leading: Image.asset(
                                'assets/images/branch.png',
                                height: 40.0,
                                width: 40.0,
                              ),
                              title: Text('Branch'),
                              subtitle: _empBranch == "null"
                                  ? Text("-")
                                  : Text(_empBranch.toString()),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 5),
                              leading: Image.asset(
                                'assets/images/dept.png',
                                height: 40.0,
                                width: 40.0,
                              ),
                              title: Text('Department'),
                              subtitle: _empDepartment == "null"
                                  ? Text("-")
                                  : Text(_empDepartment.toString()),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 5),
                              leading: Image.asset(
                                'assets/images/designation.png',
                                height: 40.0,
                                width: 40.0,
                              ),
                              title: Text('Designation'),
                              subtitle: _empDesignation == "null"
                                  ? Text("-")
                                  : Text(_empDesignation.toString()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: CommonBottomSheet(
        devicesize: deviceSize,
      ),
    );
  }

  @override
  void initState() {
    _prefs
        .then((prefsinstance) => sharedPreferences = prefsinstance)
        .then((value) {
      _empId = sharedPreferences!.getString("emp_code") ?? "-";
      _empName = sharedPreferences!.getString("FullName") ?? "-";
      _empReportingTo = sharedPreferences!.getString("Reportingto") ?? "-";
      _empBranch = sharedPreferences!.getString("Branch") ?? "-";
      _empDepartment = sharedPreferences!.getString("Department") ?? "-";
      _empDesignation = sharedPreferences!.getString("Designation") ?? "-";
      setState(() {});
    });
    super.initState();
  }
}
