import 'package:flutter/material.dart';
import 'package:untitled7/MyColors.dart';

class LoginCorrectProvider extends ChangeNotifier{

bool isTransparent = true;

  void updateIsCorrect(bool val){
    isTransparent = val;
    notifyListeners();
   }

}