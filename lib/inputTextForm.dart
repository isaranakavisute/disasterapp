import 'package:flutter/material.dart';

class InputTextForm extends StatelessWidget {
  InputTextForm(
      {super.key,
      this.maxLines,
      this.controller,
      this.hintext,
      this.isPassword = false,
      this.keybordType,
      this.validator});

  final TextEditingController? controller;
  final TextInputType? keybordType;
  final String? hintext;
  final FormFieldValidator<String>? validator;
  final bool isPassword;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    late bool _show = true;
    return TextFormField(
      obscureText: isPassword ? _show : false,
      controller: controller,
      enabled: true,
      keyboardType: keybordType,
      maxLines: 1,
      style: TextStyle(fontSize: 16, color: Colors.black),
      decoration: InputDecoration(
          //constraints: BoxConstraints(maxHeight: 48, maxWidth: 100),
          hintText: hintext,
          contentPadding: EdgeInsets.all(10),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
      validator: validator,
    );
  }
}
