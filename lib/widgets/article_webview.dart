import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebview extends StatefulWidget {
  ArticleWebview({Key? key}) : super(key: key);

  @override
  _ArticleWebviewState createState() => _ArticleWebviewState();
}

class _ArticleWebviewState extends State<ArticleWebview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
        title: Text(
          Get.parameters['title'].toString(),
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
        child: WebView(
          initialUrl: Get.parameters['url'],
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
