import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/MyColors.dart';
import 'package:untitled7/OverallWidgets/progress_painter.dart';
import 'package:untitled7/Scaffolds/HomePage.dart';

import '../../providers/UserDataProvider.dart';
import '../../providers/VideoHallProvider.dart';

class ChessDialog extends StatelessWidget {

  final VideoHallProvider prov = VideoHallProvider();

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
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(9),
                                  topLeft: Radius.circular(9)),
                            ),
                            child: Image(
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                              image: AssetImage("assets/chessTwo.png"),
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
                            "Satranç")
                      ]),
                      SizedBox(height: 20),
                      Text(
                          style: MytextStyle(),
                          "Bu kursun amacı çocukların eğlenmesi aynı zamanda zihinsel gelişimlerine de katkıda bulunulması ve satranç gibi uluslararası bir oyun hakkında bilgi sahibi olmalarıdır."),
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
                          "* Satranç oyununda başlangıc seviyesini bitirmek.         "),
                      Text(
                          style: MytextStyle(),
                          "* Açılış bölümünün prensiplerini kavramak.                     "),
                      Text(
                          style: MytextStyle(),
                          "* Oyun ortası üzerinde yoğunlaşmaya hazir olmak.        "),
                      Text(
                          style: MytextStyle(),
                          "* Analitik düşünme yeteneğinde gelişim sağlamak.        "),
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
                          "1: Giriş ve taşların isimleri                                                   "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "2: Vezir, şah, kale, piyonun hareketi ve rok hamlesi                            "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "3: At ve filin hareketi                                                         "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "4: Tek kale ile mat                                                             "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "5: Tek kale ile mat - bölüm 2                                                  "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "6: iki fille mat                                                               "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "7: vezirle mat                                                                 "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "8: oyun sonunda tek piyon avantajı (beraberlik örneği)                         "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "9:oyun sonunda tek piyon avantajı (kazanç konum)                               "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "10: oyun sonunda ikiye bir piyon avantajı                                      "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "11:oyun sonunda üçe iki piyon avantajı                                         "),   SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "12:oyun sonu iki kanatta olursa                                                "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "13:Temel kombinezonlar - 1                                                      "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "14:Temel kombinezonlar - 2                                                   "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "15: Temel kombinezonlar - 3                                                    "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "16: Temel kombinezonlar - 4                                                    "),   SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "17: Açılış stratejisi - 1                                                        "),   SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "18: Açılış stratejisi - 2                                                       "),   SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "19:Açılış stratejisi - 3                                                      "),   SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "20: Merkez kontrolü - 1                                                          "),   SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "21:Merkez kontrolü - 2                                                        "),
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
                        Column(children: [ SizedBox(height: 17), Center(
                            child: Consumer<VideoHallProvider>(builder:(context,provider,child) { return CustomPaint(
                              size: Size(80, 80),
                              painter: ProgressPainter(textSize: 17,
                                textColor: MyColors.black,
                                width: 10,
                                color: MyColors.green,
                                percentage:(Provider.of<UserDataProvider>(context,listen: true).userData?['progressChess']/provider.namesChess.length *100 ) <= 100?(Provider.of<UserDataProvider>(context,listen: true).userData?['progressChess']/provider.namesChess.length *100 ): 100
                              ),
                            );}))
                        ])
                      ]),
                      SizedBox(height: 80),
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [SizedBox(width: 0), ElevatedButton(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Column(children: [
                                    Text(
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: MyColors.white),
                                        Provider
                                            .of<UserDataProvider>(
                                            context, listen: false)
                                            .userData?['isStartedChess']
                                            ? "devam et"
                                            : "kursa başla"),
                                    SizedBox(height: 3)
                                  ])),
                              onPressed: () {
                                Provider.of<UserDataProvider>(
                                    context, listen: false).updateStartChess(
                                    context, true);
                                Provider.of<VideoHallProvider>(
                                    context, listen: false).playListAt(
                                    "chess", Provider
                                    .of<UserDataProvider>(
                                    context, listen: false)
                                    .userData?["chess"]);
                                Provider.of<VideoHallProvider>(
                                    context, listen: false).setAllCurrents(
                                    courseFullName: "Satranç Temelleri",
                                    lastIndex: Provider
                                        .of<UserDataProvider>(
                                        context, listen: false)
                                        .userData?['chess']);

                                Navigator.pushNamed(context, "/videoHall");
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                WidgetStateProperty.all(MyColors.navy),
                              )), SizedBox(width: 0)])
                    ])))));
  }
}

class MytextStyle extends TextStyle {
  MytextStyle() : super(fontSize: 17) {}
}
