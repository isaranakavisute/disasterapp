import 'package:disaster_app/AlertDialogShow.dart';
import 'package:disaster_app/firstpage.dart';
import 'package:disaster_app/inputTextForm.dart';
import 'package:disaster_app/login.dart';
import 'package:disaster_app/resetPasswordApi.dart';
import 'package:disaster_app/user.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController accountname = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController teamcode = TextEditingController();
  final GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();
  User? user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            backgroundColor: Colors.green, title: Text("Forget Password Page")),
        body: Center(
          child: Form(
            key: loginFormkey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Enter your account email and click"),
                Text("Send for a password reset link:"),
                SizedBox(
                  height: size.height * 0.10,
                ),
                InputTextForm(
                  controller: email,
                  hintext: 'Account Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Account Email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
                GestureDetector(
                  onTap: () async {
                    if (loginFormkey.currentState!.validate()) {
                      print(email.text);
                      final user2 =
                          await ResetPasswordApi.sendemail(email: email.text);
                      setState(() {
                        user = user2;
                      });
                      print(user?.status);
                      print(user?.message);

                      if (user!.status) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AlertDalogShow(
                                  description: '',
                                  title:
                                      'Success: email sent. Please close this window.',
                                  textButton: 'Close',
                                  press: () {
                                    /*
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Login();
                                    }));
                                    */
                                    Navigator.pop(context);
                                  },
                                ));
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AlertDalogShow(
                                  description: '',
                                  title: 'ERROR: Cannot reset password',
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
                      color: Colors.grey[600],
                    ),
                    child: Center(
                      child: Text('SEND'),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[600],
                    ),
                    child: Center(
                      child: Text('Return to Login Page'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
