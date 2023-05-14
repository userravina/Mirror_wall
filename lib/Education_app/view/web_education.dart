import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirror_wall/Education_app/provider/education_provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web_Screen extends StatefulWidget {
  const Web_Screen({Key? key}) : super(key: key);

  @override
  State<Web_Screen> createState() => _Web_ScreenState();
}

class _Web_ScreenState extends State<Web_Screen> {
  Education_app? ht, hf;
  @override
  Widget build(BuildContext context) {

    ht = Provider.of<Education_app>(context, listen: true);
    hf = Provider.of<Education_app>(context, listen: false);

    int i = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: ht!.webViewController!),
      ),
    );
  }
}