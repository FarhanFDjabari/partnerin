import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MetodePembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 43,
              padding: const EdgeInsets.only(left: 15, top: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'No. Order: ADSI210421SERU',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Biaya',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    'Rp. 9.700.000',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 43,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 15, top: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Metode Pembayaran',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => ListTile(
                  leading: Image.asset('assets/images/partnerin-logo.png'),
                  title: Text(
                    'Mi-trans',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 43,
              padding: const EdgeInsets.only(left: 15, top: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Ajukan Modal',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
