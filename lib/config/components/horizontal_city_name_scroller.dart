import 'package:flutter/cupertino.dart';
import 'package:travelling_app/config/colors/colors.dart';

class HorizontalCityNameScroller extends StatefulWidget {
  const HorizontalCityNameScroller({super.key});

  @override
  State<HorizontalCityNameScroller> createState() => _HorizontalCityNameScrollerState();
}

class _HorizontalCityNameScrollerState extends State<HorizontalCityNameScroller> {

  var city = ["hotels in saputara", "natural placec", "statue of unity"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: city.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.softGreenColor, width: 3.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('${city[index]}', style: TextStyle(fontSize: 20, color: AppColors.darkColor),
              ),
            ),
          ));
        },
      ),
    );
  }
}
