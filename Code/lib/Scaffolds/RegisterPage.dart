import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled7/MyColors.dart';
import 'package:untitled7/OverallWidgets/Containers.dart';
import 'package:untitled7/OverallWidgets/TextFields.dart';
import 'package:untitled7/Scaffolds/WelcomePage.dart';
import 'package:untitled7/firebase_auth/firebase_auth_services.dart';
import 'package:untitled7/providers/DropdownProvider.dart';
import 'package:untitled7/providers/RegisterVideoProvider.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/providers/drawerProvider.dart';


import 'package:media_kit/media_kit.dart';                      // Provides [Player], [Media], [Playlist] etc.
import 'package:media_kit_video/media_kit_video.dart';

import '../providers/LoginCorrectProvider.dart';
import '../providers/UserDataProvider.dart';

class RegisterPage extends StatelessWidget {


  @override
  FirebaseAuthServices _authServices = FirebaseAuthServices();

  User? user;

  late final player = Player();

  // Create a [VideoController] to handle video output from [Player].
  late final controller = VideoController(player);

  late String name_, surname_;

  late String password_;

  late String email_;

  late int grade_;

  void showProblem() {

  }

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



    Future<void> signUp() async {
      Provider
          .of<UserDataProvider>(context, listen: false).changeIsLoadingAuth(true);
      Provider.of<UserDataProvider>(context,listen:false).changeErrorMessageAuth('');

      try {
        grade_ = Provider
            .of<DropdownProvider>(context, listen: false)
            .selected_value!;
        user = await _authServices.signUpWithEmailAndPassword(email: email_,
            password: password_,
            name: name_,
            surname: surname_,
            grade: grade_);

        if(user != null){
          Provider.of<UserDataProvider>(context,listen: false).fetchUserData();

          Navigator.pushNamedAndRemoveUntil(
              context, "/sideBar", (route) => false);
          Provider.of<DropdownProvider>(context, listen: false)
              .updateValue(null);

        }

      }
      finally{

        if(user == null){

            _showErrorSnackBar("giriş bilgileriniz eksik ya da hatalı");


        }

        Provider.of<UserDataProvider>(context,listen:false).changeIsLoadingAuth(false);


      }



    }




    // TODO: implement build
 return      Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(49),
            child: AppBar(automaticallyImplyLeading: false,
                backgroundColor: MyColors.transparent,
                title: Row(

                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 2, bottom: 1, top: 7),
                      child: IconButton(onPressed: !Provider.of<UserDataProvider>(context,listen:true).isLoadingAuth ? () {
                        Navigator.pop(context);
                        Provider.of<DropdownProvider>(context, listen: false)
                            .updateValue(null);
                      }: null, icon: Icon(Icons.arrow_back)),)
                  ],
                )
            )),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Stack(children: [Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  fit: FlexFit.loose,
                  flex: 5,
                  child: RoundedContainer_15(

                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),

                    child: Provider.of<UserDataProvider>(context,listen: true).isLoadingAuth ?  Scaffold( backgroundColor: MyColors.white,body: Center(child: CircularProgressIndicator())) :Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Text(
                            style: TextStyle(
                                fontSize: 25,
                                color: MyColors.black,
                                fontWeight: FontWeight.bold),
                            "Bir hesap oluşturun"),
                        SizedBox(height: 10),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(
                                style: TextStyle(
                                    fontSize: 15,
                                    color: MyColors.darkGrey,
                                    fontWeight: FontWeight.normal),
                                "zaten bir hesabınız varsa"
                            ), GestureDetector(onTap: () {
                              Navigator.pushNamed(context, "/loginPage");
                            }, child: Text(" oturum açın", style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: MyColors.purple)))
                            ]),
                        SizedBox(height: 70),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: BlueBorderTextField(
                                    hintText: "isim",

                                    onChanged: (String name) {
                                      name_ = name;
                                    },
                                    // this must be definied onChangedfor user_name
                                  )),
                              SizedBox(width: 20),
                              Expanded(
                                  child: BlueBorderTextField(
                                    hintText: "soyisim",
                                    onChanged: (String surname) {
                                      surname_ = surname;
                                    },
                                    // this must be definied onChangedfor user_surname
                                  ))
                            ]),
                        SizedBox(height: 30),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: BlueBorderTextField(
                                    hintText: "e-mail adresi",
                                    onChanged: (String email) {
                                      email_ = email;
                                    },
                                    // this must be definied onChangedfor user_e-mail
                                  )),
                              SizedBox(width: 30),
                              Expanded(
                                  child: BlueBorderTextField(
                                    hintText: "şifrenizi belirleyin",

                                    onChanged: (String password) {
                                      password_ = password;
                                    },
                                    // this must be definied onChangedfor user_surname
                                  ))
                            ]),
                        SizedBox(height: 20),
                        Container(padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: MyColors.green, // Kenarlık rengi
                                width: 1.0, // Kenarlık kalınlığı
                              )
                          ),
                          child: Consumer<DropdownProvider>(
                              builder: (context, provider, child) {
                                return
                                  DropdownButton(
                                      focusColor: MyColors.transparent,
                                      items: [
                                        DropdownMenuItem(child: Text("sınıf"),
                                            value: null),
                                        DropdownMenuItem(
                                            child: Text("1. sınıf"),
                                            value: 1),
                                        DropdownMenuItem(
                                            child: Text("2. sınıf"),
                                            value: 2),
                                        DropdownMenuItem(
                                            child: Text("3. sınıf"),
                                            value: 3),
                                        DropdownMenuItem(
                                            child: Text("4. sınıf"),
                                            value: 4),
                                        DropdownMenuItem(
                                            child: Text("5. sınıf"),
                                            value: 5),
                                        DropdownMenuItem(
                                            child: Text("6. sınıf"),

                                            value: 6),
                                        DropdownMenuItem(
                                            child: Text("7. sınıf"),
                                            value: 7),
                                        DropdownMenuItem(
                                            child: Text("8. sınıf"),
                                            value: 8)
                                      ],
                                      value: provider.selected_value,

                                      hint: Text("sınıf"),
                                      onChanged: (newVal) {
                                        provider.updateValue(newVal!);
                                      });
                              }),),
                        SizedBox(height: 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(

                                child: Container(alignment: Alignment.center,
                                    child: Column(
                                        children: [Text(style: TextStyle(
                                            fontSize: 20,
                                            color: MyColors.white),
                                            "kayıt ol"), SizedBox(height: 3)])),
                                onPressed: () async {
                                   await signUp();



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
                  )),
              VerticalDivider(
                indent: 0,
                endIndent: 40,
                thickness: 2,
                color: Color.fromARGB(255, 0, 5, 5),
              ),
              Flexible(
                  fit: FlexFit.loose,
                  flex: 3,
                  child: RoundedContainer_15(

                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                style: TextStyle(
                                    fontSize: 25,
                                    color: MyColors.black,
                                    fontWeight: FontWeight.bold),
                                " \" Nasıl bir hesap oluşturabilirim ? \""),
                            SizedBox(height: 30),
                            AspectRatio(aspectRatio: 16 / 9,
                              child: Consumer<RegisterVideoProvider>(
                                  builder: (context, provider, child) {
    provider.initialize();

return
    Video(controller: provider.controller);


     }),),
                            SizedBox(height: 140)
                          ]))),
            ]),
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
        ]));
  }





}




