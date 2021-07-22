import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partnerin/cubit/home/business/business_cubit.dart';
import 'package:partnerin/widgets/form_kemitraan.dart';

import '../../constants.dart';

class DetailBisnis extends StatefulWidget {
  @override
  _DetailBisnisState createState() => _DetailBisnisState();
}

class _DetailBisnisState extends State<DetailBisnis> {
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessCubit()
        ..getBusinessById(GetStorage().read("token"), Get.parameters['id']!),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocConsumer<BusinessCubit, BusinessState>(
              listener: (context, state) {
                if (state is DetailBusinessLoadError) {
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
                if (state is DetailBusinessLoadSuccess)
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                      Constants.PARTNERIN_BLACK
                                          .withOpacity(0.1),
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
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, left: 25),
                        child: Text(
                          state.businessResult.title!,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 21,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 3),
                        width: double.infinity,
                        height: 31,
                        padding: const EdgeInsets.only(left: 35, top: 3),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Row(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Detail',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Kamsia Boba Indonesia - Kategori Minuman',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(
                                'Kontak: Marketing',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(
                                'Telepon: 0852 - 2768 - 8290',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(
                                'E-mail: kamsiaindonesia@gmail.com',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(
                                'Investasi	: Rp 9.700.000,00',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(
                                'Kami bukan franchise, kami adalah mitra bisnis '
                                'yang telah mendedikasikan usaha dan pikiran untuk '
                                'mensukseskan banyak mitra di seluruh Indonesia.franchise '
                                'dan kemitraan',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (Get.parameters['type'] == 'Franchise')
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 3),
                              width: double.infinity,
                              height: 65,
                              padding: const EdgeInsets.only(left: 35, top: 3),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Biaya',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Text(
                                    'Rp. ${state.businessResult.price}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  primary: Constants.PARTNERIN_TEAL,
                                ),
                                onPressed: () =>
                                    Get.toNamed('/metode-pembayaran'),
                                child: Container(
                                  width: double.infinity,
                                  height: 42,
                                  child: Center(
                                    child: Text(
                                      'Bayar sekarang',
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (Get.parameters['type'] == 'Kemitraan')
                        Divider(
                          color: Theme.of(context).primaryColor,
                          height: 10,
                          thickness: 1,
                        ),
                      if (Get.parameters['type'] == 'Kemitraan')
                        FormKemitraan(),
                    ],
                  );
                else if (state is BusinessLoading)
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                else
                  return Center(
                    child: Text(
                      'Detail Business Not Found',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  );
              },
            ),
          ),
        ),
      ),
    );
  }
}
