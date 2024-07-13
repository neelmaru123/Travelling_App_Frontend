import 'package:flutter/material.dart';
import 'package:travelling_app/config/colors/colors.dart';

class FormTextBox extends StatelessWidget {
  final hintText;
  final TextEditingController controller;
  final Function Validate;
  const FormTextBox(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.Validate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextFormField(
        controller: controller,
        validator: (value) => Validate(value),
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.darkColor, width: 3.0),
          ),
          hintText: hintText,
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
