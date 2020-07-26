import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  int playButton;
  void playNow(int playButton) {
    final player = AudioCache();
    player.play('note$playButton.wav');
  }

  int buttonNum;
  Expanded myButton(MaterialColor myColor, int buttonNum) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playNow(buttonNum);
        },
        color: myColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.black,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text(
                              'Xylophone',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  myButton(Colors.purple, 1),
                  myButton(Colors.indigo, 2),
                  myButton(Colors.blue, 3),
                  myButton(Colors.green, 4),
                  myButton(Colors.yellow, 5),
                  myButton(Colors.orange, 6),
                  myButton(Colors.red, 7),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
