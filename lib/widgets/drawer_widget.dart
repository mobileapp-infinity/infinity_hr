import 'package:flutter/material.dart';
import 'package:infinity_hr/screens/add_leave_screen.dart';
import 'package:infinity_hr/screens/change_password_screen.dart';
import 'package:infinity_hr/screens/dashboard_screen.dart';
import 'package:infinity_hr/screens/login_screen.dart';
import 'package:infinity_hr/screens/view_leave_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  late DrawerMenuEnum drawerMenuEnum;
  late Function onDrawerMenuSelected;

  DrawerWidget({
    super.key,
    required this.sharedprefs,
    required DrawerMenuEnum drawerMenuEnum,
    required Function onDashboardMenuSelected,
  }) {
    this.drawerMenuEnum = drawerMenuEnum;
    this.onDrawerMenuSelected = onDashboardMenuSelected;
  }

  SharedPreferences? sharedprefs;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor: widget.drawerMenuEnum == DrawerMenuEnum.myProfile
                  ? Colors.red
                  : Colors.grey.shade200,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.myProfile
                      ? 'assets/images/my_profile_dra_white.png'
                      : 'assets/images/my_profile_dra_black.png'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'My Profile',
                style: TextStyle(
                    color: widget.drawerMenuEnum == DrawerMenuEnum.myProfile
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.myProfile);
              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor: widget.drawerMenuEnum == DrawerMenuEnum.viewLeaves
                  ? Colors.red
                  : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.viewLeaves
                      ? 'assets/images/view_leave_dra_white.png'
                      : 'assets/images/view_leave_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'View Leaves',
                style: TextStyle(
                    color: widget.drawerMenuEnum == DrawerMenuEnum.viewLeaves
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.viewLeaves);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewLeaveScreen()));

              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor: widget.drawerMenuEnum == DrawerMenuEnum.addLeave
                  ? Colors.red
                  : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.addLeave
                      ? 'assets/images/add_leave_dra_white.png'
                      : 'assets/images/add_leave_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'Add Leave',
                style: TextStyle(
                    color: widget.drawerMenuEnum == DrawerMenuEnum.addLeave
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.addLeave);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddLeaveScreen(id: "",isupdate: false,status: "",)));

              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor:
                  widget.drawerMenuEnum == DrawerMenuEnum.viewCancelLeaves
                      ? Colors.red
                      : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.viewCancelLeaves
                      ? 'assets/images/view_cancel_leave_dra_white.png'
                      : 'assets/images/view_cancel_leave_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'View Cancel Leaves',
                style: TextStyle(
                    color:
                        widget.drawerMenuEnum == DrawerMenuEnum.viewCancelLeaves
                            ? Colors.white
                            : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.viewCancelLeaves);
              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor: widget.drawerMenuEnum == DrawerMenuEnum.leaveBalance
                  ? Colors.red
                  : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.leaveBalance
                      ? 'assets/images/leave_balance_dra_white.png'
                      : 'assets/images/leave_balance_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'Leave Balance',
                style: TextStyle(
                    color: widget.drawerMenuEnum == DrawerMenuEnum.leaveBalance
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.leaveBalance);
              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor: widget.drawerMenuEnum == DrawerMenuEnum.viewMissPunch
                  ? Colors.red
                  : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.viewMissPunch
                      ? 'assets/images/view_miss_punch_dra_white.png'
                      : 'assets/images/view_miss_punch_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'View Miss Punch',
                style: TextStyle(
                    color: widget.drawerMenuEnum == DrawerMenuEnum.viewMissPunch
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.viewMissPunch);
              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor: widget.drawerMenuEnum == DrawerMenuEnum.addMissPunch
                  ? Colors.red
                  : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.addMissPunch
                      ? 'assets/images/add_miss_punch_dra_white.png'
                      : 'assets/images/add_miss_punch_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'Add Miss Punch',
                style: TextStyle(
                    color: widget.drawerMenuEnum == DrawerMenuEnum.addMissPunch
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.addMissPunch);
              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor:
                  widget.drawerMenuEnum == DrawerMenuEnum.attendanceReport
                      ? Colors.red
                      : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.attendanceReport
                      ? 'assets/images/attendance_report_dra_white.png'
                      : 'assets/images/attendance_report_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'Attendence Report',
                style: TextStyle(
                    color:
                        widget.drawerMenuEnum == DrawerMenuEnum.attendanceReport
                            ? Colors.white
                            : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.attendanceReport);
              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor: widget.drawerMenuEnum == DrawerMenuEnum.statistics
                  ? Colors.red
                  : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.statistics
                      ? 'assets/images/leave_balance_dra_white.png'
                      : 'assets/images/leave_balance_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'Statistics',
                style: TextStyle(
                    color: widget.drawerMenuEnum == DrawerMenuEnum.statistics
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.statistics);
              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor: widget.drawerMenuEnum == DrawerMenuEnum.salarySlip
                  ? Colors.red
                  : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.salarySlip
                      ? 'assets/images/salary_slip_dra_white.png'
                      : 'assets/images/salary_slip_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'Salary Slip',
                style: TextStyle(
                    color: widget.drawerMenuEnum == DrawerMenuEnum.salarySlip
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.salarySlip);
              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor: widget.drawerMenuEnum == DrawerMenuEnum.changePassword
                  ? Colors.red
                  : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.changePassword
                      ? 'assets/images/chnage_psw_dra_white.png'
                      : 'assets/images/change_psw_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'Change Password',
                style: TextStyle(
                    color:
                        widget.drawerMenuEnum == DrawerMenuEnum.changePassword
                            ? Colors.white
                            : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.changePassword);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => ChangePasswordScreen()));
              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor: widget.drawerMenuEnum == DrawerMenuEnum.leaveApproval
                  ? Colors.red
                  : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.leaveApproval
                      ? 'assets/images/leave_approval_dra_white.png'
                      : 'assets/images/leave_apprval_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'Leave Approval',
                style: TextStyle(
                    color: widget.drawerMenuEnum == DrawerMenuEnum.leaveApproval
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.leaveApproval);
              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor:
                  widget.drawerMenuEnum == DrawerMenuEnum.cancelLeaveApproval
                      ? Colors.red
                      : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.cancelLeaveApproval
                      ? 'assets/images/cancel_leave_aaproval_dra_white.png'
                      : 'assets/images/cancel_leave_approval_dra_black.png'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'Cancel Leave Approval',
                style: TextStyle(
                    color: widget.drawerMenuEnum ==
                            DrawerMenuEnum.cancelLeaveApproval
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.cancelLeaveApproval);
              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor:
                  widget.drawerMenuEnum == DrawerMenuEnum.missPunchApproval
                      ? Colors.red
                      : Colors.grey.shade200,
              autofocus: true,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.missPunchApproval
                      ? 'assets/images/miss_punch_app_dra_white.png'
                      : 'assets/images/miss_punch_app_dra_black.png'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                'Miss Punch Approval',
                style: TextStyle(
                    color: widget.drawerMenuEnum ==
                            DrawerMenuEnum.missPunchApproval
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.missPunchApproval);
              },
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              tileColor: widget.drawerMenuEnum == DrawerMenuEnum.logOut
                  ? Colors.red
                  : Colors.grey.shade200,
              leading: Image.asset(
                  widget.drawerMenuEnum == DrawerMenuEnum.logOut
                      ? 'assets/images/logout_dra_white.png'
                      : 'assets/images/logout_dra_black.png'),
              title: Text(
                'Log Out',
                style: TextStyle(
                    color: widget.drawerMenuEnum == DrawerMenuEnum.logOut
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
                widget.onDrawerMenuSelected(DrawerMenuEnum.logOut);

                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => LoginScreen())
                widget.sharedprefs!.clear();
                logOut().then(
                  (_) => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen())),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> logOut() async {
    await widget.sharedprefs!.clear();
  }
}
