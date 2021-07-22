import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';

class OwnerInfo extends StatefulWidget {
  OwnerInfo({Key? key}) : super(key: key);

  @override
  _OwnerInfoState createState() => _OwnerInfoState();
}

class _OwnerInfoState extends State<OwnerInfo> {
  final _formKey = GlobalKey<FormState>();
  final _fotoKtpController = TextEditingController();
  final _alamatController = TextEditingController();
  final _tglLahirController = TextEditingController();
  final _tempatLahirController = TextEditingController();
  final _namaUsahaController = TextEditingController();
  final _suratTandaPendaftaranController = TextEditingController();
  final _prospektusController = TextEditingController();
  String? _bentukKerjaSama, _jenisUsaha;
  final _picker = ImagePicker();
  late PickedFile? fotoKtp, prospektus, stpw;

  Future<void> getFotoKtp() async {
    fotoKtp = await _picker.getImage(source: ImageSource.camera);
  }

  Future<void> getProspektus() async {
    prospektus = await _picker.getImage(source: ImageSource.gallery);
  }

  Future<void> getStpw() async {
    stpw = await _picker.getImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  'Lengkapi Informasi',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Daftarkan merek usahamu untuk mendapatkan mitra baru',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 15.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 213,
                            child: TextFormField(
                              controller: _fotoKtpController,
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintStyle:
                                    Theme.of(context).textTheme.headline1,
                                hintText: 'Pilih file',
                                labelStyle:
                                    Theme.of(context).textTheme.headline1,
                                labelText: 'Foto KTP',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              validator: (value) {},
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => getFotoKtp(),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Constants.PARTNERIN_TEAL,
                            ),
                            child: Container(
                              width: 97,
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
                      TextFormField(
                        controller: _alamatController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelStyle: Theme.of(context).textTheme.headline1,
                          labelText: 'Alamat',
                        ),
                        validator: (value) {},
                      ),
                      SizedBox(height: 9),
                      TextFormField(
                        controller: _tglLahirController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelStyle: Theme.of(context).textTheme.headline1,
                          labelText: 'Tanggal lahir',
                          hintStyle: Theme.of(context).textTheme.headline1,
                          hintText: 'dd/MM/yyyy',
                        ),
                        validator: (value) {},
                      ),
                      SizedBox(height: 9),
                      TextFormField(
                        controller: _tempatLahirController,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelStyle: Theme.of(context).textTheme.headline1,
                          labelText: 'Tempat lahir',
                        ),
                        validator: (value) {},
                      ),
                      SizedBox(height: 9),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelStyle: Theme.of(context).textTheme.headline1,
                          labelText: 'Bentuk kerja sama',
                        ),
                        onChanged: (value) {
                          _bentukKerjaSama = value;
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text('Franchise'),
                            value: 'Franchise',
                          ),
                          DropdownMenuItem(
                            child: Text('Kemitraan'),
                            value: 'Kemitraan',
                          ),
                        ],
                      ),
                      SizedBox(height: 9),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelStyle: Theme.of(context).textTheme.headline1,
                          labelText: 'Jenis usaha',
                        ),
                        onChanged: (value) {
                          _jenisUsaha = value;
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text('F & B'),
                            value: 'F & B',
                          ),
                          DropdownMenuItem(
                            child: Text('Kosmetik'),
                            value: 'Kosmetik',
                          ),
                          DropdownMenuItem(
                            child: Text('Ekspedisi'),
                            value: 'Ekspedisi',
                          ),
                          DropdownMenuItem(
                            child: Text('Fashion'),
                            value: 'Fashion',
                          ),
                          DropdownMenuItem(
                            child: Text('Agrikultural'),
                            value: 'Agricultural',
                          ),
                          DropdownMenuItem(
                            child: Text('Lainnya'),
                            value: 'Lainnya',
                          ),
                        ],
                      ),
                      SizedBox(height: 9),
                      TextFormField(
                        controller: _namaUsahaController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelStyle: Theme.of(context).textTheme.headline1,
                          labelText: 'Nama usaha',
                        ),
                        validator: (value) {},
                      ),
                      SizedBox(height: 9),
                      Row(
                        children: [
                          Container(
                            width: 213,
                            child: TextFormField(
                              controller: _suratTandaPendaftaranController,
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintStyle:
                                    Theme.of(context).textTheme.headline1,
                                hintText: 'Pilih file',
                                labelStyle:
                                    Theme.of(context).textTheme.headline1,
                                labelText:
                                    'Surat Tanda Pendaftaran Waralaba (STPW)',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              validator: (value) {},
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => getStpw(),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Constants.PARTNERIN_TEAL,
                            ),
                            child: Container(
                              width: 97,
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
                            width: 213,
                            child: TextFormField(
                              controller: _prospektusController,
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintStyle:
                                    Theme.of(context).textTheme.headline1,
                                hintText: 'Pilih file',
                                labelStyle:
                                    Theme.of(context).textTheme.headline1,
                                labelText: 'Prospektus',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              validator: (value) {},
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => getProspektus(),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Constants.PARTNERIN_TEAL,
                            ),
                            child: Container(
                              width: 97,
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
                      SizedBox(height: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: Constants.PARTNERIN_TEAL,
                        ),
                        onPressed: () => Get.offNamed('/verification-process'),
                        child: Container(
                          width: double.infinity,
                          height: 42,
                          child: Center(
                            child: Text(
                              'Simpan',
                              style: Theme.of(context).textTheme.button,
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
