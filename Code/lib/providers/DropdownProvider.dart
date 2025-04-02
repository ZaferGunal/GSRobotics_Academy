
import 'package:flutter/material.dart';

class DropdownProvider extends ChangeNotifier{
  int? selected_value = null;

  int? get getSelectedValue => selected_value;

  void updateValue(int? newValue){
    selected_value = newValue;
    notifyListeners();
  }

}