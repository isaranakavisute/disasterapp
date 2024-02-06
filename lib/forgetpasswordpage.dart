import 'package:disaster_app/firstpage.dart';
import 'package:disaster_app/inputTextForm.dart';
import 'package:disaster_app/login.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController accountname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            backgroundColor: Colors.green, title: Text("Forget Password Page")),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Enter your account email and click"),
              Text("Send for a password reset link:"),
              SizedBox(
                height: size.height * 0.10,
              ),
              InputTextForm(
                controller: accountname,
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
                    child: Text('SEND'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
