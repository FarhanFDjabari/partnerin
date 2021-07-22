import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DummyCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          initialPage: 0,
          enableInfiniteScroll: false,
          viewportFraction: 1.5,
          scrollDirection: Axis.horizontal,
          height: 160,
          onPageChanged: (index, _) {}),
      items: [
        InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Constants.PARTNERIN_BLACK.withOpacity(0.1),
                BlendMode.screen,
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
