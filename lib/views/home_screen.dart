
import 'package:flutter/material.dart';
import 'package:travelling_app/config/colors/colors.dart';
import 'package:travelling_app/views/Bottom_navigationBar_items/explore_screen.dart';
import 'package:travelling_app/views/Bottom_navigationBar_items/profile_screen.dart';
import 'package:travelling_app/views/Bottom_navigationBar_items/review_screen.dart';
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
    ReviewScreen(),
    ProfileScreen()
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: AppColors.darkColor,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.greyColor,
          type: BottomNavigationBarType.fixed, // Set the type to fixed
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: _currentIndex == 0 ? 35 : 25),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded, size: _currentIndex == 1 ? 35 : 25),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rate_review_outlined, size: _currentIndex == 2 ? 35 : 25),
              label: 'Review',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, size: _currentIndex == 3 ? 35 : 25),
              label: 'Profile',
            ),
          ],
        )
    );
  }
}
