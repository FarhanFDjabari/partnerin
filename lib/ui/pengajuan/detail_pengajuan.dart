import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:partnerin/widgets/partnerin_timeline_tile.dart';

import '../../constants.dart';

class DetailPengajuan extends StatefulWidget {
  DetailPengajuan({Key? key}) : super(key: key);

  @override
  _DetailPengajuanState createState() => _DetailPengajuanState();
}

class _DetailPengajuanState extends State<DetailPengajuan> {
  int _currentSlide = 0;
  String orderNum = 'ADSI210421SERU';
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 3),
                width: double.infinity,
                height: 31,
                padding: const EdgeInsets.only(left: 35, top: 3),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Text(
                  'No. Order: $orderNum',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
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
              Container(
                height: 232,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          PartnerinTimelineTile(
                            isStart: true,
                            isCompleted: true,
                            title: 'Pengajuan',
                            date: '09 Juli 2021',
                            time: '10 : 00',
                          ),
                          PartnerinTimelineTile(
                            title: 'Pengajuan diterima',
                            date: '10 Juli 2021',
                            time: '12 : 32',
                          ),
                          PartnerinTimelineTile(
                            title: 'Pembayaran pembukaan mitra baru',
                            date: '12 Juli 2021',
                            time: '15 : 14',
                          ),
                          PartnerinTimelineTile(
                            title: 'Pembayaran selesai',
                            date: '12 Juli 2021',
                            time: '16 : 00',
                          ),
                          PartnerinTimelineTile(
                            isEnd: true,
                            title: 'Selesai',
                            date: '12 Juli 2021',
                            time: '17 : 00',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
