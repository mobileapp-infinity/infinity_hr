import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_hr/screens/ForgotPasswordScreen.dart';
import 'package:infinity_hr/screens/dashboard_screen.dart';
import 'package:infinity_hr/screens/login_check_model.dart';
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
  static const _redColor = Color(0xffE21E23);

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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 25),
                  child: TextField(
                    cursorColor: Colors.red,
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
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 25),
                  child: TextField(
                    obscureText: _isObscure.value,
                    scrollPadding: EdgeInsets.zero,
                    cursorColor: Colors.red,
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
                    if (_userIdController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("please enter username")));
                      return;
                    }
                    if (_passwordController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("please enter username")));
                      return;
                    }
                    String username = _userIdController.text.trim();
                    String password = _passwordController.text.trim();

                    loginApiCall(username, password);
                  },
                  child: const Text("Sign In"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 17),
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
            ]),
          ),
        ),
      ),
    );
  }

  loginApiCall(String username, String password) async {
    try {
      final response = await http.get(Uri.parse(
          'http://iipl.iipl.info/ierphr.asmx/LoginCheck?&userName=$username&passWord=$password'));
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
          Get.snackbar("oops!", "something went wrong");
        }
      } else {
        Get.snackbar("oops!", "something went wrong");
        throw Exception("Something Went Wrong");
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> setPrefrences(LoginCheckModel model) async {
    sharedPreferences!.setString("emp_code", model.empCode.toString());
    sharedPreferences!.setString("usrm_dis_name", model.usrmDisName.toString());
    sharedPreferences!.setString("usrm_name", model.usrmName.toString());
    sharedPreferences!.setString("usrm_id", model.usrmId.toString());
  }
}
