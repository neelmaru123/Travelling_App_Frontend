import 'package:flutter/cupertino.dart';

Widget ReviewsPhotosScroller(Photolist) {
  return Container(
    height: 110,
    child: ListView.builder(
      itemCount: Photolist.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(Photolist[index]['Image'] ??
                    "https://th.bing.com/th/id/OIP.YKj7OrGcqWLugJN6YtlGawHaEK?w=293&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {
                  print('Image Error: $exception');
                },
              ),
            ),
          ),
        );
      },
    ),
  );
}
