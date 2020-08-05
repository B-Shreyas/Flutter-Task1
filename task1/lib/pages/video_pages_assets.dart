import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlayerAssets extends StatefulWidget {
  @override
  _VideoPlayerAssetsState createState() => _VideoPlayerAssetsState();
}

class _VideoPlayerAssetsState extends State<VideoPlayerAssets> {

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    // TODO: implement initState
   // _controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _controller = VideoPlayerController.asset("Videos/niagara_falls.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(5.0);
    super.initState();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade700,
        appBar: AppBar(
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: (){}),
            IconButton(icon: Icon(Icons.music_video), onPressed: (){}),
          ],
          title: Text("Offline VideoPlayer"),
        ),
        body: Card(
          elevation: 10.0,
          color: Colors.black,
          margin: EdgeInsets.symmetric(vertical: 62.2, horizontal: 30.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 500,
                height: 200,
                child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot){
                      if(snapshot.connectionState  == ConnectionState.done) {
                        return AspectRatio(aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        );
                      }else{
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                ),
              ),

              SizedBox(
                height: 12.0,
              ),

              Container(
                width: 500,
                height: 200,
                child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot){
                      if(snapshot.connectionState  == ConnectionState.done) {
                        return AspectRatio(aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        );
                      }else{
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                ),
              ),

              SizedBox(
                height: 12.0,
              ),

              Container(
                width: 500,
                height: 200,
                child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot){
                      if(snapshot.connectionState  == ConnectionState.done) {
                        return AspectRatio(aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        );
                      }else{
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                ),
              ),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              if(_controller.value.isPlaying){
                _controller.pause();
              }

              else if(_controller.value.isBuffering){
                _controller.pause();
              }
              else{
                _controller.play();
              }
            });
          },
          child: Icon(_controller.value.isPlaying ? Icons.pause != null ? Icons.stop : Icons.play_arrow : Icons.play_arrow),
          elevation: 10.0,
        ),
      ),
    );
  }
}
