import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled7/MyColors.dart';
import 'package:untitled7/Scaffolds/AllCourses.dart';
import 'package:untitled7/Scaffolds/HomePage.dart';
import 'package:untitled7/Scaffolds/MyCourses.dart';
import 'package:untitled7/providers/HoverProviderAll.dart';
import 'package:untitled7/providers/HoverProviderHome.dart';
import 'package:untitled7/providers/HoverProviderMy.dart';
import 'package:untitled7/providers/UserDataProvider.dart';
import 'package:untitled7/providers/drawerProvider.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../firebase_auth/firebase_auth_services.dart';

class Sidebar extends StatefulWidget {
  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar>
    with SingleTickerProviderStateMixin<Sidebar> {
  FirebaseAuthServices _authServices = FirebaseAuthServices();
  late AnimationController animationController;
  final bool isBarOpen = true;
  final animationDuration = const Duration(milliseconds: 500);
  late StreamController<bool> isBarOpenedStreamController;
  late StreamSink<bool> isBarOpenedSink;
  late Stream<bool> isBarOpenedStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
    isBarOpenedStreamController = PublishSubject<bool>();
    isBarOpenedStream = isBarOpenedStreamController.stream;
    isBarOpenedSink = isBarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    isBarOpenedStreamController.close();
    isBarOpenedSink.close();
    super.dispose();
  }

  void onClickIcon() {
    final status = animationController.status;
    final isAnimationCompleted = status == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isBarOpenedSink.add(false);
      animationController.reverse();
    } else {
      isBarOpenedSink.add(true);
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // TODO: implement build

    return StreamBuilder<bool>(
        stream: isBarOpenedStream,
        initialData: false,
        builder: (context, isSideBarOpenedAsync) {
          return (AnimatedPositioned(
              duration: animationDuration,
              left: isSideBarOpenedAsync.data! ? -screenWidth : 0,
              top: 0,
              bottom: 0,
              right: isSideBarOpenedAsync.data!
                  ? screenWidth - 40
                  : screenWidth - 300,
              child: Row(children: [
                        Expanded(
                            child: Stack(children: [
                          Container(
                            color: MyColors.grey,
                            child: Column(children: [
                              SizedBox(height: 25),
                              Container(
                                  margin: EdgeInsets.all(10),
                                  child: Consumer<UserDataProvider>(
                                      builder: (context, provider, child) {
                                    final name =
                                        provider.userData?['name'] ?? '';
                                    final surname =
                                        provider.userData?['surname'] ?? '';
                                    final email =
                                        provider.userData?['email'] ?? '';
                                    return ListTile(
                                        leading: Icon(
                                            color: MyColors.titleGrey,
                                            Icons.person_2_sharp,
                                            size: 30),
                                        title: Text('$name $surname',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        subtitle: Text(email,
                                            style: TextStyle(
                                                color: MyColors.shadowColor)));
                                  })),
                              Divider(thickness: 1, endIndent: 20, indent: 20),
                              SizedBox(height: 25),
                              MouseRegion(onEnter: (_) {
                                Provider.of<HoverProviderHome>(context,
                                        listen: false)
                                    .setHovered(true);
                              }, onExit: (_) {
                                Provider.of<HoverProviderHome>(context,
                                        listen: false)
                                    .setHovered(false);
                              }, child: Consumer<HoverProviderHome>(
                                builder: (context, provider, child) {
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 100),
                                    width: provider.isHovered ? 230 : 220,
                                    height: provider.isHovered ? 35 : 30,
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            context
                                                .read<DrawerProvider>()
                                                .updatePage(HomePage());
                                          });
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  if (context
                                                          .read<
                                                              DrawerProvider>()
                                                          .currentPage
                                                          .runtimeType ==
                                                      HomePage().runtimeType)
                                                    BoxShadow(
                                                      color:
                                                          MyColors.shadowColor,
                                                      blurRadius: 10.0,
                                                      offset: Offset(0, 4),
                                                    ),
                                                ],
                                                color: MyColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                    color: MyColors.shadowColor,
                                                    Icons.home_filled),
                                                SizedBox(width: 7),
                                                Text(
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 100, 100, 100),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    "ana sayfa")
                                              ],
                                            ))),
                                  );
                                },
                              )),
                              SizedBox(height: 7),
                              MouseRegion(onEnter: (_) {
                                Provider.of<HoverProviderMy>(context,
                                        listen: false)
                                    .setHovered(true);
                              }, onExit: (_) {
                                Provider.of<HoverProviderMy>(context,
                                        listen: false)
                                    .setHovered(false);
                              }, child: Consumer<HoverProviderMy>(
                                builder: (context, provider, child) {
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 100),
                                    width: provider.isHovered ? 230 : 220,
                                    height: provider.isHovered ? 35 : 30,
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            context
                                                .read<DrawerProvider>()
                                                .updatePage(MyCourses());
                                          });
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  if (context
                                                          .read<
                                                              DrawerProvider>()
                                                          .currentPage
                                                          .runtimeType ==
                                                      MyCourses().runtimeType)
                                                    BoxShadow(
                                                      color:
                                                          MyColors.shadowColor,
                                                      blurRadius: 10.0,
                                                      offset: Offset(0, 4),
                                                    ),
                                                ],
                                                color: MyColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                    color: MyColors.shadowColor,
                                                    Icons
                                                        .my_library_books_outlined),
                                                SizedBox(width: 7),
                                                Text(
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 100, 100, 100),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    "kurslarım")
                                              ],
                                            ))),
                                  );
                                },
                              )),
                              SizedBox(height: 7),
                              MouseRegion(onEnter: (_) {
                                Provider.of<HoverProviderAll>(context,
                                        listen: false)
                                    .setHovered(true);
                              }, onExit: (_) {
                                Provider.of<HoverProviderAll>(context,
                                        listen: false)
                                    .setHovered(false);
                              }, child: Consumer<HoverProviderAll>(
                                builder: (context, provider, child) {
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 100),
                                    width: provider.isHovered ? 230 : 220,
                                    height: provider.isHovered ? 35 : 30,
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            context
                                                .read<DrawerProvider>()
                                                .updatePage(AllCourses());
                                          });
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  if (context
                                                          .read<
                                                              DrawerProvider>()
                                                          .currentPage
                                                          .runtimeType ==
                                                      AllCourses().runtimeType)
                                                    BoxShadow(
                                                      color:
                                                          MyColors.shadowColor,
                                                      blurRadius: 10.0,
                                                      offset: Offset(0, 4),
                                                    ),
                                                ],
                                                color: MyColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                    color: MyColors.shadowColor,
                                                    Icons
                                                        .video_library_outlined),
                                                SizedBox(width: 7),
                                                Text(
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 100, 100, 100),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    "tüm kurslar")
                                              ],
                                            ))),
                                  );
                                },
                              )),
                            ]),
                          ),
                          Positioned(
                              bottom: 20,
                              left: 15,
                              child: TextButton(
                                  onPressed: () {
                                    _authServices.signOut();
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/welcomePage',
                                      // The named route of your registration page
                                      (Route<dynamic> route) =>
                                          false, // Removes all previous routes
                                    );
                                  },
                                  child: Text("çıkış",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 100, 100, 100),
                                          fontWeight: FontWeight.bold))))
                        ])),
                        Align(
                            alignment: Alignment(0, -0.95),
                            child: GestureDetector(
                                onTap: () {
                                  onClickIcon();
                                },
                                child: ClipPath(
                                    clipper: CustomMenuClipper(),
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        color: MyColors.grey,
                                        width: 25,
                                        height: 45,
                                        child: AnimatedIcon(
                                            size: 20,
                                            progress: animationController.view,
                                            icon: AnimatedIcons.close_menu)))))
                      ])));
        });
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Paint paint = Paint();
    paint.color = MyColors.black;
    final width = size.width;
    final height = size.height;
    Path path = new Path();
    final radius = 10.0; // Köşe yarıçapı

    // Sol üst köşe
    // Sol üst köşe
    // Sol üst köşe içe yuvarlatma
    path.moveTo(0, 0);
    path.lineTo(width - radius, 0);
    // Sağ üst köşe içe yuvarlatma
    path.quadraticBezierTo(width, 0, width, radius);
    path.lineTo(width, height - radius);
    // Sağ alt köşe içe yuvarlatma
    path.quadraticBezierTo(width, height, width - radius, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
