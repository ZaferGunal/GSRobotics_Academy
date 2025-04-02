import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:provider/provider.dart';
import '../MyColors.dart';
import '../OverallWidgets/progress_painter.dart';
import '../providers/UserDataProvider.dart';
import '../providers/VideoHallProvider.dart';

class VideoHall extends StatefulWidget {

  @override
  State<VideoHall> createState() => _VideoHallState();
}

class _VideoHallState extends State<VideoHall> {
  late final AppLifecycleListener _listener;
  final ScrollController _scrollController = ScrollController();
  late AppLifecycleState? _state;

  @override
  void initState() {
    super.initState();
    _state = SchedulerBinding.instance.lifecycleState;
    _listener = AppLifecycleListener(
      onInactive: _saveProgress,
      onPause: _saveProgress,
      onDetach: _saveProgress,
      onStateChange: _handleStateChange,
    );
  }


  void _saveProgress() {
    Provider.of<UserDataProvider>(context, listen: false).updateLastIndexOf(
        Provider.of<VideoHallProvider>(context, listen: false).nameOfCourse,
        Provider.of<VideoHallProvider>(context, listen: false).selectedIndex);
  }

  void _handleStateChange(AppLifecycleState state) {
    setState(() {
      _state = state;
    });
  }

  @override
  void dispose() {
    _saveProgress();
    super.dispose();
  }
  int c = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: <Widget>[
        Flexible(
          flex: 7,
          child: Container(
            color: MyColors.midDark,
            child: Column(children: [
              SizedBox(height: 6),
              Row(children: [
                SizedBox(width: 8),
                IconButton(
                  color: MyColors.white,
                  onPressed: () {
                    Provider.of<VideoHallProvider>(context, listen: false)
                        .player
                        .pause();
                    Navigator.pop(context);
                    _saveProgress();
                  },
                  icon: Icon(Icons.arrow_back),
                )
              ]),
              SizedBox(height: 15),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Consumer<VideoHallProvider>(
                  builder: (context, provider, child) {
                    return Stack(children: [
                      Video(controller: provider.controller),
                      Center(
                        child: StreamBuilder<bool>(
                          stream: provider.player.stream.playing,
                          builder: (context, snapshot) {
                            bool isPlaying = snapshot.data ?? false;
                            return IconButton(
                              icon: Icon(
                                isPlaying ? null: Icons.play_arrow,
                                size: 90,
                              ),
                              onPressed: () {
                                if (isPlaying) {
                                  provider.player.pause();
                                } else {
                                  provider.player.play();
                                }
                              },
                            );
                          },
                        ),
                      )
                    ]);
                  },
                ),
              ),
              SizedBox(height: 8),
              Row(children: [
                SizedBox(width: 7),

              ])
            ]),
          ),
        ),
        Flexible(
          flex: 2,
          child: Consumer<VideoHallProvider>(
            builder: (context, provider, child) {
              return Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height - 180,
                        child: StreamBuilder<Duration>(
                          stream: provider.player.stream.position,
                          builder: (context, snapshot) {
                            final position = snapshot.data ?? Duration.zero;
                            final Duration duration =
                                provider.player.state.duration ?? Duration.zero;



                            // Ensure that the progress updates correctly
                            if (position.inMilliseconds+ 200 >= duration.inMilliseconds &&    duration > Duration.zero )
                            {


                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                              if(!Provider.of<UserDataProvider>(context, listen: false).userData?[provider.arrayName][provider.selectedIndex])
                              {
                                Provider.of<UserDataProvider>(context, listen: false)
                                    .updateChecked(provider.arrayName, provider.selectedIndex, true);
                              }
                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

                              provider.player.pause();

                              if (provider.selectedIndex + 1 < provider.currentNames.length) {
                                provider.increaseIndex();
                                provider.playListAt(provider.nameOfCourse, provider.selectedIndex);
                              } else {

                                // If it's the last video, you might want to handle it differently
                                print("All videos have been played.");
                                // Optionally, reset or stop the player, or show a message
                              }




                              print("  hesaplanan  c :  $c ");
                            }

                            return ListView.builder(
                              controller: _scrollController,
                              itemCount: provider.currentNames.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  selected: provider.selectedIndex == index,
                                  subtitle: Text("    "),
                                  leading: Provider.of<UserDataProvider>(context, listen: true)
                                      .userData?[provider.arrayName][index]
                                      ? Icon(Icons.check_circle_outline_outlined, color: MyColors.green)
                                      : Icon(Icons.circle_outlined, color: MyColors.white),
                                  title: Text(
                                    provider.currentNames[index],
                                    style: TextStyle(color: MyColors.white),


                                  ),
                                  onTap: () {
                                    provider.updateIndex(index);
                                    provider.playListAt(provider.nameOfCourse, index);
                                  },
                                  tileColor: MyColors.tileColor,
                                  selectedTileColor: MyColors.navy,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 180,
                      color: MyColors.midDark,
                      child: Stack(children: [
                        Positioned(
                          bottom: 20,
                          right: 15,
                          child: CustomPaint(
                            size: Size(50, 50),
                            painter: ProgressPainter(
                              textColor: MyColors.white,
                              textSize: 12,
                              width: 4,
                              color: MyColors.green,
                              percentage: (Provider.of<UserDataProvider>(context,listen: true).userData?[provider.progressName]/provider.currentNames.length *100 ) <= 100?(Provider.of<UserDataProvider>(context,listen: true).userData?[provider.progressName]/provider.currentNames.length *100 ): 100,
                            ),
                          ),
                        ),
                        Center(
                          child: Row(children: [
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text(
                                  style: TextStyle(
                                    color: MyColors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Provider.of<VideoHallProvider>(context, listen: true)
                                      .currentCourseFullName,
                                ),
                                SizedBox(height: 2),
                                Row(children: [
                                  Text(
                                    " ${Provider.of<VideoHallProvider>(context, listen: true).currentCourse.medias.length} video",
                                    style: TextStyle(
                                      color: MyColors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 110)
                                ])
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            SizedBox(width: 40),
                          ]),
                        )
                      ]),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}
