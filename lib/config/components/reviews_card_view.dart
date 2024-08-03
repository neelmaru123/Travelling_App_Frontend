import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelling_app/config/colors/colors.dart';
import 'package:travelling_app/config/components/reviews_photos_scroller.dart';

Widget ReviewsCardView({required List PlaceList}) {
  return Column(
    children: [
      Container(
        height: 500,
        child: ListView.builder(
          itemCount: PlaceList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.darkColor,
                border: Border(
                  top: BorderSide(
                    color: AppColors.darkGreenColor,
                    width: 2,
                  ),
                ),
              ),
              child: Padding(
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
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                PlaceList[index]['rating']?.toString() ??
                                    'No rating',
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      PlaceList[index]['heading'] ?? 'No heading',
                      style: GoogleFonts.rubik(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Text(
                      PlaceList[index]['date'] ?? 'No date',
                      style:
                          TextStyle(fontSize: 18, color: AppColors.whiteColor),
                    ),
                    ReviewText(
                      review: PlaceList[index]['review'] ?? 'No review',
                    ),
                    PlaceList[index]['photos'].length > 0
                        ? ReviewsPhotosScroller(PlaceList[index]['photos'])
                        : Container(),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      )
    ],
  );
}

class ReviewText extends StatefulWidget {
  final String review;

  ReviewText({required this.review});

  @override
  _ReviewTextState createState() => _ReviewTextState();
}

class _ReviewTextState extends State<ReviewText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final review = widget.review;
    final isLongReview = review.length > 200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded || !isLongReview ? review : '${review.substring(0, 200)}...',
          style: GoogleFonts.rubik(
            fontSize: 15,
            color: AppColors.whiteColor,
          ),
        ),
        if (isLongReview)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? 'Read less' : 'Read more',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.greyColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
