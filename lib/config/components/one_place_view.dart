import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/config/colors/colors.dart';

class OnePlaceView extends StatelessWidget {
  const OnePlaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Stack(children: [
          Container(
            height: 230,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  7.0), // Adjust the value to your preference
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    "https://th.bing.com/th/id/OIP.YKj7OrGcqWLugJN6YtlGawHaEK?w=293&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 230,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  7.0), // Adjust the value to your preference
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Explore new \n place around you",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.yellowColor)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Text(
                        "Explore",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.darkGreenColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
