import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/MyColors.dart';
import 'package:untitled7/OverallWidgets/Containers.dart';
import 'package:untitled7/OverallWidgets/TextFields.dart';
import 'package:untitled7/Scaffolds/WelcomePage.dart';
import 'package:untitled7/firebase_auth/firebase_auth_services.dart';
import 'package:untitled7/providers/HoverProviderHome.dart';
import 'package:untitled7/providers/LoginCorrectProvider.dart';
import 'package:untitled7/providers/UserDataProvider.dart';


import '../providers/HoverProviderMy.dart';

class LoginPage extends StatelessWidget {

  User? user;
  late String email_, password_;
  FirebaseAuthServices _auth = FirebaseAuthServices();

  @override
  Widget build(BuildContext context) {

    void _showErrorSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center( child:Text(style: TextStyle(color: MyColors.red) ,message)),
          backgroundColor: MyColors.grey,
        ),
      );
    }



    Future<void> signIn() async {
      Provider
          .of<UserDataProvider>(context, listen: false).changeIsLoadingLogin(true);

try {
 user = await _auth.signInWithEmailAndPassword(
      email: email_, password: password_);

  if(user != null) {
    Provider.of<UserDataProvider>(context, listen: false).fetchUserData();

    Navigator.pushNamedAndRemoveUntil(
        context, "/sideBar", (route) => false);
  }

  }
finally{

  if(user == null){

    _showErrorSnackBar("giriş bilgileriniz eksik ya da hatalı");


  }

  Provider.of<UserDataProvider>(context,listen:false).changeIsLoadingAuth(false);



}






    }


    return Scaffold(


      appBar: PreferredSize(
          preferredSize: Size.fromHeight(49),
          child: AppBar(automaticallyImplyLeading: false,
              backgroundColor: MyColors.transparent,
              title: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 2, bottom: 1, top: 7),
                    child: IconButton(onPressed: () {
                      Navigator.pop(context);
                      Provider.of<LoginCorrectProvider>(context,listen: false).updateIsCorrect(true);
                    }, icon: Icon(Icons.arrow_back)),)

                ],
              ))),
      body: Stack(children: [ Center(
          child: SingleChildScrollView(child: Container(
              width: 600,
              height: 600,
              child: RoundedContainer_15(
                  margin: EdgeInsets.all(80),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(
                  style: TextStyle(
                  fontSize: 25,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold),
                  "Hesabınıza giriş yapın"),
              SizedBox(height: 10),
                        Provider.of<UserDataProvider>(context,listen: true).isLoadingAuth ?  Scaffold( backgroundColor: MyColors.white,body: Center(child: CircularProgressIndicator())) : Consumer<LoginCorrectProvider>(
                  builder: (context, provider, child) {
                    return Text(
                        style: TextStyle(
                            fontSize: 15,
                            color: provider.isTransparent
                                ? MyColors.transparent
                                : MyColors.transparent,
                            fontWeight: FontWeight.normal),
                        "mail ya da parolanız yanlış"
                    );
                  }),
              SizedBox(height: 50),


              BlueBorderTextField(
                hintText: "e-mail adresiniz",
                onChanged: (String email) {
                  email_ = email;
                },
              ),
              SizedBox(height: 30),
              BlueBorderTextField(
                hintText: "parolanız",
                onChanged: (String parola) {
                  password_ = parola;
                },
              ),
              SizedBox(
                height: 100,

              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
              ElevatedButton(

              child: Container(alignment: Alignment.center,
                  child: Column(
                      children: [Text(style: TextStyle(
                          fontSize: 20, color: MyColors.white),
                          "giriş yap"), SizedBox(height: 3)])),
              onPressed: () async {
                 await signIn();

              },


              
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
              MyColors.navy),

          )
      ), SizedBox(width: 60)
      ],
      )
      ],
    ),
    alignment: Alignment.center,
    )))),
    Align(
    alignment: Alignment.bottomRight,
    child: Container(
    margin: EdgeInsets.all(15),
    width: 90,
    height: 90,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/logoTransparent.png'),
    fit: BoxFit.cover,
    ),
    ),
    ),
    )
    ]
    )
    );
  }
}
