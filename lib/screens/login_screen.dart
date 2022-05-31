import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userIdController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final RxBool _isObscure = true.obs;
  static const _redColor = Color(0xffE21E23);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sign_in_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
                height: deviceSize.height * 0.18,
                width: deviceSize.height * 0.18,
                "assets/logo.png"),
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
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                    prefixIcon: Image.asset("assets/envelop.png"),
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
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                    prefixIcon: Image.asset("assets/password.png"),
                    suffixIcon: Obx(
                          () => _isObscure.value
                          ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _isObscure.value = !_isObscure.value;
                            });
                          },
                          child: Image.asset(
                            "assets/ic_action_passwordoff.png",
                            scale: 2.5,
                          ))
                          : GestureDetector(
                          onTap: () {
                            setState(() {
                              _isObscure.value = !_isObscure.value;
                            });
                          },
                          child: Image.asset(
                            "assets/ic_action_passwordon.png",
                            scale: 2.5,
                          )),
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
                  backgroundColor: MaterialStateProperty.all<Color>(_redColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text("Sign In"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 17),
              child: Text(
                "Forgot PassWord?",
                style: TextStyle(color: Colors.black54),
              ),
            )
          ]),
        ),
      ),
    );
  }
}