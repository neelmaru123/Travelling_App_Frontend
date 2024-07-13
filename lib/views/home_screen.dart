import 'dart:collection';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/config/colors/colors.dart';
import 'package:travelling_app/config/routes/routes_name.dart';
import 'package:travelling_app/views/Bottom_navigationBar_items/explore_screen.dart';
import 'package:travelling_app/views/Bottom_navigationBar_items/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> Screens = [
    ExploreScreen(),
    SearchScreen(),
    Center(
      child: Text("Review"),
    ),
    Center(
      child: Text("Profile"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        // appBar: AppBar(
        //   backgroundColor: AppColors.darkColor,
        //   foregroundColor: AppColors.whiteColor,
        // ),
        body: SafeArea(
          child: Screens[_currentIndex],
        ),
        bottomNavigationBar: Container(
          color: AppColors.mutedBlueColor,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedItemColor: AppColors.darkColor,
            unselectedItemColor: AppColors.mutedBlueColor,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.rate_review_outlined),
                label: 'Review',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Profile',
              ),
            ],
          ),
        ));
  }
}
