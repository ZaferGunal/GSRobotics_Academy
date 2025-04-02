import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/MyColors.dart';
import 'package:untitled7/OverallWidgets/progress_painter.dart';
import 'package:untitled7/Scaffolds/HomePage.dart';

import '../../providers/UserDataProvider.dart';
import '../../providers/VideoHallProvider.dart';

class DesignDialog extends StatelessWidget {
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
                              image: AssetImage("assets/design.png"),
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
                            "Grafik Tasarım")
                      ]),
                      SizedBox(height: 20),
                      Text(
                          style: MytextStyle(),
                          "Bu kursun amacı çocukların yaratıcı düşünme ve görsel iletişim becerilerini geliştirmelerine katkıda bulunmak ve uluslararası düzeyde yaygın olarak kullanılan bir tasarım aracı olan Canva hakkında bilgi sahibi olmalarını sağlamaktır.")

                      ,SizedBox(
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
                          "* Canva uygulamasında başlangıç seviyesini tamamlamak."),
                      Text(
                          style: MytextStyle(),
                          "* Temel tasarım prensiplerini kavrayıp daha karmaşık projelerde çalışmaya hazır olmak.")
                          ,
                      Text(
                          style: MytextStyle(),
                          "* Renk teorisi ve kompozisyon becerilerini kazanmak.    "),
                      Text(
                          style: MytextStyle(),
                          "* Hayal gücünü artırmak, estetik anlayışlarını geliştirmek."),

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
                          "1) Canva'ya Giriş                                                              "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "2) Canva Araçları ve Menüleri                                           "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "3) Basit Tasarımlar Yapma                                               "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "4) Şekiller ve Simgelerle Çalışma                                       "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "5) Resim ve Fotoğraf Kullanımı                                          "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "6) Poster Tasarımı                                                            "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "7) Davetiye Tasarımı                                                           "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "8) Sunum Hazırlama                                                        "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "9)  Sosyal Medya Posteri Tasarımı                                         "),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          style: MytextStyle(),
                          "10) Projeleri Paylaşma                                                     "),
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
                              painter: ProgressPainter(textSize: 17,  textColor: MyColors.black,
                                width: 10,
                                color: MyColors.green,
                                percentage: (Provider.of<UserDataProvider>(context,listen: true).userData?['progressDesign']/provider.namesDesign.length *100 ) <= 100?(Provider.of<UserDataProvider>(context,listen: true).userData?['progressDesign']/provider.namesDesign.length *100 ): 100
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
                                    Provider.of<UserDataProvider>(context,listen:false).userData?['isStartedDesign'] ? "devam et" : "kursa başla"),
                                SizedBox(height: 3)
                              ])),
                          onPressed: () {
                            Provider.of<UserDataProvider>(context,listen:false).updateStartDesign(context,true);
                            Provider.of<VideoHallProvider>(context,listen:false).playListAt("design",Provider.of<UserDataProvider>(context,listen:false).userData?["design"] );
                            Provider.of<VideoHallProvider>(context,listen:false).setAllCurrents(courseFullName: "Grafik Tasarım",lastIndex:Provider.of<UserDataProvider>(context,listen:false).userData?['design']);

                            Navigator.pushNamed(context, "/videoHall");

                          },
                          style: ButtonStyle(
                            backgroundColor:
                            WidgetStateProperty.all(MyColors.navy),
                          )),SizedBox(width: 0)])
                    ])))));
  }
}

class MytextStyle extends TextStyle {
  MytextStyle() : super(fontSize: 17) {}
}
