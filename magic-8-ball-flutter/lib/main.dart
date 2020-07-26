import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: Colors.blue.shade900,
            title: Text(
              'Ask Me Anything',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: magicball(),
        ),
      ),
    );

class magicball extends StatefulWidget {
  @override
  _magicballState createState() => _magicballState();
}

class _magicballState extends State<magicball> {
  int buttonPressed = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  buttonPressed = Random().nextInt(5) + 1;
                });
              },
              child: Image.asset(
                'images/ball$buttonPressed.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
