import 'package:flutter/material.dart';

class HoverProviderHome extends ChangeNotifier{

  bool isHovered = false;

  bool get _isHovered => isHovered;

  void setHovered(bool value){
    isHovered = value;
    notifyListeners();
  }

  void noty(){

    notifyListeners();
  }

}