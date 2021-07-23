import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class BusinessTile extends StatelessWidget {
  String? title, thumbnail, type, id;
  BusinessTile(
      {required this.title,
      required this.thumbnail,
      required this.type,
      required this.id});

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: 280,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Constants.PARTNERIN_TEAL,
      ),
      child: InkWell(
        onTap: () => Get.toNamed('/detail-bisnis',
            parameters: {'type': type!, 'id': id!}),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage(Constants.MEDIA_BASE_URL + thumbnail!),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: 8),
            Container(
              child: Text(
                title!,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
