import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class RegisterOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/partnerin-register.png',
              ),
              SizedBox(height: 8.0),
              Text(
                'Daftar sebagai:',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Get.toNamed(
                      '/user-register',
                      parameters: {'type': 'user'},
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Constants.PARTNERIN_TEAL,
                    ),
                    child: Container(
                      width: 144,
                      height: 42,
                      child: Center(
                        child: Text(
                          'Pengusaha',
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(
                      '/owner-register',
                      parameters: {'type': 'mitra'},
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Constants.PARTNERIN_TEAL,
                    ),
                    child: Container(
                      width: 144,
                      height: 42,
                      child: Center(
                        child: Text(
                          'Mitra',
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
