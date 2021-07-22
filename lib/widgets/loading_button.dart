import 'package:flutter/material.dart';

import '../constants.dart';

class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: Constants.PARTNERIN_TEAL_DARKER,
      ),
      onPressed: () {},
      child: Container(
        width: 288,
        height: 42,
        child: Center(
          child: Container(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
