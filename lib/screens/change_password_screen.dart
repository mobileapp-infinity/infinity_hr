import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinity_hr/api/api_urls.dart';
import 'package:infinity_hr/models/change_password_model.dart';
import 'package:infinity_hr/utils/custom_colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  RxBool _isLoading = false.obs;
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _cinfirmPasswordController = TextEditingController();
  SharedPreferences? sharedPreferences;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  ChangePasswordModel? changePasswordModel;
  String? userId = "-";
  final RxBool _isObscure = true.obs;

  @override
  void initState() {
    prefs.then((instance) => sharedPreferences = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sign_in_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    height: deviceSize.height * 0.18,
                    width: deviceSize.height * 0.18,
                    "assets/images/logo.png"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Change Password",
                    style: TextStyle(
                        color: CustomColor.colorPrimary, fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 22, bottom: 5),
                      child: Text(
                        "Old Password",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 55,
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 25),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        obscureText: false,
                        scrollPadding: EdgeInsets.zero,
                        cursorColor: CustomColor.colorPrimary,
                        controller: _oldPasswordController,
                        decoration: InputDecoration(
                          hintText: "Enter Old Password",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          prefixIcon: Image.asset("assets/images/password.png"),
                          suffixIcon: Material(
                            color: Colors.white,
                            child: Obx(
                              () => _isObscure.value
                                  ? InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        setState(() {
                                          _isObscure.value = !_isObscure.value;
                                        });
                                      },
                                      child: Image.asset(
                                        "assets/images/ic_action_passwordoff.png",
                                        scale: 2.5,
                                      ))
                                  : InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        setState(() {
                                          _isObscure.value = !_isObscure.value;
                                        });
                                      },
                                      child: Image.asset(
                                        "assets/images/ic_action_passwordon.png",
                                        scale: 2.5,
                                      )),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                        padding: EdgeInsets.only(left: 22, bottom: 5),
                        child: Text(
                          "New Password",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                Container(
                  height: 55,
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 25),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        obscureText: false,
                        scrollPadding: EdgeInsets.zero,
                        cursorColor: CustomColor.colorPrimary,
                        controller: _newPasswordController,
                        decoration: InputDecoration(
                          hintText: "Enter New Password",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          prefixIcon: Image.asset("assets/images/password.png"),
                          suffixIcon: Material(
                            color: Colors.white,
                            child: Obx(
                              () => _isObscure.value
                                  ? InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        setState(() {
                                          _isObscure.value = !_isObscure.value;
                                        });
                                      },
                                      child: Image.asset(
                                        "assets/images/ic_action_passwordoff.png",
                                        scale: 2.5,
                                      ))
                                  : InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        setState(() {
                                          _isObscure.value = !_isObscure.value;
                                        });
                                      },
                                      child: Image.asset(
                                        "assets/images/ic_action_passwordon.png",
                                        scale: 2.5,
                                      )),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                        padding: EdgeInsets.only(left: 22, bottom: 5),
                        child: Text(
                          "Confirm Password",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                Container(
                  height: 55,
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 25),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        obscureText: false,
                        scrollPadding: EdgeInsets.zero,
                        cursorColor: CustomColor.colorPrimary,
                        controller: _cinfirmPasswordController,
                        decoration: InputDecoration(
                          hintText: "Enter Confirm Password",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          prefixIcon: Image.asset("assets/images/password.png"),
                          suffixIcon: Material(
                            color: Colors.white,
                            child: Obx(
                              () => _isObscure.value
                                  ? InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        setState(() {
                                          _isObscure.value = !_isObscure.value;
                                        });
                                      },
                                      child: Image.asset(
                                        "assets/images/ic_action_passwordoff.png",
                                        scale: 2.5,
                                      ))
                                  : InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        setState(() {
                                          _isObscure.value = !_isObscure.value;
                                        });
                                      },
                                      child: Image.asset(
                                        "assets/images/ic_action_passwordon.png",
                                        scale: 2.5,
                                      )),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: deviceSize.width * 0.5,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          CustomColor.colorPrimary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {
                      _isLoading.value = true;
                      if (_oldPasswordController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    const Text("please enter oldpassword")));
                        _isLoading.value = false;
                        return;
                      }
                      if (_newPasswordController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("please enter newpassword")));
                        _isLoading.value = false;
                        return;
                      }
                      if (_cinfirmPasswordController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("please enter confirmpassword")));
                        _isLoading.value = false;
                        return;
                      }
                      if (_newPasswordController.text.trim() ==
                          _cinfirmPasswordController.text.trim()) {
                        changePasswordApiCall(
                                _oldPasswordController.text.trim().toString(),
                                _cinfirmPasswordController.text
                                    .trim()
                                    .toString())
                            .then((message) =>
                                Fluttertoast.showToast(msg: message!));
                      } else {
                        Fluttertoast.showToast(
                            msg:
                                "new password and cinfirm password are not same!");
                      }
                      _isLoading.value = false;
                    },
                    child: Obx(
                      () => _isLoading.value
                          ? SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                              ),
                            )
                          : const Text("Sign In"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> changePasswordApiCall(oldpass, newpass) async {
    // http://iipl.iipl.info/ierphr.asmx/Employee_Change_password?&user_id=294&ip=1&oldPassword=Welcome_IIPL&newPassword=Welcome_IIPL
    userId = sharedPreferences!.getString("usrm_id");
    try {
      final response = await http.get(Uri.parse(
          '${ApiUrls.BASE_URL}Employee_Change_password?&user_id=$userId&oldPassword=$oldpass&newPassword=$newpass'));
      print(userId);
      if (response.statusCode == 200) {
        changePasswordModel = (json.decode(response.body) as List)
            .map((e) => ChangePasswordModel.fromJson(e))
            .toList()
            .first;
        return changePasswordModel!.msg.toString();

        //  LoginCheckModel.fromJson(jsonDecode(response.body[0]));
        // if (loginCheckModel!.status == 1) {
        //   setPrefrences(loginCheckModel!);
        //   Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(
        //       builder: (context) => const DashboardScreen(),
        //     ),
        //   );
        // }
        // else {
        //     Fluttertoast.showToast(msg: "User Not Found!");
        //   }
      } else {
        return "something Went Wrong please try again later";
      }
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
      print(error.toString());
    }
    return null;
  }
}
