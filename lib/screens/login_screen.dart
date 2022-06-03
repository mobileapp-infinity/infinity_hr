import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_hr/api/api_urls.dart';
import 'package:infinity_hr/screens/ForgotPasswordScreen.dart';
import 'package:infinity_hr/screens/dashboard_screen.dart';
import 'package:infinity_hr/models/login_check_model.dart';
import 'package:infinity_hr/utils/custom_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userIdController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  LoginCheckModel? loginCheckModel;
  SharedPreferences? sharedPreferences;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final RxBool _isObscure = true.obs;
  final RxBool _isLoading = false.obs;
  static const _redColor = CustomColor.colorPrimary;

  @override
  void initState() {
    _prefs.then(
      (prefeInstance) {
        sharedPreferences = prefeInstance;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
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
                    "Sign In With Password",
                    style: TextStyle(color: _redColor, fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                        padding: EdgeInsets.only(left: 22, bottom: 5),
                        child: Text(
                          "User ID",
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
                    padding: const EdgeInsets.only(left: 25, top: 3),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _userIdController,
                      decoration: InputDecoration(
                        hintText: "User Id",

                        border: InputBorder.none,
                        // enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // focusedErrorBorder: InputBorder.none,
                        prefixIcon: Image.asset("assets/images/envelop.png"),
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                        padding: EdgeInsets.only(left: 22, bottom: 5),
                        child: Text(
                          "Password",
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
                        obscureText: _isObscure.value,
                        scrollPadding: EdgeInsets.zero,
                        cursorColor: CustomColor.colorPrimary,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
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
                      backgroundColor:
                          MaterialStateProperty.all<Color>(_redColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {
                      _isLoading.value = true;
                      if (_userIdController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: const Text("please enter username")));
                        _isLoading.value = false;
                        return;
                      }
                      if (_passwordController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("please enter username")));
                        _isLoading.value = false;
                        return;
                      }
                      String username = _userIdController.text.trim();
                      String password = _passwordController.text.trim();

                      loginApiCall(username, password)
                          .then((value) => _isLoading.value = false);
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
                Padding(
                  padding: const EdgeInsets.only(top: 17),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const ForgotPasswordScreen()));
                    },
                    child: const Text(
                      "Forgot PassWord?",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginApiCall(String username, String password) async {
    try {
      final response = await http.get(Uri.parse(
          '${ApiUrls.BASE_URL}LoginCheck?&userName=$username&passWord=$password'));
      if (response.statusCode == 200) {
        loginCheckModel = (json.decode(response.body) as List)
            .map((e) => LoginCheckModel.fromJson(e))
            .toList()
            .first; //  LoginCheckModel.fromJson(jsonDecode(response.body[0]));
        if (loginCheckModel!.status == 1) {
          setPrefrences(loginCheckModel!);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            ),
          );
        } else {
          Fluttertoast.showToast(msg: "User Not Found!");
        }
      } else {
        Fluttertoast.showToast(msg: "something Went Wrong");
        throw Exception("Something Went Wrong");
      }
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
      print(error.toString());
    }
  }

  Future<void> setPrefrences(LoginCheckModel model) async {
    sharedPreferences!.setString("emp_code", model.empCode.toString());
    sharedPreferences!.setString("usrm_dis_name", model.usrmDisName.toString());
    sharedPreferences!.setString("usrm_name", model.usrmName.toString());
    sharedPreferences!.setString("usrm_id", model.usrmId.toString());
    sharedPreferences!.setString("emp_id", model.empId.toString());
  }
}
