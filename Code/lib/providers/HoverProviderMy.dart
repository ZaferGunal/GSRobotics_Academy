import 'package:flutter/material.dart';

import '../MyColors.dart';

class HoverProviderMy extends ChangeNotifier{

  bool isHovered = false;

  bool get _isHovered => isHovered;

  void setHovered(bool value){
    isHovered = value;
    notifyListeners();
  }

  Color color = MyColors.transparent;


  Color get getColor => color;

  void updateIsCorrect(Color color_){
    color = color_;
    print("type shit");
    notifyListeners();
  }




}