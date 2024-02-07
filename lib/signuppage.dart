import 'package:disaster_app/AlertDialogShow.dart';
import 'package:disaster_app/firstpage.dart';
import 'package:disaster_app/inputTextForm.dart';
import 'package:disaster_app/login.dart';
import 'package:disaster_app/loginApi.dart';
import 'package:disaster_app/user.dart';
import 'package:flutter/material.dart';
import 'package:disaster_app/registerApi.dart';
//import package:flutter/src/material/scaffold.dart;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
        appBar:
            AppBar(backgroundColor: Colors.green, title: Text("Signup Page")),
        body: Center(
          child: Form(
            key: loginFormkey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.025,
                ),
                InputTextForm(
                  controller: firstname,
                  hintext: 'First Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter first name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                InputTextForm(
                  controller: lastname,
                  hintext: 'Last Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                InputTextForm(
                  controller: email,
                  hintext: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                InputTextForm(
                  controller: password,
                  hintext: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),
                Text("Enter a Team Code (Optional):"),
                SizedBox(
                  height: size.height * 0.010,
                ),
                InputTextForm(
                  controller: teamcode,
                  hintext: 'Team Code',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter team code';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),
                Text("(Alphanumneric only)"),
                SizedBox(
                  height: size.height * 0.010,
                ),
                Text("By clicking Sign Up, you agree to the"),
                Text("Terms and Conditions"),
                SizedBox(
                  height: size.height * 0.010,
                ),
                GestureDetector(
                  onTap: () async {
                    if (loginFormkey.currentState!.validate()) {
                      print(firstname.text);
                      print(lastname.text);
                      print(email.text);
                      print(password.text);
                      print(teamcode.text);

                      final user2 = await RegisterApi.register(
                          firstname: firstname.text,
                          lastname: lastname.text,
                          email: email.text,
                          password: password.text,
                          teamcode: teamcode.text);
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
                                      'Success: user added. Please close this window.',
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

                        /*
                        var snackBar =
                            SnackBar(content: Text('User registered'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                        */
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AlertDalogShow(
                                  description: '',
                                  title: 'ERROR: Cannot register user',
                                  textButton: 'Close',
                                  press: () {
                                    Navigator.pop(context);
                                  },
                                ));
                      }
                    }

                    /*
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
                    */
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[600],
                    ),
                    child: Center(
                      child: Text('SIGN UP'),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.010,
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
