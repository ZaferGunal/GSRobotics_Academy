import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:untitled7/Scaffolds/HomePage.dart';
import 'package:untitled7/providers/HoverProviderHome.dart';
import 'package:provider/provider.dart';

class DrawerProvider extends ChangeNotifier{
  late final BuildContext context;
  Widget currentPage = HomePage();

  Widget getPage(){
    return currentPage;

  }


  void updatePage(Widget newPage){
    currentPage = newPage;

    notifyListeners();
  }

  void not(){
    notifyListeners();
  }


}



