import 'package:flutter/material.dart';

class MovieNameAndRating extends StatelessWidget {
  final String movieName;
  final String year;
  final String movieRating;

  const MovieNameAndRating({
    required this.movieName,
    required this.year,
    required this.movieRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                year,
                style: const TextStyle(
                  color: Colors.white38,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                movieRating,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5,),
              const Icon(Icons.star, color: Colors.amber,)
            ],
          )
        ],
      ),
    );
  }
}
