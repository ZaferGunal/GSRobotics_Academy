import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoHallProvider extends ChangeNotifier {

  late int currentSeconds;
  Map<String, dynamic>? _userData;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String arrayName;
  late String progressName;

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
  }

  late String nameOfCourse;

  int programingLastEps = 0;
  int chessLastEps = 0;
  int arduinoLastEps = 0;
  int designLastEps = 0;

  int selectedIndex = 0;

  late List<String> currentNames;
  final List<String> namesPrograming = [
    "1)	Scratch nedir? Scratch ile neler yapılabilir",
    "2)	Scratch komutlarını tanıyalım.",
    "3)	Scratch programında kukla ve dekorlar.",
    "4)	Animasyon yapalım: Kukla ve dekor ekleme.",
    "5)	Animasyon yapalım: Kuklalar nasıl hareket ettirilir? Nasıl konuşturulur?",
    "6)	Animasyon yapalım: Su altı animasyonu.",
    "7)	Scratch programında oyun hazırlayalım : Balığı yut oyunu.",
    "8)	Scratch programında oyun hazırlayalım : Elma toplama oyunu.",
    "9)	Scratch programında Sayı tahmin programı hazırlama.",
    "10) Scratch programında giriş ekranı(intro) hazırlama.",
    "11)	Scratch ile Toplama, Çıkarma, Çarpma ve Bölme İşlemleri."
  ];
  List<String> namesArduino = [
    "1) Elektrik nedir nerelerde kullanılır.",
    "2) Basit elektrik devresi.",
    "3) Arduino nedir, nerelerde kullanılır?",
    "4) Farklı arduino kartlarını inceleyelim.",
    "5) Arduino kitlerini inceleyelim.",
    "6) Mblock nedir, ne işe yarar?",
    "7) Mblock kurulumu.",
    "8) Mblock genel arayüzü ve işleyişi.",
    "9) Arduino ile basit bir LED devresi kurulumu.",
    "10) Mblock ile LED yakma."
  ];
  List<String> namesChess = [
    "1) Giriş ve taşların isimleri 1 ",
    "2) Giriş ve taşların isimleri 2 ",
    "3) Giriş ve taşların isimleri 3 ",
    "4) Vezir, şah, kale, piyonun hareketi ve rok hamlesi",
    "5) At ve filin hareketi",
    "6) Tek kale ile mat",
    "7) Tek kale ile mat bölüm iki",
    "8) İki fille mat",
    "9) Vezirle mat",
    "10) Oyun sonunda tek piyon avantajı (beraberlik örneği)",
    "11) Oyun sonunda tek piyon avantajı (kazanç konum)",
    "12) Oyun sonunda ikiye bir piyon avantajı",
    "13) Oyun sonunda üçe iki piyon avantajı",
    "14) Oyun sonu iki kanatta olursa",
    "15) Temel kombinezonlar - 1",
    "16) Temel kombinezonlar - 2",
    "17) Temel kombinezonlar - 3",
    "18) Temel kombinezonlar - 4",
    "19) Açılış stratejisi - 1",
    "20) Açılış stratejisi - 2",
    "21) Açılış stratejisi - 3",
    "22) Merkez kontrolü - 1",
    "23) Merkez kontrolü - 2"
  ];
  List<String> namesDesign = [
    "1) Canva'ya Giriş",
    "2) Canva Araçları ve Menüleri",
    "3) Basit Tasarımlar Yapma",
    "4) Şekiller ve Simgelerle Çalışma",
    "5) Resim ve Fotoğraf Kullanımı",
    "6) Poster Tasarımı",
    "7) Davetiye Tasarımı",
    "8) Sunum Hazırlama",
    "9)  Sosyal Medya Posteri Tasarımı",
    "10) Projeleri Paylaşma"
  ];

  late Playlist currentCourse;

  late final player = Player();

  late String currentCourseFullName;

  void setCurrentCourseFullName(String val) {
    currentCourseFullName = val;
    notifyListeners();
  }

  late final controller = VideoController(player);

  final playlistPrograming = Playlist([
    Media("https://gsAkademiPull.b-cdn.net/programing/vid1.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/programing/vid2.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/programing/vid3.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/programing/vid4.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/programing/vid5.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/programing/vid6.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/programing/vid7.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/programing/vid8.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/programing/vid9.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/programing/vid10.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/programing/vid11.mp4"),
  ]);

  final Playlist playlistArduino = Playlist([
    Media("https://gsAkademiPull.b-cdn.net/arduino/a1.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/arduino/a2.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/arduino/a3.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/arduino/a4.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/arduino/a5.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/arduino/a666.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/arduino/a7.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/arduino/a8.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/arduino/aa9.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/arduino/a10.mp4"),
  ]);

  final Playlist playlistChess = Playlist([
    Media("https://gsAkademiPull.b-cdn.net/chess/S1.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S2.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S3.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S4.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S5.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S6.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S7.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S8.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S999.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S10.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S11.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S12.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S13.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S14.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S15.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S16.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S17.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S18.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S19.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S20.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S21.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S22.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/chess/S23.mp4"),


  ]);

  final Playlist playlistDesign = Playlist([
    Media("https://gsAkademiPull.b-cdn.net/design/dvid1.mp4"),  // the third is missing
    Media("https://gsAkademiPull.b-cdn.net/design/dvid2.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/design/dvid3.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/design/dvid4.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/design/dvid5.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/design/dvid6.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/design/dvid7.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/design/dvid8.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/design/dvid9.mp4"),
    Media("https://gsAkademiPull.b-cdn.net/design/dvid10.mp4"),
  ]);
  late int lastWathcedEpisode;

  void playList(String course_) {
    player.setPlaylistMode(PlaylistMode.single);

    switch (course_) {
      case "programing":
        setCurrentNames(namesPrograming);
        break;
      case "arduino":
        setCurrentNames(namesArduino);
        break;
      case "chess":
        setCurrentNames(namesChess);
        break;
      case "design":
        setCurrentNames(namesDesign);
        break;
    }
  }

  void playListAt(String course_, int index) {
    player.setPlaylistMode(PlaylistMode.single);
    switch (course_) {
      case "programing":
        player.open(playlistPrograming, play: false);
        player.jump(index);
        break;
      case "arduino":
        player.open(playlistArduino, play: false);
        player.jump(index);
        break;
      case "chess":
        player.open(playlistChess, play: false);
        player.jump(index);
        break;
      case "design":
        player.open(playlistDesign, play: false);
        player.jump(index);
    }
  }

  void setCurrentCourse(Playlist playlist) {
    currentCourse = playlist;
    notifyListeners();
  }

  void setCurrentNames(List<String> list) {
    currentNames = list;
    notifyListeners();
  }

  String getCourseName() {
    if (currentCourse == playlistPrograming)
      return "Programlama";
    else if (currentCourse == playlistArduino)
      return "Arduino ve Elektronik";
    else if (currentCourse == playlistChess) return "Satranç";
    return "Grafik Tasarım";
  }

  void updateIndex(int ind) {
    selectedIndex = ind;
    notifyListeners();
  }

  void increaseIndex() {
    selectedIndex++;
    notifyListeners();
  }

  void setAllCurrents({required String courseFullName, int? lastIndex}) {
    currentCourseFullName = courseFullName;
    switch (courseFullName) {
      case "Arduino ve Elektronik":
        currentNames = namesArduino;
        currentCourse = playlistArduino;
        nameOfCourse = "arduino";
        selectedIndex = lastIndex!;
        arrayName = "checkArduino";
        progressName = "progressArduino";


      case "Programlama":
        currentNames = namesPrograming;
        currentCourse = playlistPrograming;
        nameOfCourse = "programing";
        selectedIndex = lastIndex!;
        arrayName = "checkPrograming";
        progressName = "progressPrograming";


      case "Satranç Temelleri":
        currentNames = namesChess;
        currentCourse = playlistChess;
        nameOfCourse = "chess";
        selectedIndex = lastIndex!;
        arrayName = "checkChess";
        progressName = "progressChess";

      case "Grafik Tasarım":
        currentNames = namesDesign;
        currentCourse = playlistDesign;
        nameOfCourse = "design";
        selectedIndex = lastIndex!;
        arrayName = "checkDesign";
        progressName = "progressDesign";

    }
    notifyListeners();
  }
}
