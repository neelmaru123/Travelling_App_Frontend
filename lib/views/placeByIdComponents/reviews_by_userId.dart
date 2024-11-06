import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelling_app/config/API/Reviews/review_api.dart';
import 'package:travelling_app/config/StateManagment/UserProvider.dart';
import 'package:travelling_app/config/components/reviews_card_view.dart';

class ReviewsByUserid extends StatelessWidget {
  const ReviewsByUserid({super.key});

  
  Future<List<dynamic>> fetchPlace(String userId) async {
    print(userId);
    final res = await Review().getReviewsByUserId(userId);
    return res['data'];
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return FutureBuilder<List<dynamic>>(
      future: fetchPlace(userProvider.userId),
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


