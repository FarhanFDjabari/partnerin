import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partnerin/constants.dart';
import 'package:partnerin/cubit/home/article/article_cubit.dart';
import 'package:partnerin/cubit/home/business/business_cubit.dart';
import 'package:partnerin/model/home/category_model.dart';
import 'package:partnerin/widgets/business_tile.dart';
import 'package:partnerin/widgets/dummy_carousel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  bool _isVerified = false;
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ArticleCubit()..getAllArticles(GetStorage().read('token')),
        ),
        BlocProvider(
          create: (context) =>
              BusinessCubit()..getAllBusiness(GetStorage().read('token')),
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed('/usaha'),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Constants.PARTNERIN_TEAL,
                          border: Border.all(color: Colors.white, width: 0.5),
                        ),
                        child: Center(
                          child: Text(
                            'Usahamu',
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed('/pengajuan'),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Constants.PARTNERIN_TEAL,
                          border: Border.all(color: Colors.white, width: 0.5),
                        ),
                        child: Center(
                          child: Text(
                            'Pengajuanmu',
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 55,
                      child: TextField(
                        controller: _searchController,
                        autofocus: false,
                        style: TextStyle(
                          height: 1,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          prefixIcon: Icon(Icons.search_outlined),
                          hintStyle: Theme.of(context).textTheme.headline1,
                          hintText: 'Kamu mau usaha apa?',
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () => Get.toNamed('/profile'),
                      borderRadius: BorderRadius.circular(25),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Constants.PARTNERIN_TEAL,
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.user,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                if (!_isVerified)
                  InkWell(
                    onTap: () => Get.toNamed('/profile'),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      color: Constants.PARTNERIN_TEAL,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 2,
                      ),
                      child: Text.rich(
                        TextSpan(
                          text: 'Lengkapi ',
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            TextSpan(
                              text: 'profil',
                              style: GoogleFonts.poppins(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' mu sekarang juga untuk dapat bertransaksi!!',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Container(
                  height: 550,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          height: 186,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Image.asset('assets/images/home-bg.png'),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 30, top: 8),
                                    child: Text(
                                      'Pilih jenis usaha',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 160,
                                    child: GridView.builder(
                                      itemCount: categoryList.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: const EdgeInsets.only(
                                        left: 40,
                                        right: 40,
                                        top: 5,
                                      ),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 1.4,
                                        crossAxisSpacing: 0,
                                        mainAxisSpacing: 2,
                                      ),
                                      itemBuilder: (context, index) => InkWell(
                                        onTap: () => Get.toNamed(
                                          '/category',
                                          parameters: {
                                            'category':
                                                categoryList[index].category
                                          },
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Constants.PARTNERIN_TEAL,
                                              ),
                                              child: Image.asset(
                                                categoryList[index].imageUrl,
                                              ),
                                            ),
                                            Text(
                                              categoryList[index].category,
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        BlocConsumer<ArticleCubit, ArticleState>(
                          listener: (context, state) {
                            if (state is ArticleLoadError) {
                              Get.showSnackbar(
                                GetBar(
                                  message: state.errorMessage,
                                  duration: Duration(seconds: 4),
                                  isDismissible: true,
                                  margin: EdgeInsets.all(8.0),
                                  borderRadius: 10,
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return Stack(
                              children: [
                                state is ArticleLoadSuccess
                                    ? CarouselSlider(
                                        options: CarouselOptions(
                                            initialPage: 0,
                                            enableInfiniteScroll: false,
                                            viewportFraction: 1.5,
                                            scrollDirection: Axis.horizontal,
                                            height: 160,
                                            onPageChanged: (index, _) =>
                                                setState(
                                                  () => _currentSlide = index,
                                                )),
                                        items: state.articleResult.data!
                                            .map((article) => InkWell(
                                                  onTap: () => Get.toNamed(
                                                    '/article',
                                                    parameters: {
                                                      'url': article.url!,
                                                      'title': article.title!,
                                                    },
                                                  ),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                      ),
                                                    ),
                                                    child: ColorFiltered(
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Constants
                                                            .PARTNERIN_BLACK
                                                            .withOpacity(0.1),
                                                        BlendMode.screen,
                                                      ),
                                                      child: Image.network(
                                                        'https://partnerin.piuw.my.id/storage/${article.thumbnail!}',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                      )
                                    : DummyCarousel(),
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
                                      Container(
                                        width: 10.0,
                                        height: 10.0,
                                        margin: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: 2.0,
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _currentSlide == 3
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
                                          color: _currentSlide == 4
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
                                          color: _currentSlide == 5
                                              ? Theme.of(context).primaryColor
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Container(
                          width: double.infinity,
                          height: 54,
                          color: Constants.PARTNERIN_TEAL.withOpacity(0.1),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Text(
                            'Rekomendasi untuk kamu!',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        BlocConsumer<BusinessCubit, BusinessState>(
                          listener: (context, state) {
                            if (state is BusinessLoadError) {
                              Get.showSnackbar(GetBar(
                                message: state.errorMessage,
                                duration: Duration(seconds: 4),
                                isDismissible: true,
                                margin: EdgeInsets.all(8.0),
                                borderRadius: 10,
                              ));
                            }
                          },
                          builder: (context, state) {
                            if (state is BusinessLoadSuccess)
                              return Container(
                                height: 350,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: ListView.builder(
                                  itemCount: 5,
                                  itemBuilder: (context, index) => BusinessTile(
                                    id: state.businessData[index].id.toString(),
                                    thumbnail: state.businessData[index]
                                        .thumbnail!.mediaUrl,
                                    title: state.businessData[index].title,
                                    type: state.businessData[index].type,
                                  ),
                                ),
                              );
                            else
                              return Center(
                                child: Container(
                                  child: Text('No business'),
                                ),
                              );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
