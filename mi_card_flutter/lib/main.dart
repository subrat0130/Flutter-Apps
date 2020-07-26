import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/871695364574908417/BWyy18aZ.jpg'),
              ),
              Text(
                'Subrat Singhal',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'NOOB DEVELOPER',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 25.0,
                  color: Colors.teal[100],
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  color: Colors.white,
                  thickness: 1.5,
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.00, 5.0, 5.00, 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 25.0,
                      color: Colors.teal.shade500,
                    ),
                    title: Text(
                      '+91 7091360038',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 17.50,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 25.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      size: 25.0,
                      color: Colors.teal.shade500,
                    ),
                    title: Text(
                      'subrat.singhal0130@gmail.com',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
