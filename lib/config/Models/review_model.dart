
class Review {
  double rating;
  String typeOfVisit;
  DateTime visitDate;
  String heading;
  String review;
  String userName;
  String userId;
  String placeId;
  DateTime date;

  Review({
    required this.rating,
    required this.typeOfVisit,
    required this.visitDate,
    required this.heading,
    required this.review,
    required this.userName,
    required this.userId,
    required this.placeId,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'typeOfVisit': typeOfVisit,
      'visitDate': visitDate,
      'heading': heading,
      'review': review,
      'userName': userName,
      'userId': userId,
      'placeId': placeId,
      'date': date,
    };
  }
}