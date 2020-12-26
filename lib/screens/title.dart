import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:crunchyroll_app/models/catalog.dart';

class AnimeTitle extends StatefulWidget {
  Item item;
  AnimeTitle(this.item, {Key key}) : super(key: key);

  @override
  _AnimeTitleState createState() => _AnimeTitleState();
}

class _AnimeTitleState extends State<AnimeTitle> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    //widget.item.videoUrl;
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(widget.item.videoUrl);

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return Column(children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.network(
                                widget.item.picture,
                                width: 130,
                                height: 200,
                                fit: BoxFit.contain,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text(widget.item.name,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600))
                              ]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: widget.item.type,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.cyanAccent[400],
                                                fontWeight: FontWeight.w600)),
                                        WidgetSpan(
                                          child: Icon(Icons.bubble_chart,
                                              size: 14),
                                        ),
                                        TextSpan(
                                            text: widget.item.watchType,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        height: 20,
                      ),
                      Container(child: Text(widget.item.desc)),
                      Divider(
                        height: 20,
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Часов для просмотра: ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text: widget.item.watchingHours.toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.cyanAccent[400],
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text: '\nКоличество просмотров: ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text: widget.item.viewCount.toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.cyanAccent[400],
                                      fontWeight: FontWeight.w600)),
                            ]),
                          )
                        ],
                      ),
                    ],
                  ))
            ]);
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.orange,
            ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
