import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:untitled7/providers/LoginCorrectProvider.dart';
import 'package:untitled7/providers/UserDataProvider.dart';


import 'package:window_size/window_size.dart';
import 'package:flutter/material.dart';
import 'package:untitled7/Scaffolds/AllCourses.dart';
import 'package:untitled7/Scaffolds/HomePage.dart';
import 'package:untitled7/Scaffolds/LoginPage.dart';
import 'package:untitled7/Scaffolds/MyCourses.dart';
import 'package:untitled7/Scaffolds/RegisterPage.dart';


import 'package:untitled7/Scaffolds/WelcomePage.dart';
import 'package:untitled7/providers/DropdownProvider.dart';
import 'package:untitled7/providers/HoverProviderAll.dart';
import 'package:untitled7/providers/HoverProviderHome.dart';
import 'package:untitled7/providers/HoverProviderMy.dart';
import 'package:untitled7/providers/RegisterVideoProvider.dart';
import 'package:untitled7/providers/VideoHallProvider.dart';
import 'package:untitled7/providers/drawerProvider.dart';
import 'package:untitled7/sidebar/Sidebar.dart';


import 'package:untitled7/sidebar/sidebarLayout.dart';
import 'package:media_kit/media_kit.dart'; // Provides [Player], [Media], [Playlist] etc.
import 'package:media_kit_video/media_kit_video.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'Scaffolds/VideoHall.dart';
import 'firebase_options.dart';



void main()  async {
  WidgetsFlutterBinding.ensureInitialized();


 /* void main() async {
    WidgetsFlutterBinding.ensureInitialized();*/



    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    
  setWindowMinSize(const Size(1800,1200));

    setWindowTitle("GS Akademi");





    // Necessary initialization for package:media_kit.
    MediaKit.ensureInitialized();
    runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => VideoHallProvider()),
          ChangeNotifierProvider(create: (_) => UserDataProvider()),
          ChangeNotifierProvider(create: (_) => LoginCorrectProvider()),
          ChangeNotifierProvider(create: (_) => HoverProviderMy()),
          ChangeNotifierProvider(create: (_) => HoverProviderAll()),
          ChangeNotifierProvider(create: (_) => HoverProviderHome()),
          ChangeNotifierProvider(create: (_) => DrawerProvider()),
          ChangeNotifierProvider(create: (_) => RegisterVideoProvider()),
          ChangeNotifierProvider(create: (_) => DropdownProvider())
        ],
        child: MaterialApp(home: WelcomePage(),
          debugShowCheckedModeBanner: false,
          routes: {
            "/homePage": (BuildContext context) => HomePage(),
            "/registerPage": (BuildContext context) => RegisterPage(),
            "/welcomePage": (BuildContext context) => WelcomePage(),
            "/loginPage": (BuildContext context) => LoginPage(),
            "/myCoursesPage": (BuildContext context) => MyCourses(),
            "/allCoursesPage": (BuildContext context) => AllCourses(),
            "/sideBar": (BuildContext context) => SidebarLayout(),
            "/videoHall": (BuildContext context) => VideoHall()
          },

        ))


    );
  }

