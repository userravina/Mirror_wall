
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Education_app extends ChangeNotifier
{
  List image = [
    "assets/images/e1.png",
    "assets/images/e2.png",
    "assets/images/e3.png",
    "assets/images/e4.png",
    "assets/images/e5.png",
    "assets/images/e6.png",
  ];

  List name = [
    "Category","Classes","Free Course","BoolStore","Live Course","LeaderBoard"
  ];

  List image2 = [
    "assets/images/e11.png",
    "assets/images/e22.jpeg",
    "assets/images/e33.png",
    "assets/images/e44.png",
    "assets/images/e55.png",
    "assets/images/e66.jpeg",
    "assets/images/e77.png",
    "assets/images/e88.jpeg",
    "assets/images/e99.jpeg",
    "assets/images/e100.png",
    "assets/images/e101.png",
  ];

  List name2 = [
    "Wikipedia",
    "W3schools",
    "Javapoint",
    "Tutorialspoint",
    "byju's",
    "Vedantu",
    "Brainly",
    "colorlib",
    "blackboard",
    "duolingo",
    "Study"
  ];

  List url = [
    "https://en.wikipedia.org",
    "https://www.w3schools.com",
    "https://www.javatpoint.com",
    "https://www.tutorialspoint.com",
    "https://byjus.com",
    "https://www.vedantu.com",
    "https://brainly.in",
    "https://colorlib.com/wp/cat/education/",
    "https://www.similarweb.com/website/blackboard.com/#overview",
    "https://www.similarweb.com/website/duolingo.com/#overview",
    "https://www.similarweb.com/website/study.com/#overview",
  ];

  WebViewController? webViewController;

  void loadWebsite(int index)
  {
    webViewController = WebViewController();
    webViewController!.loadRequest(Uri.parse("${url[index]}"));
  }
}