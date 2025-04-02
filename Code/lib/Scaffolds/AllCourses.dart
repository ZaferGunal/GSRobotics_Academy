import 'package:flutter/material.dart';
import 'package:untitled7/MyColors.dart';
import 'package:untitled7/OverallWidgets/courseLabel.dart';
import 'package:untitled7/OverallWidgets/progress_painter.dart';
import 'package:untitled7/Scaffolds/Dialogs/programingDialog.dart';


import 'package:untitled7/block_navigation_block/NavigationBlock.dart';

import 'package:provider/provider.dart';

class AllCourses extends StatelessWidget {
  List<CourseLabel> labelList = [
    CourseLabel(
        title: "Arduino ve Elektronik",
        subtitle:
        "Arduino setleri ile basit şemalar ve temel elektroniğe geçiş",
        image: AssetImage("assets/arduinogse.png")),
    CourseLabel(
        title: "Satranç",
        subtitle: "Temelden orta seviyeye satranç",
        image: AssetImage("assets/chessTwo.png")),
    CourseLabel(
        title: "Programlama",
        subtitle: "Scratch ile temel programlamaya geçiş ve basit oyun yapımı",
        image: AssetImage("assets/programing.png")),
    CourseLabel(
        title: "Grafik Tasarım",
        subtitle: "Canva programı temelleri  ve kullanımı",
        image: AssetImage("assets/design.png")),
  ];

  @override
  Widget build(BuildContext context) {
    void showProgramingDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ProgramingDialog();
          });
    }

    // TODO: implement build
    return Scaffold(
        backgroundColor: MyColors.lightGrey,
        body: Stack(children:[SingleChildScrollView(
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
                          Text("Tüm kurslar",
                              style: TextStyle(
                                color: MyColors.darkGrey,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ))
                        ]))
                  ])),
              SizedBox(height: 25),
              Container(
                  decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(9)),
                  height: 900,
                  margin:
                  EdgeInsets.only(top: 20, bottom: 20, left: 308, right: 308),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount_ = 2;

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount_,
                            childAspectRatio: 400 / 400,
                            crossAxisSpacing: 15.0,
                            mainAxisSpacing: 15.0),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                              child: GestureDetector(
                                  onTap: () {
                                    labelList[index].onTapFunc(context);
                                  },
                                  child: labelList[index]));
                        },
                      );
                    },
                  ))
            ])),Align(
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

