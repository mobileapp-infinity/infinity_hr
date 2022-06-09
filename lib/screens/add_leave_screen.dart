import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinity_hr/api/api_urls.dart';
import 'package:infinity_hr/models/apply_cancel_leave_application.dart';
import 'package:infinity_hr/models/cancel_leave_mail_model.dart';
import 'package:infinity_hr/models/delete_leave.dart';
import 'package:infinity_hr/models/employee_leave_balance_model.dart';
import 'package:infinity_hr/models/get_employee_leave_days.dart';
import 'package:infinity_hr/models/get_leave_detail_model.dart';
import 'package:infinity_hr/models/getemployeeinouttime.dart';
import 'package:infinity_hr/models/getleavetypeandreasonandnotestatusone.dart';
import 'package:infinity_hr/models/getleavetypeandreasonandnotestatusthree.dart';
import 'package:infinity_hr/models/getleavetypeandreasonandnotestatustwo.dart';
import 'package:infinity_hr/models/insert_leave.dart';
import 'package:infinity_hr/utils/custom_colors.dart';
import 'package:infinity_hr/widgets/common_appbar.dart';
import 'package:infinity_hr/widgets/common_bottom_sheet.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class AddLeaveScreen extends StatefulWidget {
  const AddLeaveScreen({Key? key}) : super(key: key);

  @override
  State<AddLeaveScreen> createState() => _AddLeaveScreenState();
}

class _AddLeaveScreenState extends State<AddLeaveScreen> {
  static const _redColor = CustomColor.colorPrimary;

  final RxBool _isLoading = false.obs;
  bool _checkboxForEmergencyLeave = false;
  int groupValue = -1;
  String _fullName = "";
  String _userId = "";
  String _empId = "";
  String dateForToDate = "";
  String dateForFromDate = "";
  String timeForToDate = "";
  String timeForFromDate = "";
  RxDouble calculatedDays = 1.0.obs;
 int  selectedLeaveTypeId=0;
  DateTime firstDateOfToDate = DateTime.now();
  final TextEditingController _employeeNameController = TextEditingController();
  final TextEditingController _leaveTypeController = TextEditingController();
  final TextEditingController _leaveBalanceController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _dayCountController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _addressWhileOnLeaveController =
      TextEditingController();
  final TextEditingController _contactWhileOnLeaveController =
      TextEditingController();
  List<GetLeaveTypeAndReasonAndNoteStatusOne>?
      getleavetypeandreasonandnotestatusone = [];
  final RxInt _selectLeaveTypeDropDownPosition = 0.obs;
  final RxInt _selectLeaveReasonDropDownPosition = 0.obs;
  final RxBool _isLeaveTypeLoading = true.obs;
  List<GetLeaveTypeAndReasonAndNoteStatusTwo>?
      getleavetypeandreasonandnotestatustwo=[];
  GetLeaveTypeAndReasonAndNoteStatusThree?
      getleavetypeandreasonandnotestatusthree;
  GetEmployeeInOutTime? getEmployeeInOutTime;
  GetEmployeeLeaveDays? getEmployeeLeaveDays;
  LeaveDetail? leaveDetail;
  InertLeave? insertLeave;
  DeleteLeave? deleteLeave;
  EmployeeLeaveBalanceModel? employeeLeaveBalanceModel;
  ApplyCancelLeaveApplication? applyCancelLeaveApplication;
  CancelLeaveMail? cancelLeaveMail;
  SharedPreferences? sharedPreferences;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy ");
  @override
  void initState() {
    _fromDateController.text ="${dateFormat.format(DateTime.now())} 9:00 AM";
    _toDateController.text ="${dateFormat.format(DateTime.now())} 7:00 PM";
    dateForToDate=dateFormat.format(DateTime.now());
    dateForFromDate=dateFormat.format(DateTime.now());
    timeForToDate = "7:00 PM";
    timeForFromDate = "9:00 AM";
    _prefs.then(

          (prefsInstance) {
        sharedPreferences = prefsInstance;
        _fullName = sharedPreferences!.getString('FullName') ?? "";
        _employeeNameController.text = _fullName;
        _userId = sharedPreferences!.getString('usrm_id') ?? "";
        _empId = sharedPreferences!.getString('emp_id') ?? "";
      },
    );
    getLeaveTypeAndReasonAndNoteApiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
   //HH:mm:ss
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
                      enabled: false,
                      cursorColor: CustomColor.colorPrimary,
                      controller: _employeeNameController,
                      decoration: const InputDecoration(
                        hintText: "Employee Name",
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
            ), //Employee Name
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: deviceSize.width * 0.06,
                        top: deviceSize.height * 0.010),
                    child: const Text(
                      "Leave Type",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 0,right: 25.0),
                    child: DropdownButtonHideUnderline(
                      child: Obx(
                            () => _isLeaveTypeLoading.value
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : DropdownButton(
                          value:
                          _selectLeaveTypeDropDownPosition
                              .value,
                          onChanged: (position) {
                            _selectLeaveTypeDropDownPosition
                                .value = position as int;
                            if(_selectLeaveTypeDropDownPosition.value > 0){
                               selectedLeaveTypeId = getleavetypeandreasonandnotestatusone![_selectLeaveTypeDropDownPosition.value].id!;
                              calculateLeaveBalance(selectedLeaveTypeId);

                              //TODO API CALL For Leave Type Drop dow
                            }
                          },
                          items: [
                            ...getleavetypeandreasonandnotestatusone!
                                .map(
                                  (e) => DropdownMenuItem(
                                value: e.position,
                                child: Text(
                                  '${e.ltmLeaveName}',
                                  style: const TextStyle(
                                    color: CustomColor
                                        .colorPrimary,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                            )
                                .toList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ), //Leave Type
            Container(
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
                      controller: _leaveBalanceController,
                      decoration: const InputDecoration(
                        hintText: "Enter Balance Leave",
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
            ), //Leave Balance
            Container(
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
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            enabled: false,
                            // onTap: () {
                            //   showDatePicker(
                            //       context: context,
                            //       initialDate: DateTime.now(),
                            //       firstDate: DateTime(1900),
                            //       lastDate: DateTime(2100));
                            // },
                            focusNode: FocusNode(canRequestFocus: false),
                            cursorColor: CustomColor.colorPrimary,
                            controller: _fromDateController,
                            decoration: InputDecoration(
                              hintText:
                                  "${dateFormat.format(DateTime.now())} 9:00 AM",
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
                        IconButton(
                          icon: const Icon(
                            Icons.calendar_month_outlined,
                            color: CustomColor.colorPrimary,
                          ),
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (context, picker) {
                                  return Theme(
                                    //TODO: change colors
                                    data: ThemeData.dark().copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: CustomColor.colorPrimary,
                                        onPrimary: Colors.white,
                                        surface: CustomColor.colorPrimary,
                                        //
                                      ),
                                      dialogBackgroundColor: Colors.white,
                                    ),
                                    child: picker!,
                                  );
                                }).then((selectedDate) {
                              //TODO: handle selected date
                              if (selectedDate != null) {
                                firstDateOfToDate = selectedDate;
                                print(selectedDate);
                                var sdate = dateFormat.format(selectedDate);
                                dateForFromDate = sdate.toString();
                              } else {
                                return;
                              }
                            }).then((_) {
                              if (dateForFromDate != "") {
                                showTimePicker(
                                    context: context,
                                    initialTime: const TimeOfDay(
                                      hour: 09,
                                      minute: 00,
                                    )).then((selectedTime) {
                                  if (selectedTime != null) {
                                    print(selectedTime.format(context));
                                    timeForFromDate =
                                        selectedTime.format(context);
                                    _fromDateController.text =
                                        "$dateForFromDate $timeForFromDate";
                                  } else {
                                    return;
                                  }
                                });
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), //From Date
            Container(
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
                      "To Date",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 3),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            enabled: false,
                            cursorColor: CustomColor.colorPrimary,
                            controller: _toDateController,
                            decoration: InputDecoration(
                              hintText:
                                  "${dateFormat.format(DateTime.now())} 7:00 PM",
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
                        IconButton(
                          icon: const Icon(
                            Icons.calendar_month_outlined,
                            color: CustomColor.colorPrimary,
                          ),
                          onPressed: () {
                            print("first date$firstDateOfToDate");
                            print("init date${DateTime.now()}");
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (context, picker) {
                                  return Theme(
                                    //
                                    //TODO: change colors
                                    data: ThemeData.dark().copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: CustomColor.colorPrimary,
                                        onPrimary: Colors.white,
                                        surface: CustomColor.colorPrimary,
                                        //
                                      ),
                                      dialogBackgroundColor: Colors.white,
                                    ),
                                    child: picker!,
                                  );
                                }).then((selectedDate) {
                              //TODO: handle selected date
                              if (selectedDate != null) {
                                print(selectedDate);
                                var sdate = dateFormat.format(selectedDate);
                                dateForToDate = sdate.toString();
                              } else {
                                return;
                              }
                            }).then((_) {
                              if (dateForToDate != "") {
                                showTimePicker(
                                    context: context,
                                    initialTime: const TimeOfDay(
                                      hour: 19,
                                      minute: 00,
                                    )).then((selectedTime) {
                                  if (selectedTime != null) {
                                    print(selectedTime.format(context));
                                    timeForToDate =
                                        selectedTime.format(context);
                                    _toDateController.text =
                                        "$dateForToDate $timeForToDate";

                                    calculateLeaveDaysApiCall(
                                        dateForFromDate, dateForToDate);
                                  } else {
                                    return;
                                  }
                                });
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), //To Date
            Container(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 25, top: 3),
                      child: Obx(
                        () => TextField(
                          enabled: false,
                          cursorColor: CustomColor.colorPrimary,
                          controller: _dayCountController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: calculatedDays.value.toString(),
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
                      )),
                ],
              ),
            ), //Day
            Container(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 3),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _remarkController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Remark",
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
            ), //Remark
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    padding: const EdgeInsets.only(left: 25, top: 3,right: 25),
                      child: DropdownButtonHideUnderline(
                              child: Obx(
                                    () => _isLeaveTypeLoading.value
                                    ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                    : DropdownButton(
                                  value:
                                    _selectLeaveReasonDropDownPosition
                                      .value,
                                  onChanged: (position) {
                                    _selectLeaveReasonDropDownPosition
                                        .value = position as int;
                                    if(_selectLeaveReasonDropDownPosition.value > 0){
                                      int selectedLeaveTypeId = getleavetypeandreasonandnotestatustwo![_selectLeaveReasonDropDownPosition.value].ebdValue!;
                                      //TODO API CALL For Leave Type Drop dow
                                    }
                                  },
                                  items: [
                                    ...getleavetypeandreasonandnotestatustwo!
                                        .map(
                                          (e) => DropdownMenuItem(
                                        value: e.position,
                                        child: Text(
                                          '${e.ebdName}',
                                          style: const TextStyle(
                                            color: CustomColor
                                                .colorPrimary,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                    )
                                        .toList(),
                                  ],
                                ),
                              ),


                    ),
                  ),
                ],
              ),
            ), //Reason
            Container(
              height: deviceSize.height*0.20,
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
                      maxLines: 3,
                      cursorColor: CustomColor.colorPrimary,
                      controller: _addressWhileOnLeaveController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Address",
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
                      keyboardType: TextInputType.streetAddress,
                    ),
                  ),
                ],
              ),
            ), //Address
            Container(
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
                          top: deviceSize.height * 0.020),
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
                      controller: _contactWhileOnLeaveController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Contact no",
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
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ), //contact while on Leave
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
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
                    value: 0,
                    groupValue: groupValue,
                    onChanged: (val) {
                      setState(() {
                        groupValue = 0;
                      });
                    }),
              ),
            ), //radio 2
            Padding(
              padding: EdgeInsets.only(left: deviceSize.width * 0.4),
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -3),
                title: const Text('Not Applicable'),
                leading: Radio(
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (val) {
                      setState(() {
                        groupValue = 2;
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
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 45),
                  child: Obx(
                    () => _isLeaveTypeLoading.value
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Note:- ${getleavetypeandreasonandnotestatusthree!.notes}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ), //Note:-)
            ),
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
                    onPressed: () {
                      if(_selectLeaveTypeDropDownPosition.value ==0){
                        _showToast(msg: "please select leave type");
                        return;
                      }//select leave type
                      if(_remarkController.text.isEmpty){
                        _showToast(msg: "please enter remark");
                      return;
                      }//enter remarks
                      if(_selectLeaveReasonDropDownPosition.value ==0 ){
                        _showToast(msg: "please select reason type");
                      return;
                      }
                      addLeaveApiCall();
                    },
                    child: Obx(
                      () => _isLoading.value
                          ? GestureDetector(
                        onTap: (){

                          //select reason
                        },
                            child: const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.0,
                                ),
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
                        const BorderSide(
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
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
                          : const Text("Cancel"),
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

  getLeaveTypeAndReasonAndNoteApiCall() async {
    for (int i = 1; i <= 3; i++) {
      try {
        final response = await http.get(Uri.parse(
            '${ApiUrls.baseUrl}Get_leave_type_and_reason_and_note?&status=$i&ip=1'));

        if (response.statusCode == 200) {
          if (i == 1) {
            getleavetypeandreasonandnotestatusone!.clear();
            getleavetypeandreasonandnotestatusone!.add(GetLeaveTypeAndReasonAndNoteStatusOne(position: 0,id: -1,ltmLeaveName: 'Select Leave Type'));
            getleavetypeandreasonandnotestatusone!.addAll((json.decode(response.body)
            as List)
                .map((e) => GetLeaveTypeAndReasonAndNoteStatusOne.fromJson(e))
                .toList());

            for(int  i = 1 ; i < getleavetypeandreasonandnotestatusone!.length; i ++){
              getleavetypeandreasonandnotestatusone![i].position = i;
            }

            // addDataToLists();
          } else if (i == 2) {
            getleavetypeandreasonandnotestatustwo!.clear();
            getleavetypeandreasonandnotestatustwo!.add(GetLeaveTypeAndReasonAndNoteStatusTwo(position: 0,ebdValue: -1,ebdName: 'Select Reason'));
            getleavetypeandreasonandnotestatustwo!.addAll((json.decode(response.body)
            as List)
                .map((e) => GetLeaveTypeAndReasonAndNoteStatusTwo.fromJson(e))
                .toList());

            for(int  i = 1 ; i < getleavetypeandreasonandnotestatustwo!.length; i ++){
              getleavetypeandreasonandnotestatustwo![i].position = i;
            }

          } else {
            getleavetypeandreasonandnotestatusthree = (json
                    .decode(response.body) as List)
                .map((e) => GetLeaveTypeAndReasonAndNoteStatusThree.fromJson(e))
                .toList()
                .first;
            _isLeaveTypeLoading.value = false;
          }
        } else {
          _showToast(msg: "Please Try Again Later");
        }
      } catch (error) {
        _showToast(msg: error.toString());
        if (kDebugMode) {
          print(error.toString());
        }
      }
    }
  } //Get_leave_type_and_reason_and_note

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
      _showToast(msg: error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    }
  } //Get_employee_inout_time

  calculateLeaveDaysApiCall(String fromDate, String toDate) async {
    try {
      print(fromDate);
      print(toDate);
      final response = await http.get(Uri.parse(
          '${ApiUrls.baseUrl}Get_Employee_Leave_Days?&from_date=$fromDate&to_date=$toDate&empid=120'));
      // print('${ApiUrls.baseUrl}Get_Employee_Leave_Days?&from_date=$fromDate&to_date=$toDate&empid=$_empId');
      if (kDebugMode) {
        // print(_empId);
      }
      if (response.statusCode == 200) {
        getEmployeeLeaveDays = (json.decode(response.body) as List)
            .map((e) => GetEmployeeLeaveDays.fromJson(e))
            .toList()
            .first;
        calculatedDays.value = double.parse(getEmployeeLeaveDays!.days!);
        print("calculated days ${calculatedDays.value}");
        //print(getEmployeeLeaveDays!.msg);
        calculatedDays.value = double.parse(getEmployeeLeaveDays!.days!);
        print(calculatedDays.value);
      } else {
        return "something Went Wrong please try again later";
      }
    } catch (error) {
      _showToast(msg: error.toString());
      if (kDebugMode) {
        print(error.toString());
        print("in calculate api");
      }
    }
  } //Get_Employee_Leave_Days

  addLeaveApiCall(
      {leaveId,
      leaveType,
      fromDate,
      toDate,
      remark,
      reasonId,
      loadAdjustId,
      leaveDays,
      }) async {
    try {
      String _isEmergency="0";
      if(_checkboxForEmergencyLeave==true){
        _isEmergency ="1";
      }
      String ipAddress ="1";
      final response = await http.get(Uri.parse(
          //"&leave_id=" + leave_IDD + "&emp_id=" + mySharedPrefereces.getEmpID() + "&leave_type=" + leave_ID +
          // "&from_date=" + IN_date_time + "&to_date=" + Out_date_time + "&remark=" + edtremark.getText().toString().trim()
          // + "&reason=" + Reason_ID + "&load_adjusted=" + load_adjust_ID + "&address_while_on_leave="+ edtadd.getText().toString().trim() +
          // "&contact_no=" + edtconno.getText().toString().trim() + "&leave_days=" + edtday.getText().toString().trim() +
          // "&emergency_leave=" + is_emergency + "&user_id=" + mySharedPrefereces.getUserID() +
          // "&ip_address=" + "1" + "&leave_balance=" + edtleavebalance.getText().toString().trim() + ""

         // http://iipl.iipl.info/ierphr.asmx/Employee_leave_application_insert?&leave_id=0&emp_id=138&leave_type=4&from_date=09/06/2022%2012:00:00&to_date=25/06/2022%2012:00:00&remark=test1234&reason=2&load_adjusted=1&address_while_on_leave=&contact_no=&leave_days=1.0&emergency_leave=1&user_id=246&ip_address=1&leave_balance=0

          //empid,user id find from sharedpreference,ip address=1,


          '${ApiUrls.baseUrl}Employee_leave_application_insert?&leave_id=0&emp_id=$_empId&leave_type=${selectedLeaveTypeId.toString()}&from_date=${_fromDateController.text}&to_date=${_toDateController.text}&remark=${_remarkController.text}&reason=${_selectLeaveReasonDropDownPosition.value}&load_adjusted=1&address_while_on_leave=${_addressWhileOnLeaveController.text}&contact_no=${_contactWhileOnLeaveController.text}&leave_days=${_dayCountController.text}&emergency_leave=$_isEmergency&user_id=$_userId&ip_address=1&leave_balance=${_leaveBalanceController.text}'));
    print(          '${ApiUrls.baseUrl}Employee_leave_application_insert?&leave_id=0&emp_id=$_empId&leave_type=${selectedLeaveTypeId.toString()}&from_date=${_fromDateController.text}&to_date=${_toDateController.text}&remark=${_remarkController.text}&reason=${_selectLeaveReasonDropDownPosition.value}&load_adjusted="1"&address_while_on_leave=${_addressWhileOnLeaveController.text}&contact_no=${_contactWhileOnLeaveController.text}&leave_days=${_dayCountController.text}&emergency_leave=$_isEmergency&user_id=$_userId&ip_address=${ipAddress}&leave_balance=${_leaveBalanceController.text}'
    );

     if (kDebugMode) {}
      if (response.statusCode == 200) {
        insertLeave = (json.decode(response.body) as List)
            .map((e) => InertLeave.fromJson(e))
            .toList()
            .first;
        _showToast(msg: insertLeave!.msg!);
      } else {
        print("notworking");
        return "something Went Wrong please try again later";
      }
    } catch (error) {
      _showToast(msg: error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    }
  } //Employee_leave_application_insert

  deleteLeaveApiCall(String id) async {
    try {
      final response = await http.get(Uri.parse(
          '${ApiUrls.baseUrl}employee_leave_application_mst_delete?&id=$id&user_id=$_userId&empid=$_empId&ip="1"'));
      if (kDebugMode) {
        deleteLeave = (json.decode(response.body) as List)
            .map((e) => DeleteLeave.fromJson(e))
            .toList()
            .first;
        _showToast(msg: deleteLeave!.msg.toString());
      }
      if (response.statusCode == 200) {
      } else {
        return "something Went Wrong please try again later";
      }
    } catch (error) {
      _showToast(msg: error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    }
  } //employee_leave_application_mst_delete

  getLeaveDetailApiCall(String id) async {
    try {
      final response = await http
          .get(Uri.parse('${ApiUrls.baseUrl}Get_leave_detail?&id=$id'));
      if (kDebugMode) {
        leaveDetail = (json.decode(response.body) as List)
            .map((e) => LeaveDetail.fromJson(e))
            .toList()
            .first;
      }
      if (response.statusCode == 200) {
        _showToast(msg: leaveDetail!.id.toString());
      } else {
        _showToast(msg: 'something Went Wrong please try again later');
      }
    } catch (error) {
      _showToast(msg: error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    }
  } //Get_leave_detail

  void calculateLeaveBalance(int leaveType) async {
    try {
      final response = await http.get(Uri.parse(
          '${ApiUrls.baseUrl}Get_Employee_Leave_balance?&emp_id=$_empId&leave_type=$leaveType'));
      if (kDebugMode) {
        employeeLeaveBalanceModel = (json.decode(response.body) as List)
            .map((e) => EmployeeLeaveBalanceModel.fromJson(e))
            .toList()
            .first;

      }
      if (response.statusCode == 200) {
          _leaveBalanceController.text= employeeLeaveBalanceModel!.balance.toString();
      } else {
        _showToast(msg: 'something Went Wrong please try again later');
      }
    } catch (error) {
      _showToast(msg: error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    }
  } //Get_Employee_Leave_balance

  void applyCancelLeaveApplicationApiCall(
      String id, String userId, String leaveType) async {
    try {
      final response = await http.get(Uri.parse(
          '${ApiUrls.baseUrl}Apply_Cancel_Leave_application?&emp_id=$_empId&leave_type=$leaveType'));
      if (kDebugMode) {
        applyCancelLeaveApplication = (json.decode(response.body) as List)
            .map((e) => ApplyCancelLeaveApplication.fromJson(e))
            .toList()
            .first;
      }
      if (response.statusCode == 200) {
        _showToast(msg: employeeLeaveBalanceModel!.balance.toString());
      } else {
        _showToast(msg: 'something Went Wrong please try again later');
      }
    } catch (error) {
      _showToast(msg: error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    }
  } //Apply_Cancel_Leave_application

  void ApplyCancelLeaveMailSend(String id) async {
    try {
      final response = await http.get(Uri.parse(
          '${ApiUrls.baseUrl}Apply_Cancel_Leave_application?&id=$id'));
      if (kDebugMode) {
        cancelLeaveMail = (json.decode(response.body) as List)
            .map((e) => CancelLeaveMail.fromJson(e))
            .toList()
            .first;
      }
      if (response.statusCode == 200) {
        _showToast(msg: cancelLeaveMail!.Data.toString());
      } else {
        _showToast(msg: 'something Went Wrong please try again later');
      }
    } catch (error) {
      _showToast(msg: error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    }
  } //Apply_Cancel_Leave_application

  //
  // addDataToLists(){
  //   for(int i=1;i<getleavetypeandreasonandnotestatusone!.length - 1 ;i++){
  //     _LeaveType.add(getleavetypeandreasonandnotestatusone![i].ltmLeaveName!);
  //   }
  // }
  //

  void _showToast({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
