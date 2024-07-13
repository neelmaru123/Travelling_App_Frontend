import 'package:flutter/material.dart';
import 'package:travelling_app/config/API/User/user_api.dart';
import 'package:travelling_app/config/colors/colors.dart';
import 'package:travelling_app/config/components/form_lable.dart';
import 'package:travelling_app/config/components/form_textbox.dart';
import 'package:travelling_app/config/components/password_textbox.dart';
import 'package:travelling_app/config/routes/routes_name.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkColor,
        title: Text("Sign Up", style: TextStyle(color: AppColors.whiteColor),),
        foregroundColor: AppColors.whiteColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                FormLable(lable: "Username"),
                FormTextBox(
                  hintText: "Full Name",
                  controller: fullNameController,
                  Validate: (value) {
                    if (value.isEmpty) {
                      return "Please enter your full name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                FormLable(lable: "Email"),
                FormTextBox(
                  hintText: "Email",
                  controller: emailController,
                  Validate: (value) {
                    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z]+\.[a-zA-Z]+';
                    RegExp regex = new RegExp(pattern);
                    if (value.isEmpty) {
                      return "Please enter your email";
                    } else if (!regex.hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                FormLable(lable: "Password"),
                PasswordTextBox(
                  hintText: 'Enter Password',
                  controller: passwordController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                FormLable(lable: "Confirm Password"),
                FormTextBox(
                  hintText: "Confirm Password",
                  controller: confirmPasswordController,
                  Validate: (value) {
                    if (value.isEmpty) {
                      return "Please enter your password";
                    } else if (value != passwordController.text) {
                      return "Password does not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        var response = await User().register(
                          emailController.text,
                          passwordController.text,
                          fullNameController.text,
                        );
                        if (response['success'] == true) {
                          Navigator.pushNamed(context, RoutesName.loginScreen);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(response['message']),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.darkColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: AppColors.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.loginScreen);
                        },
                        child: Text(
                          " Login",
                          style: TextStyle(
                            color: AppColors.darkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Or Log in with",
                          style: TextStyle(
                            color: AppColors.darkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Image.network(
                            'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?fit=1000,1000&ssl=1',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class FormLabel extends StatelessWidget {
//   final String label;
//   const FormLabel({required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       label,
//       style: TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }
//
// class FormTextBox extends StatelessWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final String? Function(String?) validate;
//
//   const FormTextBox({
//     required this.hintText,
//     required this.controller,
//     required this.validate,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       validator: validate,
//       decoration: InputDecoration(
//         hintText: hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(color: AppColors.darkColor, width: 3.0),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.darkColor, width: 3.0),
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     );
//   }
// }
