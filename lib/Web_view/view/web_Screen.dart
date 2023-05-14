import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/web_provider.dart';

class Inappweb extends StatefulWidget {
  const Inappweb({Key? key}) : super(key: key);

  @override
  State<Inappweb> createState() => _InappwebState();
}

class _InappwebState extends State<Inappweb> {
  TextEditingController searchtext = TextEditingController();
  InAppWebViewController? inAppWebViewController;
  PullToRefreshController? pullToRefreshController;
  Web_Provider? pT;
  Web_Provider? pF;

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        inAppWebViewController!.reload();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    pF = Provider.of<Web_Provider>(context, listen: false);
    pT = Provider.of<Web_Provider>(context);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black26,
          body: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        inAppWebViewController!.goBack();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.blue,
                      )),
                  IconButton(
                      onPressed: () {
                        inAppWebViewController!.goForward();
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                      )),
                  IconButton(
                      onPressed: () {
                        inAppWebViewController!.reload();
                      },
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.blue,
                      )),
                ],
              ),
              Container(
                height: 6.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                      cursorColor: Colors.blue,
                      style: TextStyle(color: Colors.white),
                      controller: searchtext,
                      decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              var search = searchtext.text;
                              inAppWebViewController!.loadUrl(
                                  urlRequest: URLRequest(
                                      url: Uri.parse(
                                          "https://www.google.com/search?q=$search")));
                            },
                          ))),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              LinearProgressIndicator(value: pT!.progress, minHeight: 1,color: Colors.blue.shade500,backgroundColor: Colors.grey,),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest:
                  URLRequest(url: Uri.parse("https://www.google.com/")),
                  onLoadError: (controller, url, code, message) {
                    inAppWebViewController = controller;
                    pullToRefreshController!.endRefreshing();
                  },
                  onLoadStart: (controller, url) {
                    inAppWebViewController = controller;
                  },
                  onLoadStop: (controller, url) {
                    inAppWebViewController = controller;
                    pullToRefreshController!.endRefreshing();
                  },
                  onProgressChanged: (controller, progress) {
                    inAppWebViewController = controller;
                    if (progress==100) {
                      pullToRefreshController!.endRefreshing();
                    }
                    pT!.ChangeProgress((progress/100).toDouble());
                  },
                  pullToRefreshController: pullToRefreshController,
                ),
              ),
            ],
          ),
        ));
  }
}

