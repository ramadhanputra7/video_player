import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Colors.black;
  String dataSource = "images/video.mp4";
  VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(dataSource)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0.0,
        title: Text("Video Player"),
      ),
      body: Column(
        children: [
          Text(
            "Beautiful Wendy",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          _controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                )
              : Container(),
          VideoProgressIndicator(
            _controller!,
            allowScrubbing: true,
            padding: EdgeInsets.all(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.skip_previous),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  _controller!.value.isPlaying
                      ? _controller!.pause()
                      : _controller!.play();
                },
                color: Colors.white,
                icon: Icon(Icons.play_arrow),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.skip_next),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
