import 'package:flutter/material.dart';
import 'package:task1/pages/audio2.dart';
import 'package:task1/pages/video_pages_assets.dart';
import 'package:task1/pages/video_pages_network.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashBoard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.library_music), onPressed: (){}),
            IconButton(icon: Icon(Icons.person), onPressed: (){}),
          ],
          title: Text(
            'Hybrid Multi Player',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.black,
          margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LocalAudio(),
                          ),
                        );
                      },
                      child: Text(
                        'Audio Player',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(height: 20.0, thickness: 10.0, color: Colors.white70,),

              Column(
                children: <Widget>[
                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerAssets(),
                          ),
                        );
                      },

                      child: Text(
                        'Video Player Offline',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                  ),
                ],
              ),

              Divider(height: 20.0, thickness: 10.0, color: Colors.white70,),

              Column(
                children: <Widget>[
                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerNetworks(),
                          ),
                        );
                      },
                      child: Text(
                        'Video Player Online',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

