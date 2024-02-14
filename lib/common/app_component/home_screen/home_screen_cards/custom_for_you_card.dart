import 'package:flutter/material.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';
import 'dart:math';

import 'package:voice_verse/movie_model.dart';


class CustomForYouCard extends StatefulWidget {
  final List<MovieModel> movieList;
  final Function(int) onItemClicked;

  CustomForYouCard({
    required this.movieList,
    required this.onItemClicked
  });

  @override
  _CustomForYouCardState createState() => _CustomForYouCardState();
}

class _CustomForYouCardState extends State<CustomForYouCard> {
  PageController pageController = PageController(initialPage: 0, viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: PageView.builder(
            controller: pageController,
            itemCount: widget.movieList.length,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  widget.onItemClicked(index);
                },
                child: AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    double value = 0.0;
                    if (pageController.position.haveDimensions) {
                      value = index.toDouble() - (pageController.page ?? 0);
                      value = value * 0.03.clamp(-1, 1);
                    }
                    return Transform.rotate(
                      angle: pi * value,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: buttonColor.withOpacity(1),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(widget.movieList[index].imageAssets!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 30),
                      ),
                    );
                  },
                ),
              );
            },
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: buildPageIndicatorWidget(widget.movieList, _currentPage),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buildPageIndicatorWidget(movieList,currentPage) {
    List<Widget> list = [];
    for (int i = 0; i < movieList.length; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white24,
          borderRadius: BorderRadius.circular(25)),
    );
  }


}

