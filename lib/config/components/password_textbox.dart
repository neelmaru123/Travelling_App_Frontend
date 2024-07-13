import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/config/colors/colors.dart';

class PasswordTextBox extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validate;

  const PasswordTextBox({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validate,
  }) : super(key: key);

  @override
  _PasswordTextBoxState createState() => _PasswordTextBoxState();
}

class _PasswordTextBoxState extends State<PasswordTextBox> {
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        obscureText: !isPasswordVisible,
        validator: widget.validate,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.darkColor,
            ),
            onPressed: togglePasswordVisibility,
          ),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.darkColor, width: 3.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkColor, width: 3.0),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
