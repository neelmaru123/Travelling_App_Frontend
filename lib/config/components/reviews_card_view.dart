

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/config/colors/colors.dart';

Widget ReviewsCardView({required List PlaceList}){
  return Container(
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      border: Border(
        top: BorderSide(
          color: AppColors.darkGreenColor,
          width: 2,
        ),
      ),
    ),
    child: Column(
      children: [
        Container(
          height: 500,
          child: ListView.builder(
            itemCount: PlaceList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: NetworkImage(PlaceList[index]['Image'] ??
                                    "https://th.bing.com/th/id/OIP.YKj7OrGcqWLugJN6YtlGawHaEK?w=293&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                                fit: BoxFit.cover,
                                onError: (exception, stackTrace) {
                                  print('Image Error: $exception');
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  PlaceList[index]['userName'] ?? 'No name',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: AppColors.darkGreenColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  PlaceList[index]['rating']?.toString() ?? 'No rating',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        PlaceList[index]['heading'] ?? 'No heading',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        PlaceList[index]['date'] ?? 'No date',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black),
                      ),
                      Text(
                        PlaceList[index]['review'] ?? 'No review',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black),
                      ),

                  ],
                ),
              );
            },
          ),
        )
      ],
    ),
  );

}