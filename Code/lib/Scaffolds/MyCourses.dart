import 'package:flutter/material.dart';
import 'package:untitled7/MyColors.dart';
import 'package:untitled7/OverallWidgets/courseLabel.dart';
import 'package:untitled7/OverallWidgets/progress_painter.dart';
import 'package:untitled7/Scaffolds/Dialogs/programingDialog.dart';


import 'package:untitled7/block_navigation_block/NavigationBlock.dart';

import 'package:provider/provider.dart';

import '../providers/UserDataProvider.dart';

class MyCourses extends StatelessWidget {





  @override
  Widget build(BuildContext context) {


    void showProgramingDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ProgramingDialog();
          });
    }
    Provider.of<UserDataProvider>(context,listen: false).updateLabelList(context);


    // TODO: implement build
    return Scaffold(
        backgroundColor: MyColors.lightGrey,
        body: Stack(children: [SingleChildScrollView(
            child: Column(children: [
              Container(
                  decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(9)),
                  height: 60,
                  margin: EdgeInsets.only(left: 308, top: 30, right: 308),
                  child: Row(children: [
                    SizedBox(width: 25),
                    Center(
                        child: Column(children: [
                          SizedBox(height: 7),
                          Text("Kurslarım",
                              style: TextStyle(
                                color: MyColors.darkGrey,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ))
                        ]))
                  ])),
              SizedBox(height: 25),
              Consumer<UserDataProvider>(builder: (context,providerUser,child,){
                if(providerUser.tempList.length == 0)
                  return Container(margin:
                  EdgeInsets.only(top: 20, bottom: 20, left: 308, right: 308),decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(9)),height: 50,child: Center(child:Text("başladığınız bir kurs bulunamadı",style: TextStyle(fontWeight: FontWeight.w500,color: MyColors.titleGrey),)),);
                else
                  return Container(
                      decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(9)),
                      height: providerUser.tempList.length == 0 ? 50: providerUser.tempList.length <= 2? 450 :900 ,
                      margin:
                      EdgeInsets.only(top: 20, bottom: 20, left: 308, right: 308),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount_ = 2;

                          return

                            GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount_,
                                  childAspectRatio: 400 / 400,
                                  crossAxisSpacing: 15.0,
                                  mainAxisSpacing: 15.0),
                              itemCount:providerUser.tempList.length ,
                              itemBuilder: (BuildContext context, int index) {
                                return Center(
                                    child: GestureDetector(
                                        onTap: () {
                                          providerUser.tempList[index].onTapFunc(context);
                                        },
                                        child: providerUser.tempList[index]));
                              },
                            );
                        },
                      ));})
            ])),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(20),
              width:90,
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logoTransparent.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )]));
  }
}

