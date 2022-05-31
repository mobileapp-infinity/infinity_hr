import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                  child: TextField(
                    cursorColor: Colors.red,
                    controller: _userIdController,
                    decoration: InputDecoration(
                      hintText: "User Name",
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

}
