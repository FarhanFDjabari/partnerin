import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partnerin/widgets/detail_usaha_item.dart';

import '../../constants.dart';

class DetailUsaha extends StatefulWidget {
  DetailUsaha({Key? key}) : super(key: key);

  @override
  _DetailUsahaState createState() => _DetailUsahaState();
}

class _DetailUsahaState extends State<DetailUsaha> {
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.PARTNERIN_TEAL.withOpacity(0.5),
        elevation: 0,
        title: Text(
          'Detail',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
          tooltip: 'Back',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 255,
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        viewportFraction: 1.5,
                        scrollDirection: Axis.horizontal,
                        height: 255,
                        onPageChanged: (index, _) {}),
                    items: [
                      Container(
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
                          child: Image.asset(
                            'assets/images/partnerin-logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/partnerin-logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 3,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 2.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentSlide == 0
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                          ),
                        ),
                        Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 2.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentSlide == 1
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                          ),
                        ),
                        Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 2.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentSlide == 2
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 153,
                      height: 27,
                      color: Colors.grey.withOpacity(0.5),
                      child: Center(
                        child: Text(
                          'Franchise',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) =>
                      DetailUsahaItem(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
