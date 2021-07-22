import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class FormKemitraan extends StatefulWidget {
  FormKemitraan({Key? key}) : super(key: key);

  @override
  _FormKemitraanState createState() => _FormKemitraanState();
}

class _FormKemitraanState extends State<FormKemitraan> {
  final _luasLokasiController = TextEditingController();
  final _lokasiUsahaController = TextEditingController();
  final _npwpController = TextEditingController();
  final _fotoTempatUsahaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload dokumen persyaratan',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _luasLokasiController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintStyle: Theme.of(context).textTheme.headline1,
                hintText: 'syarat minimal 2 x 2',
                labelStyle: Theme.of(context).textTheme.headline1,
                labelText: 'Luas Lokasi',
              ),
              validator: (value) {},
            ),
            SizedBox(height: 9),
            Row(
              children: [
                Container(
                  width: 195,
                  child: TextFormField(
                    controller: _lokasiUsahaController,
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: Theme.of(context).textTheme.headline1,
                      hintText: 'Pilih file',
                      labelStyle: Theme.of(context).textTheme.headline1,
                      labelText: 'Lokasi Usaha',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value) {},
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Constants.PARTNERIN_TEAL,
                  ),
                  child: Container(
                    width: 90,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Unggah',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 9),
            Row(
              children: [
                Container(
                  width: 195,
                  child: TextFormField(
                    controller: _npwpController,
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: Theme.of(context).textTheme.headline1,
                      hintText: 'Pilih file',
                      labelStyle: Theme.of(context).textTheme.headline1,
                      labelText: 'NPWP',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value) {},
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Constants.PARTNERIN_TEAL,
                  ),
                  child: Container(
                    width: 90,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Unggah',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 9),
            Row(
              children: [
                Container(
                  width: 195,
                  child: TextFormField(
                    controller: _fotoTempatUsahaController,
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: Theme.of(context).textTheme.headline1,
                      hintText: 'Pilih file',
                      labelStyle: Theme.of(context).textTheme.headline1,
                      labelText: 'Foto Tempat Usaha',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value) {},
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Constants.PARTNERIN_TEAL,
                  ),
                  child: Container(
                    width: 90,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Unggah',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Constants.PARTNERIN_TEAL,
              ),
              onPressed: () => Get.toNamed('/verifikasi-pengajuan'),
              child: Container(
                width: double.infinity,
                height: 42,
                child: Center(
                  child: Text(
                    'Ajukan Kemitraan',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
