import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/MyColors.dart';
import 'package:untitled7/Scaffolds/Dialogs/arduinoDialog.dart';
import 'package:untitled7/Scaffolds/Dialogs/chessDialog.dart';
import 'package:untitled7/Scaffolds/Dialogs/designDialog.dart';
import 'package:untitled7/Scaffolds/Dialogs/programingDialog.dart';

import '../providers/UserDataProvider.dart';
import '../providers/VideoHallProvider.dart';

class CourseLabel extends StatelessWidget {
  AssetImage image;

  String title;

  String subtitle;
  late String codeName;
  late String name;
  late String startedName;
  late String progressName_;
  late int numberOfVideos;


  CourseLabel(
      {required this.title, required this.subtitle, required this.image}) {
    switch (title) {
      case "Programlama":
        numberOfVideos = 11;
        progressName_ = "progressPrograming";
        startedName = "isStartedPrograming";
        name = "Programlama";
        codeName = "programing";
      case "Arduino ve Elektronik":
        numberOfVideos = 10;
        progressName_ = "progressArduino";
        startedName = "isStartedArduino";
        name = "Arduino ve Elektronik";
        codeName = "arduino";
      case "Satranç":
       numberOfVideos= 23;
        progressName_ = "progressChess";
        startedName = "isStartedChess";
        name = "Satranç Temelleri";
        codeName = "chess";
      case "Grafik Tasarım":
      numberOfVideos= 10;
        progressName_ = "progressDesign";
        startedName = "isStartedDesign";
        name = "Grafik Tasarım";
        codeName = "design";
    }
  }

  void onTapFunc(BuildContext context) {
    switch (title) {
      case "Programlama":
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return ProgramingDialog();
            });
        break;

      case "Arduino ve Elektronik":
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return ArduinoDialog();
            });
        break;
      case "Satranç":
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return ChessDialog();
            });
        break;
      case "Grafik Tasarım":
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return DesignDialog();
            });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
        height: 600,
        width: 430,
        child: Container(
            height: 400,
            width: 400,
            margin: EdgeInsets.all(60),
            child: Material(
                borderRadius: BorderRadius.circular(18),
                elevation: 6.0,
                child: Container(
                    width: 250,
                    height: 300,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(18)),
                    child: Stack(children: [
                      Align(
                          alignment: Alignment.center,
                          child: Column(children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9)),
                                clipBehavior: Clip.antiAlias,
                                width: 204,
                                height: 120,
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: image,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                                title),
                            SizedBox(height: 13),
                            Text(subtitle,
                                style: TextStyle(
                                    color: MyColors.tt,
                                    fontWeight: FontWeight.w500)),
                          ])),
                      Positioned(
                          bottom: 0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 10),
                                Container(
                                    width: 120,
                                    child: !Provider.of<UserDataProvider>(context,listen: true).userData?[whichCompleted(codeName)]
                                        ? LinearProgressIndicator(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            value: Provider.of<
                                                            UserDataProvider>(
                                                        context,
                                                        listen: true)
                                                    .userData?[progressName_] /
                                                numberOfVideos,
                                            color: MyColors.shadowColor)
                                        : Container(
                                            child: Row(children: [
                                            Text(
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: MyColors.green),
                                                "tamamlandı")
                                          ,SizedBox(width:4), Icon(Icons.check,color: MyColors.green,)]))),
                                SizedBox(width: 20),
                                ElevatedButton(
                                    child: Text(
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: MyColors.white),
                                        Provider.of<UserDataProvider>(context,
                                                    listen: true)
                                                .userData?[startedName]
                                            ? "devam et"
                                            : "kursa başla"),
                                    onPressed: () {
                                      switch (codeName) {
                                        case "programing":
                                          Provider.of<UserDataProvider>(context,
                                                  listen: false)
                                              .updateStartPrograming(
                                                  context, true);
                                          break;
                                        case "chess":
                                          Provider.of<UserDataProvider>(context,
                                                  listen: false)
                                              .updateStartChess(context, true);
                                          break;
                                        case "arduino":
                                          Provider.of<UserDataProvider>(context,
                                                  listen: false)
                                              .updateStartArduino(
                                                  context, true);
                                          break;
                                        case "design":
                                          Provider.of<UserDataProvider>(context,
                                                  listen: false)
                                              .updateStartDesign(context, true);
                                          break;
                                      }

                                      Provider.of<VideoHallProvider>(context,
                                              listen: false)
                                          .playListAt(
                                              codeName,
                                              Provider.of<UserDataProvider>(
                                                      context,
                                                      listen: false)
                                                  .userData?[codeName]);
                                      Provider.of<VideoHallProvider>(context,
                                              listen: false)
                                          .setAllCurrents(
                                              courseFullName: name,
                                              lastIndex:
                                                  Provider.of<UserDataProvider>(
                                                          context,
                                                          listen: false)
                                                      .userData?[codeName]);
                                      Navigator.pushNamed(
                                          context, "/videoHall");
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              MyColors.navy),
                                    )),
                                SizedBox(width: 0)
                              ]))
                    ])))));
  }

   whichCompleted(String codeName) {
    switch(codeName){
      case "arduino": return 'arduinoCompleted';
      case "chess": return 'chessCompleted';
      case "programing": return 'programingCompleted';
      case "design": return 'designCompleted';
    }
  }
}
