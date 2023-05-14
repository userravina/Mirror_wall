import 'package:flutter/material.dart';
import 'package:mirror_wall/OTT_APP/provider/ott_provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web_Ott extends StatefulWidget {
  const Web_Ott({Key? key}) : super(key: key);

  @override
  State<Web_Ott> createState() => _Web_OttState();
}

class _Web_OttState extends State<Web_Ott> {
  Ott_Provider? ht,hf;
  @override
  Widget build(BuildContext context) {

    hf = Provider.of<Ott_Provider>(context,listen: false);
    ht = Provider.of<Ott_Provider>(context,listen: true);

    int i = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: ht!.webViewController!),
      ),
    );
  }
}