import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Ott_Provider extends ChangeNotifier{
  List image = [
    "assets/image/o1.png",
    "assets/image/o2.png",
    "assets/image/o3.png",
    "assets/image/o4.jpeg",
    "assets/image/o5.jpeg",
    "assets/image/06.jpeg",
    "assets/image/o7.png"
  ];

  List name = [
    "Netflix","Amazon Prime","Disney+","OLX","Sony LIV","Flipcart","Meesho"
  ];

  List url = [
    "https://www.netflix.com",
    "https://www.primevideo.com",
    "https://www.hotstar.com",
    "https://www.olx.in",
    "https://www.sonyliv.com",
    "https://www.flipkart.com",
    "https://www.meesho.com"
  ];

  WebViewController? webViewController;

  void loadlink(int index)
  {
    webViewController = WebViewController();
    webViewController!.loadRequest(Uri.parse("${url[index]}"));
    notifyListeners();
  }
}