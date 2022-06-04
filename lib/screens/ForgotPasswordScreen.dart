import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_hr/models/forgot_password_model.dart';
import 'package:infinity_hr/utils/custom_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _usernamecontroller = TextEditingController();
  ForgotPasswordModel? forgotPasswordModel;
  static const _redColor = Color(0xffE21E23);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Image.asset("assets/images/ic_back_final.png",color: Colors.black,scale: 3.5,)),
        title:const Text("Forgot Password",style: TextStyle(color: Colors.black),),
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(color: _redColor, fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 22, bottom: 5),
                    child: Text(
                      "User Name",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      cursorColor: CustomColor.colorPrimary,
                      controller: _usernamecontroller,
                      decoration: InputDecoration(
                        hintText: "Enter User Name",
                        border: InputBorder.none,
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
              ),
              SizedBox(
                width: deviceSize.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                      if (_usernamecontroller.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("please enter username")));
                        return;
                      }
                      String username = _usernamecontroller.text.trim();
                      forgotPassWordApiCall(username);
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  forgotPassWordApiCall(String username) async {
    try {
      final response = await http.get(Uri.parse(
          'http://iipl.iipl.info/ierphr.asmx/Employee_Forgot_password?&user_name=$username&ip=1'));
      if (response.statusCode == 200) {
        forgotPasswordModel = (json.decode(response.body) as List)
            .map((e) => ForgotPasswordModel.fromJson(e))
            .toList()
            .first; //  LoginCheckModel.fromJson(jsonDecode(response.body[0]));
        Fluttertoast.showToast(msg: forgotPasswordModel!.msg.toString());
      } else {
        Fluttertoast.showToast(msg: "Something went wrong");
        throw Exception("Something Went Wrong");
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
