import 'package:flutter/material.dart';
import 'package:infinity_hr/screens/change_password_screen.dart';
import 'package:infinity_hr/screens/dashboard_screen.dart';
import 'package:infinity_hr/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({super.key, required this.sharedprefs});

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
              tileColor: Colors.red,
              leading: Image.asset('assets/images/my_profile_dra_black.png'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('My Profile'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              autofocus: true,
              leading: Image.asset('assets/images/view_leave_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('View Leaves'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              autofocus: true,
              leading: Image.asset('assets/images/add_leave_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('Add Leave'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              autofocus: true,
              leading:
                  Image.asset('assets/images/view_cancel_leave_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('View Cancel Leaves'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              autofocus: true,
              leading: Image.asset('assets/images/leave_balance_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('Leave Balance'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              autofocus: true,
              leading:
                  Image.asset('assets/images/view_miss_punch_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('View Miss Punch'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              autofocus: true,
              leading:
                  Image.asset('assets/images/add_miss_punch_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('Add Miss Punch'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              autofocus: true,
              leading:
                  Image.asset('assets/images/attendance_report_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('Attendence Report'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              autofocus: true,
              leading: Image.asset('assets/images/leave_balance_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('Statistics'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              autofocus: true,
              leading: Image.asset('assets/images/salary_slip_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('Salary Slip'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              autofocus: true,
              leading: Image.asset('assets/images/change_psw_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('Change Password'),
              onTap: () {
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
              autofocus: true,
              leading: Image.asset('assets/images/leave_apprval_dra_black.png'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('Leave Approval'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              autofocus: true,
              leading: Image.asset(
                  'assets/images/cancel_leave_approval_dra_black.png'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('Cancel Leave Approval'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              autofocus: true,
              leading:
                  Image.asset('assets/images/miss_punch_app_dra_black.png'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: const Text('Miss Punch Approval'),
              onTap: () {},
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade200,
            child: ListTile(
              leading: Image.asset('assets/images/logout_dra_black.png'),
              title: const Text('Log Out'),
              onTap: () {
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
