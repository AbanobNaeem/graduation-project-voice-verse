import 'package:flutter/material.dart';

import 'package:voice_verse/movie_model.dart';

class CustomGenresCard extends StatelessWidget {
  final List<MovieModel> genresList;
  final Function(int) onItemClicked;

  CustomGenresCard({required this.genresList, required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
      height: MediaQuery.of(context).size.height * 0.22,
      child: ListView.builder(
        itemCount: genresList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onItemClicked(index);
            },
            child: Stack(
              children: [
                Container(
                  width: 260,
                  height: 145,
                  margin: const EdgeInsets.only(left: 5, right: 15, top: 5, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(
                        genresList[index].imageAssets!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Text(
                    genresList[index].movieName!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
