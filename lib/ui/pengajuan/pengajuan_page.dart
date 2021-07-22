import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class PengajuanPage extends StatefulWidget {
  PengajuanPage({Key? key}) : super(key: key);

  @override
  _PengajuanPageState createState() => _PengajuanPageState();
}

class _PengajuanPageState extends State<PengajuanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.PARTNERIN_TEAL.withOpacity(0.5),
        elevation: 0,
        title: Text(
          'Pengajuan',
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
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(top: 5),
            height: 160,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 125,
                  color: Colors.grey,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 160,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Monster Iceblend',
                              style: GoogleFonts.poppins(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'detail fraKamsia Boba Kamsia \n'
                              'Boba Indonesia - Kategori \n'
                              'Minuman Kontak	: Marketing',
                              maxLines: 10,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            primary: Theme.of(context).primaryColor,
                          ),
                          onPressed: () => Get.toNamed('/detail-pengajuan'),
                          child: Container(
                            width: 90,
                            height: 26,
                            child: Center(
                              child: Text(
                                'Detail',
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
