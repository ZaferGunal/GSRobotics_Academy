import 'package:flutter/material.dart';
import 'package:untitled7/MyColors.dart';
import 'package:untitled7/OverallWidgets/Containers.dart';
import 'package:untitled7/Scaffolds/LoginPage.dart';
import 'package:untitled7/Scaffolds/RegisterPage.dart';

class WelcomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/blur_.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
            child: Container(
          decoration: BoxDecoration(
            color: MyColors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          constraints: BoxConstraints(
              minWidth: 500, // Minimum genişlik
              minHeight: 500,
              maxHeight: 700,
              maxWidth: 700),
          // Minimum yükseklik
          margin: EdgeInsets.all(40),
          child: Column(


              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Row(mainAxisAlignment: MainAxisAlignment.center,children:[
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logoTransparent.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

               Text("GS Akademi'ye hoşgeldin",style: TextStyle(color: MyColors.white,fontSize: 25,fontWeight: FontWeight.bold)),
                  SizedBox(width: 40) ]),
          SizedBox(height: 120),
                Container(

                    margin: EdgeInsets.all(30),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(MyColors.purple)),
                        onPressed: ()=> Navigator.pushNamed(context,"/loginPage") ,
                        child: Container(
                            alignment: Alignment.center,
                            child: Text("Oturum aç",
                                style: TextStyle(color: MyColors.white)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                            )))),


                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children :[
                     Expanded(child: Divider(
                        color: MyColors.white,
                        thickness: 2,
                         indent : 60,endIndent:20,
                      )),
                      Text("ya da ", style: TextStyle(fontSize: 19,color: MyColors.white)),
                      Expanded(child: Divider(
                        indent: 20,
                        endIndent: 60,
                        color: MyColors.white,
                        thickness:2

                      ))
                    ]

                  )
                ),



                Container(
                    margin: EdgeInsets.all(30),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(MyColors.green)),
                        onPressed: () => Navigator.pushNamed(context,"/registerPage"),

                        child: Container(
                            alignment: Alignment.center,
                            child: Text("Kayıt ol",
                                style: TextStyle(color: MyColors.white)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                            ))))
              ]),
        ))
      ]),
    );
  }
}
