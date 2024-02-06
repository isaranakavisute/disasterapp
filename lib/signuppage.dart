import 'package:disaster_app/inputTextForm.dart';
import 'package:disaster_app/login.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar:
            AppBar(backgroundColor: Colors.green, title: Text("Signup Page")),
        body: Center(
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
                controller: firstname,
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
                controller: firstname,
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
                height: size.height * 0.05,
              ),
              Text("Enter a Team Code (Optional):"),
              Text("(Alphanumneric only)"),
              SizedBox(
                height: size.height * 0.10,
              ),
              Text("By clicking Sign Up, you agree to the"),
              Text("Terms and Conditions"),
              SizedBox(
                height: size.height * 0.10,
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
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
            ],
          ),
        ));
  }
}
