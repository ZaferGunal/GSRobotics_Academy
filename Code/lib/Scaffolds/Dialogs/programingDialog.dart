import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/MyColors.dart';
import 'package:untitled7/OverallWidgets/progress_painter.dart';
import 'package:untitled7/Scaffolds/HomePage.dart';
import 'package:untitled7/providers/VideoHallProvider.dart';

import '../../providers/UserDataProvider.dart';

class ProgramingDialog extends StatelessWidget {
  final VideoHallProvider prov= VideoHallProvider();

  @override
  Widget build(BuildContext context) {

    bool isStarted = true;

    // TODO: implement build
    return AlertDialog(
        title: Container(
            width: 460,
            height: 550,
            child: SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.all(30),
                    width: 400,
                    child: Column(children: [
                      Stack(children: [
                        Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(9),topLeft: Radius.circular(9)),
                            ),
                            child: Image(
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                              image: AssetImage("assets/programing.png"),
                            )),
                        Container(
                          width: double.infinity,
                          height: 200.3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.8),
                                Colors.transparent
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        SizedBox(width: 6),
                        Text(
                            style: TextStyle(
                                color: MyColors.shadowColor,
                                fontSize: 23,
                                fontWeight: FontWeight.w600),
                            "Programlama")
                      ]),
                      SizedBox(height: 20),
                      Text(
                          style: MytextStyle(),
                          "Bu kursun  amacı, öğrencilere Scratch aracılığıyla temel bilgisayar programlama yetenekleri kazandırmaktır. Bu sayede öğrencilerin bilgisayar programlama konusunda ilk adımlarını atmalarını sağlamak ve onları teknolojiyle daha yakın bir şekilde tanıştırmak hedeflenmektedir."),
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        Text(
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
                            " Ulaşılmak İstenen Hedefler:")
                      ]),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                          style: MytextStyle(),
                          "* Scratch'in temel kullanımını öğrenmek ve pratik yapmak."),
                      Text(
                          style: MytextStyle(),
                          "* Animasyonlar oluşturarak görsel anlatım yeteneklerini geliştirmek."),
                      Text(
                          style: MytextStyle(),
                          "* Basit oyunlar tasarlayarak problem çözme ve mantıksal düşünme becerilerini ilerletmek."),
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        SizedBox(width: 6),
                        Text(
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
                            "İçerik planı:")
                      ]),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                          style: MytextStyle(),
                          "1)	Scratch nedir? Scratch ile neler yapılabilir?                   "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "2)	Scratch komutlarını tanıyalım.                                   "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "3)	Scratch programında kukla ve dekorlar.                    "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "4)	Animasyon yapalım: Kukla ve dekor ekleme.                 "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "5)	Animasyon yapalım: Kuklalar nasıl hareket ettirilir? Nasıl konuşturulur?"),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "6)	Animasyon yapalım: Su altı animasyonu.                   "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "7)	Scratch programında oyun hazırlayalım : Balığı yut oyunu."),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "8)	Scratch programında oyun hazırlayalım : Elma toplama oyunu."),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "9)	Scratch programında Sayı tahmin programı hazırlama."),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "10) Scratch programında giriş ekranı(intro) hazırlama.   "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "11)	Scratch ile Toplama, Çıkarma, Çarpma ve Bölme İşlemleri.    "),
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: [

                          SizedBox(height: 40),
                          Text("ilerleme oranı :",
                              style: TextStyle(
                                  fontSize: 18, color: MyColors.titleGrey))
                        ,
                        SizedBox(width: 185),
                       Column(children:[ SizedBox(height: 17),Center(
                            child: Consumer<VideoHallProvider>(builder: (context,provider,child){return CustomPaint(
                              size: Size(80, 80),
                              painter: ProgressPainter(textSize: 17,  textColor: MyColors.black,
                                width: 10,
                                color: MyColors.green,
                                percentage: (Provider.of<UserDataProvider>(context,listen: true).userData?['progressPrograming']/provider.namesPrograming.length *100 ) <= 100?(Provider.of<UserDataProvider>(context,listen: true).userData?['progressPrograming']/provider.namesPrograming.length *100 ): 100,
                              ),
                            );}))]) ]),
             SizedBox(height: 80),
                     Row(mainAxisAlignment:MainAxisAlignment.end,children: [SizedBox(width: 0),ElevatedButton(
                          child: Container(
                              alignment: Alignment.center,
                              child: Column(children: [
                                Text(
                                    style: TextStyle(
                                        fontSize: 20, color: MyColors.white),
                                    Provider.of<UserDataProvider>(context,listen:false).userData?['isStartedPrograming'] ? "devam et" : "kursa başla"),
                                SizedBox(height: 3)
                              ])),
                          onPressed: () {
                            Provider.of<UserDataProvider>(context,listen:false).updateStartPrograming(context,true);
                            Provider.of<VideoHallProvider>(context,listen:false).playListAt("programing",Provider.of<UserDataProvider>(context,listen:false).userData?["programing"] );
                            Provider.of<VideoHallProvider>(context,listen:false).setAllCurrents(courseFullName: "Programlama",lastIndex:Provider.of<UserDataProvider>(context,listen:false).userData?["programing"] );

                            Navigator.pushNamed(context, "/videoHall");


                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(MyColors.navy),
                          )),SizedBox(width: 0)])
                    ])))));
  }
}

class MytextStyle extends TextStyle {
  MytextStyle() : super(fontSize: 17) {}
}
