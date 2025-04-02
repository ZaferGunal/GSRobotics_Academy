import 'package:flutter/material.dart';
import 'package:untitled7/Scaffolds/Dialogs/programingDialog.dart';


class LabelProvider extends ChangeNotifier{

  void showProgramingDialog(BuildContext context){
    showDialog(context: context, builder: (BuildContext context ){
      return ProgramingDialog();
    });
  }
}