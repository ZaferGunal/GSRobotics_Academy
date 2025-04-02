import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/MyColors.dart';
import 'package:untitled7/OverallWidgets/progress_painter.dart';
import 'package:untitled7/Scaffolds/HomePage.dart';
import 'package:untitled7/providers/UserDataProvider.dart';

import '../../providers/VideoHallProvider.dart';

class ArduinoDialog extends StatelessWidget {
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
                              image: AssetImage("assets/arduinogse.png"),
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
                            "Arduino ve Elektronik")
                      ]),
                      SizedBox(height: 20),
                      Text(
                          style: MytextStyle(),
                          "Bu kursun amacı çocukların hem eğlenmesi hem de temel elektronik bilgileri Arduino ile öğrenmesi; Arduino gibi modern teknolojileri keşfetmeleri ve elektronik projelerle deneyim kazanmalarıdır."),
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
                          "* Temel Arduino bilgisi edinmek ve elektronik devrelerle pratik yaparak projeler geliştirmek."),
                      Text(
                          style: MytextStyle(),
                          "* Sensörler, motorlar ve diğer bileşenlerle çalışarak temel elektronik prensiplerini öğrenmek."),
                      Text(
                          style: MytextStyle(),
                          "* Bu süreçte yaratıcılığı geliştirmek ve problem çözme becerilerini ilerletmek."),
                      Text(
                          style: MytextStyle(),
                          "* İlerleyen teknolojiyi öğrenmeye arduino yardımı ile başlayarak teknolojiyi anlamlandırabilmek."),
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
                          "1) Elektrik nedir nerelerde kullanılır.                                    "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "2) Basit elektrik devresi.                                                     "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "3) Arduino nedir, nerelerde kullanılır?                                "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "4) Farklı arduino kartlarını inceleyelim.                              "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "5) Arduino kitlerini inceleyelim.                                      "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "6) Mblock nedir, ne işe yarar?                                        "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "7) Mblock kurulumu.                                                     "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "8) Mblock genel arayüzü ve işleyişi.                                   "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "9) Arduino ile basit bir LED devresi kurulumu.                        "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "10) Mblock ile LED yakma.                                                     "),
                      SizedBox(
                        height: 2,
                      ),
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
                              painter: ProgressPainter(textSize: 17,
                                textColor: MyColors.black,
                                width: 10,
                                color: MyColors.green,
                                percentage:(Provider.of<UserDataProvider>(context,listen: true).userData?['progressArduino']/provider.namesArduino.length *100 ) <= 100?(Provider.of<UserDataProvider>(context,listen: true).userData?['progressArduino']/provider.namesArduino.length *100 ): 100 ,
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
                                    Provider.of<UserDataProvider>(context,listen:false).userData?['isStartedArduino'] ? "devam et" : "kursa başla"),
                                SizedBox(height: 3)
                              ])),
                          onPressed: () {
                            Provider.of<UserDataProvider>(context,listen:false).updateStartArduino(context,true);
                            Provider.of<VideoHallProvider>(context,listen:false).playListAt("arduino",Provider.of<UserDataProvider>(context,listen:false).userData?["arduino"] );
                            Provider.of<VideoHallProvider>(context,listen:false).setAllCurrents(courseFullName: "Arduino ve Elektronik",lastIndex:Provider.of<UserDataProvider>(context,listen:false).userData?['arduino'] );

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
