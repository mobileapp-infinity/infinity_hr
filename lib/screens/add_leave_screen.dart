import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinity_hr/api/api_urls.dart';
import 'package:infinity_hr/models/getemployeeinouttime.dart';
import 'package:infinity_hr/models/getleavetypeandreasonandnotestatusone.dart';
import 'package:infinity_hr/models/getleavetypeandreasonandnotestatusthree.dart';
import 'package:infinity_hr/models/getleavetypeandreasonandnotestatustwo.dart';
import 'package:infinity_hr/utils/custom_colors.dart';
import 'package:infinity_hr/widgets/common_appbar.dart';
import 'package:infinity_hr/widgets/common_bottom_sheet.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddLeaveScreen extends StatefulWidget {
  const AddLeaveScreen({Key? key}) : super(key: key);

  @override
  State<AddLeaveScreen> createState() => _AddLeaveScreenState();
}

class _AddLeaveScreenState extends State<AddLeaveScreen> {
  static const _redColor = CustomColor.colorPrimary;
  RxBool _isLoading = false.obs;
  bool _checkboxForEmergencyLeave = false;
  int groupValue = 0;
  String _fullName = "";
  String _userId = "";
  String _empId = "";

  TextEditingController _employeeNameController = TextEditingController();
  GetLeaveTypeAndReasonAndNoteStatusOne? getleavetypeandreasonandnotestatusone;
  GetLeaveTypeAndReasonAndNoteStatusTwo? getleavetypeandreasonandnotestatustwo;
  GetLeaveTypeAndReasonAndNoteStatusThree?
      getleavetypeandreasonandnotestatusthree;
  GetEmployeeInOutTime? getEmployeeInOutTime;
  SharedPreferences? sharedPreferences;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    _prefs.then(
      (prefsInstance) {
        sharedPreferences = prefsInstance;
        _fullName = sharedPreferences!.getString('FullName') ?? "";
        _userId = sharedPreferences!.getString('usrm_id') ?? "";
        _userId = sharedPreferences!.getString('emp_id') ?? "";
        getleavetypeandreasonandnote();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppBar(
        title: "Add Leave",
      ),
      bottomSheet: CommonBottomSheet(
        devicesize: deviceSize,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: deviceSize.height * 0.10,
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: deviceSize.width * 0.06,
                        top: deviceSize.height * 0.010),
                    child: const Text(
                      "Employee Name",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _employeeNameController,
                      decoration: const InputDecoration(
                        hintText: "Employee name",
                        border: InputBorder.none,
                        // enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // focusedErrorBorder: InputBorder.none,
                        // prefixIcon: Image.asset("assets/images/envelop.png"),
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
            ), //Employee Name
            Container(
              height: deviceSize.height * 0.10,
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.06,
                          top: deviceSize.height * 0.010),
                      child: const Text(
                        "Leave Type",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 3),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _employeeNameController,
                      decoration: InputDecoration(
                        hintText: "Select Leave",
                        suffixIcon: DropdownButton(
                            items: <String>['A', 'B', 'C', 'D']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {}),
                        border: InputBorder.none,
                        // enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // focusedErrorBorder: InputBorder.none,
                        // prefixIcon: Image.asset("assets/images/envelop.png"),
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
            ), //Leave Type
            Container(
              height: deviceSize.height * 0.10,
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.06,
                          top: deviceSize.height * 0.010),
                      child: const Text(
                        "Leave Balance",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 3),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _employeeNameController,
                      decoration: const InputDecoration(
                        hintText: "Enter Balance Leave",
                        border: InputBorder.none,
                        // enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // focusedErrorBorder: InputBorder.none,
                        // prefixIcon: Image.asset("assets/images/envelop.png"),
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
            ), //Leave Balance
            Container(
              height: deviceSize.height * 0.10,
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.06,
                          top: deviceSize.height * 0.010),
                      child: const Text(
                        "From Date",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 3),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _employeeNameController,
                      decoration: const InputDecoration(
                        hintText: "06/06/2022",
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                        // enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // focusedErrorBorder: InputBorder.none,
                        // prefixIcon: Image.asset("assets/images/envelop.png"),
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
            ), //From Date
            Container(
              height: deviceSize.height * 0.10,
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.06,
                          top: deviceSize.height * 0.010),
                      child: const Text(
                        "From Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 3),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _employeeNameController,
                      decoration: const InputDecoration(
                        hintText: "06/06/2022",
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                        // enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // focusedErrorBorder: InputBorder.none,
                        // prefixIcon: Image.asset("assets/images/envelop.png"),
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
            ), //To Date
            Container(
              height: deviceSize.height * 0.10,
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.06,
                          top: deviceSize.height * 0.010),
                      child: const Text(
                        "Day",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 3),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _employeeNameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "day",
                        // enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // focusedErrorBorder: InputBorder.none,
                        // prefixIcon: Image.asset("assets/images/envelop.png"),
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
            ), //Day
            Container(
              height: deviceSize.height * 0.10,
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.06,
                          top: deviceSize.height * 0.010),
                      child: const Text(
                        "Remarks",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 3),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _employeeNameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Remark",
                        // enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // focusedErrorBorder: InputBorder.none,
                        // prefixIcon: Image.asset("assets/images/envelop.png"),
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
            ), //Remark
            Container(
              height: deviceSize.height * 0.10,
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.06,
                          top: deviceSize.height * 0.010),
                      child: const Text(
                        "Reason",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 3),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _employeeNameController,
                      decoration: InputDecoration(
                        suffixIcon: DropdownButton(
                            items: <String>['A', 'B', 'C', 'D']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {}),
                        hintText: "Select Reason",
                        border: InputBorder.none,
                        // enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // focusedErrorBorder: InputBorder.none,
                        // prefixIcon: Image.asset("assets/images/envelop.png"),
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
            ), //Reason
            Container(
              height: deviceSize.height * 0.20,
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.06,
                          top: deviceSize.height * 0.010),
                      child: const Text(
                        "Address While on Leave",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 3),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _employeeNameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Address",
                        // enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // focusedErrorBorder: InputBorder.none,
                        // prefixIcon: Image.asset("assets/images/envelop.png"),
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
            ), //Address
            Container(
              height: deviceSize.height * 0.10,
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.06,
                          top: deviceSize.height * 0.010),
                      child: const Text(
                        "Contact no While On Leave",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 3),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _employeeNameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Contact no",
                        // enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // focusedErrorBorder: InputBorder.none,
                        // prefixIcon: Image.asset("assets/images/envelop.png"),
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ), //contact while on Leave
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: const Text(
                  "Load Adjust :-",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )), //Load Adjust

            Padding(
              padding: EdgeInsets.only(left: deviceSize.width * 0.4),
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -3),
                title: const Text('Yes'),
                leading: Radio(
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (val) {
                      setState(() {
                        groupValue = 1;
                      });
                    }),
              ),
            ), //radio 1
            Padding(
              padding: EdgeInsets.only(left: deviceSize.width * 0.4),
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -3),
                title: const Text('No'),
                leading: Radio(
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (val) {
                      setState(() {
                        groupValue = 2;
                      });
                    }),
              ),
            ), //radio 2
            Padding(
              padding: EdgeInsets.only(left: deviceSize.width * 0.4),
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -3),
                title: const Text('Not Aplicable'),
                leading: Radio(
                    value: 3,
                    groupValue: groupValue,
                    onChanged: (val) {
                      setState(() {
                        groupValue = 3;
                      });
                    }),
              ),
            ), //radio 3
            ListTile(
              visualDensity: const VisualDensity(vertical: -3),
              title: const Text('Apply For Emergency Leave'),
              leading: Checkbox(
                  value: _checkboxForEmergencyLeave,
                  onChanged: (val) {
                    setState(() {
                      _checkboxForEmergencyLeave = val!;
                    });
                  }),
            ), //radio 3
            const Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: const SizedBox(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 45),
                    child: Text(
                      "Note:- ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
              ),
            ), //Note:-
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: deviceSize.width * 0.40,
                  height: deviceSize.width * 0.10,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(_redColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Obx(
                      () => _isLoading.value
                          ? const SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                              ),
                            )
                          : const Text(
                              "Submit",
                            ),
                    ),
                  ),
                ), //Submit
                Container(
                  width: deviceSize.width * 0.40,
                  height: deviceSize.width * 0.10,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      side: MaterialStateProperty.all(
                        BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.black26,
                          width: 1.0,
                        ),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(_redColor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Obx(
                      () => _isLoading.value
                          ? const SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                              ),
                            )
                          : const Text(
                              "Cancel",
                            ),
                    ),
                  ),
                ), //Cancel
              ],
            ),
            SizedBox(
              height: deviceSize.height * 0.08,
            )
          ],
        ),
      ),
    );
  }

  getleavetypeandreasonandnote() async {
    for (int i = 1; i <= 3; i++) {
      try {
        final response = await http.get(Uri.parse(
            '${ApiUrls.baseUrl}Get_leave_type_and_reason_and_note?&status=$i&ip=1'));

        if (response.statusCode == 200) {
          if (i == 1) {
            getleavetypeandreasonandnotestatusone = (json.decode(response.body)
                    as List)
                .map((e) => GetLeaveTypeAndReasonAndNoteStatusOne.fromJson(e))
                .toList()
                .first;
          } else if (i == 2) {
            getleavetypeandreasonandnotestatustwo = (json.decode(response.body)
                    as List)
                .map((e) => GetLeaveTypeAndReasonAndNoteStatusTwo.fromJson(e))
                .toList()
                .first;
          } else {
            getleavetypeandreasonandnotestatusthree = (json
                    .decode(response.body) as List)
                .map((e) => GetLeaveTypeAndReasonAndNoteStatusThree.fromJson(e))
                .toList()
                .first;
          }
        } else {
          Fluttertoast.showToast(msg: "Please Try Again Later");
        }
      } catch (error) {
        Fluttertoast.showToast(msg: error.toString());
        if (kDebugMode) {
          print(error.toString());
        }
      }
    }
  }

  defaultInOutTimeDisplayApiCall() async {
//response :-[{"ebd_value":1,"ebd_name":"Social"},{"ebd_value":2,"ebd_name":"Personal"},{"ebd_value":3,"ebd_name":"Medical"},
// {"ebd_value":4,"ebd_name":"Office Work"},{"ebd_value":5,"ebd_name":"Particinaption in Event"},
// {"ebd_value":6,"ebd_name":"External Examiner"},{"ebd_value":7,"ebd_name":"Vacation Leave"}].

    try {
      final response = await http.get(Uri.parse(
          '${ApiUrls.baseUrl}Get_employee_inout_time?&emp_id=$_empId'));
      if (kDebugMode) {
        print(_empId);
      }
      if (response.statusCode == 200) {
        getEmployeeInOutTime = (json.decode(response.body) as List)
            .map((e) => GetEmployeeInOutTime.fromJson(e))
            .toList()
            .first;
      } else {
        return "something Went Wrong please try again later";
      }
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  calculateLeaveDays() {}

  addLeave(
      {leaveId,
      leaveType,
      fromDate,
      toDate,
      remark,
      reasonId,
      loadAdjustId,
      addressWhileOnLeave,
      contactNo,
      leaveDays,
      isEmergency,
      leaveBalance}) async {
    try {
      final response = await http.get(Uri.parse(
          //"&leave_id=" + leave_IDD + "&emp_id=" + mySharedPrefereces.getEmpID() + "&leave_type=" + leave_ID +
          // "&from_date=" + IN_date_time + "&to_date=" + Out_date_time + "&remark=" + edtremark.getText().toString().trim()
          // + "&reason=" + Reason_ID + "&load_adjusted=" + load_adjust_ID + "&address_while_on_leave="+ edtadd.getText().toString().trim() +
          // "&contact_no=" + edtconno.getText().toString().trim() + "&leave_days=" + edtday.getText().toString().trim() +
          // "&emergency_leave=" + is_emergency + "&user_id=" + mySharedPrefereces.getUserID() +
          // "&ip_address=" + "1" + "&leave_balance=" + edtleavebalance.getText().toString().trim() + ""

          //empid,user id find from sharedpreference,ip address=1,
          '${ApiUrls.baseUrl}Employee_leave_application_insert?&leave_id=$leaveId&emp_id=$_empId&leave_type=$leaveType&from_date=$fromDate&to_date=$toDate&remark=$remark&reason=$reasonId&load_adjusted=$loadAdjustId&emergency_leave=$isEmergency&user_id=$_userId&ip_address="1"&leave_balance=$leaveBalance'));
      if (kDebugMode) {}
      if (response.statusCode == 200) {
        getEmployeeInOutTime = (json.decode(response.body) as List)
            .map((e) => GetEmployeeInOutTime.fromJson(e))
            .toList()
            .first;
      } else {
        return "something Went Wrong please try again later";
      }
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
