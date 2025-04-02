import 'package:flutter/material.dart';

class HoverProviderAll extends ChangeNotifier{

  bool isHovered = false;

  bool get _isHovered => isHovered;

  void setHovered(bool value){
    isHovered = value;
    notifyListeners();
  }

}