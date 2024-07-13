import 'package:flutter/material.dart';
import 'package:travelling_app/config/colors/colors.dart';

class FormLable extends StatelessWidget {
  final lable;
  const FormLable({super.key, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(lable,
          style: TextStyle(
            color: AppColors.darkColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
