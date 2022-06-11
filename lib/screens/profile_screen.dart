import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  SharedPreferences? sharedPreferences;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late final RxBool _isLoading = true.obs;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
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
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.red,
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
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset(
                        'assets/images/profile_bg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Card(
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
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Image.asset('assets/images/profile_bg.png',height: 40.0,width: 40.0,),
                              title: Text('Employee Code'),
                              subtitle: Text('1032'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Image.asset('assets/images/profile_bg.png',height: 40.0,width: 40.0,),
                              title: Text('Employee Name'),
                              subtitle: Text('Parvez Sir'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Image.asset('assets/images/profile_bg.png',height: 40.0,width: 40.0,),
                              title: Text('Reporting To'),
                              subtitle: Text('Parvez Sir'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Image.asset('assets/images/profile_bg.png',height: 40.0,width: 40.0,),
                              title: Text('Branch'),
                              subtitle: Text('IIPL'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Image.asset('assets/images/profile_bg.png',height: 40.0,width: 40.0,),
                              title: Text('Department'),
                              subtitle: Text('Wonders Heaven'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Image.asset('assets/images/profile_bg.png',height: 40.0,width: 40.0,),
                              title: Text('Designmation'),
                              subtitle: Text('Master In Android'),
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
      ),
      bottomSheet: CommonBottomSheet(
        devicesize: deviceSize,
      ),
    );
  }
}
