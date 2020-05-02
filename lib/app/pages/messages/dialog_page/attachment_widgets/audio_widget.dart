import 'package:chewie_audio/chewie_audio.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AudioWidget extends StatefulWidget {
  const AudioWidget({Key key, this.title, this.url}) : super(key: key);
  final String title;
  final String url;
  @override
  _AudioWidgetState createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;

  ChewieAudioController _chewieAudioController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url);

    _chewieAudioController = ChewieAudioController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true
    );
  }
  @override
  void dispose() {
    _chewieAudioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChewieAudio(
        controller: _chewieAudioController,
      ),
    );
  }
}
