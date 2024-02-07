import 'package:disaster_app/AlertDialogShow.dart';
import 'package:disaster_app/firstpage.dart';
import 'package:disaster_app/forgetpasswordpage.dart';
import 'package:disaster_app/loginApi.dart';
import 'package:disaster_app/signuppage.dart';
import 'package:disaster_app/user.dart';
import 'package:flutter/material.dart';

import 'inputTextForm.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  User? user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Form(
            key: loginFormkey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.10,
                ),
                Image.asset('assets/images/certsurveyor_logo_tight763.jpg'),
                // Row(
                //   children: [
                //     Text('USERNAME', style: TextStyle(fontSize: 20)),
                //   ],
                // ),
                SizedBox(
                  height: size.height * 0.10,
                ),
                InputTextForm(
                  controller: username,
                  hintext: 'USERNAME',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                // Row(
                //   children: [
                //     Text(
                //       'PASSWORD',
                //       style: TextStyle(fontSize: 20),
                //     ),
                //   ],
                // ),
                InputTextForm(
                  controller: password,
                  hintext: 'PASSWORD',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.10,
                ),
                GestureDetector(
                  onTap: () async {
                    if (loginFormkey.currentState!.validate()) {
                      print(username.text);
                      print(password.text);

                      final user2 = await LoginApi.login(
                          username: username.text, password: password.text);
                      setState(() {
                        user = user2;
                      });
                      print(user?.status);
                      print(user?.message);

                      if (user!.status) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FirstPage();
                        }));
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AlertDalogShow(
                                  description: '',
                                  title: 'Incorrect username/password',
                                  textButton: 'Close',
                                  press: () {
                                    Navigator.pop(context);
                                  },
                                ));
                      }
                    }
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text('Login'),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
                GestureDetector(
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgetPasswordPage();
                      }));
                    },
                    child: Text("FORGOT PASSWORD?")),
                SizedBox(
                  height: size.height * 0.0125,
                ),
                GestureDetector(
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignupPage();
                      }));
                    },
                    child: Text("SIGN UP")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
