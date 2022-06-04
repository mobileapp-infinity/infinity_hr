import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  final RxBool _isLoading = false.obs;
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  SharedPreferences? sharedPreferences;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  ChangePasswordModel? changePasswordModel;
  String? userId = "-";
  final RxBool _isObscureForOld = true.obs;
  final RxBool _isObscureForNew = true.obs;
  final RxBool _isObscureForConfirm = true.obs;

  @override
  void initState() {
    prefs.then((instance) => sharedPreferences = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
            child: Image.asset("assets/images/ic_back_final.png",color: Colors.black,scale: 3.5,)),
        title:const Text("Change Password",style: TextStyle(color: Colors.black),),
        elevation: 0,
      ),
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
                // Image.asset(
                //     height: deviceSize.height * 0.18,
                //     width: deviceSize.height * 0.18,
                //     "assets/images/logo.png"),
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
                        obscureText: _isObscureForOld.value,
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
                          prefixIcon:
                              Image.asset("assets/images/change_psw_black.png"),
                          suffixIcon: Material(
                            color: Colors.white,
                            child: Obx(
                              () => _isObscureForOld.value
                                  ? InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        setState(() {
                                          _isObscureForOld.value =
                                              !_isObscureForOld.value;
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
                                          _isObscureForOld.value =
                                              !_isObscureForOld.value;
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
                        obscureText: _isObscureForNew.value,
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
                          prefixIcon:
                              Image.asset("assets/images/change_psw_black.png"),
                          suffixIcon: Material(
                            color: Colors.white,
                            child: Obx(
                              () => _isObscureForNew.value
                                  ? InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        setState(() {
                                          _isObscureForNew.value =
                                              !_isObscureForNew.value;
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
                                          _isObscureForNew.value =
                                              !_isObscureForNew.value;
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
                        obscureText: _isObscureForConfirm.value,
                        scrollPadding: EdgeInsets.zero,
                        cursorColor: CustomColor.colorPrimary,
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: "Enter Confirm Password",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          prefixIcon:
                              Image.asset("assets/images/change_psw_black.png"),
                          suffixIcon: Material(
                            color: Colors.white,
                            child: Obx(
                              () => _isObscureForConfirm.value
                                  ? InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        setState(() {
                                          _isObscureForConfirm.value =
                                              !_isObscureForConfirm.value;
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
                                          _isObscureForConfirm.value =
                                              !_isObscureForConfirm.value;
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
                            content: Text("please enter old password"),
                          ),
                        );
                        _isLoading.value = false;
                        return;
                      }
                      if (_newPasswordController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("please enter new password"),
                          ),
                        );
                        _isLoading.value = false;
                        return;
                      }
                      if (_confirmPasswordController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("please enter confirm password"),
                          ),
                        );
                        _isLoading.value = false;
                        return;
                      }
                      if (_newPasswordController.text.trim() ==
                          _confirmPasswordController.text.trim()) {
                        changePasswordApiCall(
                                _oldPasswordController.text.trim().toString(),
                                _confirmPasswordController.text
                                    .trim()
                                    .toString())
                            .then((message) {
                          Fluttertoast.showToast(msg: message!);
                          if (message == "Password Changed") {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          }
                        });
                      } else {
                        Fluttertoast.showToast(
                            msg:
                                "new password and confirm password are not same!");
                      }
                      _isLoading.value = false;
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

  Future<String?> changePasswordApiCall(oldPassword, newPassword) async {
    // http://iipl.iipl.info/ierphr.asmx/Employee_Change_password?&user_id=294&ip=1&oldPassword=Welcome_IIPL&newPassword=Welcome_IIPL
    userId = sharedPreferences!.getString("usrm_id");
    try {
      await Future.delayed(
        const Duration(seconds: 10),
      );
      final response = await http.get(Uri.parse(
          '${ApiUrls.baseUrl}Employee_Change_password?&user_id=$userId&ip=1&oldPassword=$oldPassword&newPassword=$newPassword'));
      if (kDebugMode) {
        print(userId);
      }
      if (response.statusCode == 200) {
        changePasswordModel = (json.decode(response.body) as List)
            .map((e) => ChangePasswordModel.fromJson(e))
            .toList()
            .first;
        return changePasswordModel!.msg.toString();
      } else {
        return "something Went Wrong please try again later";
      }
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    }
    return null;
  }
}
