import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class RegisterVideoProvider extends ChangeNotifier{
  late final player = Player();
  // Create a [VideoController] to handle video output from [Player].
  late final controller = VideoController(player);
  bool isPlaying = false;
  void initialize()  {
    player.open(play: false,Media("https://gsAkademiPull.b-cdn.net/gshesap.mp4"));
    player.setVolume(50);


    // Videoyu hemen duraklat






    // isPlaying durumunu güncelle

    notifyListeners();
  }



      notifyListeners();


void resume(){
    player.play();


}

  VideoController get getController => controller;


  void stop(){
    player.stop();
    notifyListeners();
  }

  void play() {

    player.play();
    notifyListeners();
  }

  void pause() {
    player.pause();
    notifyListeners();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}