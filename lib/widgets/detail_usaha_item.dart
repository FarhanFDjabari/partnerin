import 'dart:math';

import 'package:flutter/material.dart';

class DetailUsahaItem extends StatefulWidget {
  DetailUsahaItem({Key? key}) : super(key: key);

  @override
  _DetailUsahaItemState createState() => _DetailUsahaItemState();
}

class _DetailUsahaItemState extends State<DetailUsahaItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              height: 32,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Produk Usaha',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Icon(
                      _isExpanded
                          ? Icons.arrow_drop_down_rounded
                          : Icons.arrow_right_rounded,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedContainer(
            height: _isExpanded ? min(2 * 20.0 + 110.0, 200) : 0,
            duration: Duration(milliseconds: 350),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
