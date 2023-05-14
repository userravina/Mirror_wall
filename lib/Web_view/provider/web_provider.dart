import 'package:flutter/cupertino.dart';

class Web_Provider extends ChangeNotifier{

  double progress=0;

  void ChangeProgress(double ps)
  {
    progress = ps;
  }
}