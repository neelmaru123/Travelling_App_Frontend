import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/config/colors/colors.dart';

import '../config/routes/routes_name.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
              'https://cdn.shopify.com/s/files/1/1724/0065/products/lifestyle11500_33cc0044-62fc-43dd-b272-66afe2ed328e_800x.jpg?v=1670341749',
              fit: BoxFit.cover,
              height: MediaQuery.sizeOf(context).height),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Welcome!",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 20,
                    )),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Get ready \nfor the untouched \nplaces",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 50),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.signUpScreen);
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          color: AppColors.darkColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text("Explore",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: AppColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
