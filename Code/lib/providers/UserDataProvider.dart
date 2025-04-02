import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../OverallWidgets/courseLabel.dart';

class UserDataProvider with ChangeNotifier {
  Map<String, dynamic>? _userData;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoadingLogin = false;
  bool isLoadingAuth = false;
  String errorMessage = '';
  bool isCanceledSignUp = false;



 late int programingProgress ;
 late int designProgress;
 late int arduinoProgress;
 late int chessProgress ;
 int numberOfPrograming_Video = 11;
  int numberOfChess_Video = 23;
  int numberOfDesign_Video = 10;
  int numberOfArduino_Video = 10;

  Map<String, dynamic>? get userData => _userData;

  Future<void> fetchUserData() async {
    User? user = _auth.currentUser;

    if (user != null) {
      DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        _userData = userDoc.data() as Map<String, dynamic>;
      }
    }
    notifyListeners();
  }

  Future<void> updateStartPrograming(BuildContext context, bool val) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .update({'isStartedPrograming': val});

      await fetchUserData(); // Verileri tekrar çek
      updateLabelList(context);
      notifyListeners();
    }
  }

  Future<void> updateStartArduino(BuildContext context, bool val) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .update({'isStartedArduino': val});

      await fetchUserData(); // Verileri tekrar çek
      updateLabelList(context);
      notifyListeners();
    }
  }

  Future<void> updateStartChess(BuildContext context, bool val) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .update({'isStartedChess': val});

      await fetchUserData(); // Verileri tekrar çek
      updateLabelList(context);
      notifyListeners();
    }
  }

  Future<void> updateStartDesign(BuildContext context, bool val) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .update({'isStartedDesign': val});

      await fetchUserData(); // Verileri tekrar çek
      updateLabelList(context);
      notifyListeners();
    }
  }

  final List<CourseLabel> labelList = [
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

  List<CourseLabel> tempList = [];

  void updateLabelList(BuildContext context) {
    tempList.clear();
    if (Provider
        .of<UserDataProvider>(context, listen: false)
        .userData?['isStartedArduino']) tempList.add(labelList[0]);
    if (Provider
        .of<UserDataProvider>(context, listen: false)
        .userData?['isStartedChess']) tempList.add(labelList[1]);
    if (Provider
        .of<UserDataProvider>(context, listen: false)
        .userData?['isStartedPrograming']) tempList.add(labelList[2]);
    if (Provider
        .of<UserDataProvider>(context, listen: false)
        .userData?['isStartedDesign']) tempList.add(labelList[3]);

    notifyListeners();
  }

  Future<void> updateLastIndexOf(String dbDataName, int index) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .update({dbDataName: index});

      await fetchUserData(); // Verileri tekrar çek

      notifyListeners();
    }
  }

  Future<void> updateChecked(String dbDataName, int index, bool boolVal) async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot ds =
      await _firestore.collection('users').doc(user.uid).get();
      if (ds.exists) {
        List tList = ds.get(dbDataName);
        tList[index] = boolVal;
        await _firestore
            .collection('users')
            .doc(user.uid)
            .update({dbDataName: tList});

        switch(dbDataName){
          case 'checkPrograming':
            programingProgress =ds.get('progressPrograming');
            programingProgress += 1;
            await _firestore
                .collection('users')
                .doc(user.uid)
                .update({'progressPrograming': programingProgress});
            if(programingProgress >= numberOfPrograming_Video){
              await _firestore
                  .collection('users')
                  .doc(user.uid)
                  .update({'programingCompleted': true});
            }
            notifyListeners();

            break;
          case 'checkChess':
         chessProgress=   ds.get('progressChess');
            chessProgress += 1;
         await _firestore
             .collection('users')
             .doc(user.uid)
             .update({'progressChess': chessProgress});
            if(chessProgress >= numberOfChess_Video){

              await _firestore
                  .collection('users')
                  .doc(user.uid)
                  .update({'chessCompleted': true});

            }
            notifyListeners();
            break;
          case 'checkArduino':
            arduinoProgress = ds.get('progressArduino');
            arduinoProgress+=1;
            await _firestore
                .collection('users')
                .doc(user.uid)
                .update({'progressArduino': arduinoProgress});
            if(arduinoProgress >= numberOfArduino_Video){

              await _firestore
                  .collection('users')
                  .doc(user.uid)
                  .update({'arduinoCompleted': true});
            }
            notifyListeners()
            ;
            break;
          case 'checkDesign':
            designProgress = ds.get('progressDesign');
            designProgress +=1;
            await _firestore
                .collection('users')
                .doc(user.uid)
                .update({'progressDesign': designProgress});

            if(designProgress >= numberOfDesign_Video){

              await _firestore
                  .collection('users')
                  .doc(user.uid)
                  .update({'designCompleted': true});
            }
            notifyListeners();
            break;
        }

      }

      await fetchUserData(); // Verileri tekrar çek

      notifyListeners();
    }
  }




  void changeIsLoadingAuth( bool contr){
    isLoadingAuth = contr;
    notifyListeners();
  }

  void  changeIsLoadingLogin(bool contr){
    isLoadingLogin = contr;
    notifyListeners();
  }

  void changeErrorMessageAuth(String message){
    errorMessage = message;
    notifyListeners();
  }





 void  noty (){
    notifyListeners();
 }


 void changeCanceledSignUp(bool val){
    isCanceledSignUp = val;
    notifyListeners();
 }






}