
import 'package:flutter/material.dart';
import 'package:untitled7/Scaffolds/AllCourses.dart';
import 'package:untitled7/Scaffolds/HomePage.dart';
import 'package:untitled7/Scaffolds/MyCourses.dart';
import 'package:untitled7/providers/drawerProvider.dart';
import 'package:untitled7/sidebar/Sidebar.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled7/MyColors.dart';
import 'package:rxdart/rxdart.dart';

import '../providers/UserDataProvider.dart';
class SidebarLayout extends StatelessWidget{




  Widget _currentPage = HomePage();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  FutureBuilder(future: Provider.of<UserDataProvider>(context,listen:false).fetchUserData(),builder:(context,snapshot){

      if(snapshot.connectionState == ConnectionState.waiting){
        return Scaffold(backgroundColor: MyColors.white,body: Center(child: CircularProgressIndicator()));
      }
      else if(snapshot.hasError){
        return Scaffold(backgroundColor: MyColors.white,body: Center(child: Text("bir hata oluştu")));
      }
      else{

      return

      Scaffold(body:Stack(
      children:[

        Consumer<DrawerProvider>(
builder: (context,provider,child){
  return provider.currentPage;

},
        ),

        Sidebar(

        )

      ]
    ));} });
  }

}