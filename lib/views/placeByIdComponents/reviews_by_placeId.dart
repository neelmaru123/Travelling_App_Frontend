
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/config/components/reviews_card_view.dart';

import '../../config/API/Reviews/review_api.dart';

class ReviewsByPlaceId extends StatelessWidget {
  final String placeId;
  const ReviewsByPlaceId({super.key, required this.placeId});

  Future<List<dynamic>> fetchPlace() async {
    final res = await Review().getReviewsByPlaceId(placeId);
    return res['data'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchPlace(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return ReviewsCardView(PlaceList: snapshot.data!);
        }
      },
    );
  }
}
