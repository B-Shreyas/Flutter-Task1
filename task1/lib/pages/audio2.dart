import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

typedef void OnError(Exception exception);

void main() {
  runApp(
      new MaterialApp(debugShowCheckedModeBanner: false, home: LocalAudio()));
}

class LocalAudio extends StatefulWidget {
  @override
  _LocalAudio createState() => _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    // ignore: deprecated_member_use
    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    // ignore: deprecated_member_use
    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin:  EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color(0x46000000),
                offset: Offset(0, 20),
                spreadRadius: 0,
                blurRadius: 30,
              ),
              BoxShadow(
                color: Color(0x11000000),
                offset: Offset(0, 10),
                spreadRadius: 0,
                blurRadius: 30,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage(
                  "https://images.pexels.com/photos/3552948/pexels-photo-3552948.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              fit: BoxFit.cover,
            ),
          ),
//          child: Container(
//            margin: EdgeInsets.fromLTRB(20, 190, 20, 0),
//            color: Colors.blue,
//            padding: EdgeInsets.all(10.0),
//            child: Column(
//              children: children
//                  .map((w) => Container(child: w, padding: EdgeInsets.all(2.0)))
//                  .toList(),
//            ),
//          ),
        ),
        Text(
          "We Own It",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text("Wiz Khalifa, 2:30"),
        Container(
            child: Column(
              children: children
                  .map((w) => Container(child: w, padding: EdgeInsets.all(2.0)))
                  .toList(),
            ),
        ),
      ],
    );
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.black,
        inactiveColor: Colors.red,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 48.0,
      child: Container(
        width: 150,
        height: 45,
        child: RaisedButton(
          elevation: 10.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text(txt),
            color: Colors.redAccent.shade400,
            textColor: Colors.white,
            onPressed: onPressed),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget LocalAudio() {
    return _tab([

      slider(),
      _btn('Play', () => audioCache.play('ff5.mp3')),
      SizedBox(height: 10.0,),
      _btn('Pause', () => advancedPlayer.pause()),
      SizedBox(height: 10.0,),
      _btn('Stop', () => advancedPlayer.stop()),
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: (){}),
            IconButton(icon: Icon(Icons.library_music), onPressed: (){}),
          ],
          elevation: 1.0,
          backgroundColor: Colors.blue,
          title: Text("Audio Player"),
        ),
        body: TabBarView(
          children: [LocalAudio()],
        ),

      ),
    );
  }
}
