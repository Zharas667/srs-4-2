import 'package:flutter/material.dart';
import 'package:navigation/pushnamedpage.dart';
import 'package:navigation/pushpage.dart';
import 'package:navigation/pushreplacementpage.dart';
import 'package:navigation/removeuntilpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/remove': (context) => RemoveUntilPage(),
        '/named': (context) => PushNamedPage(),
      },
      home: Navigation(),
    );
  }
}

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigationButton('Push', () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PushPage()));
            }),
            NavigationButton('Pop', () {
              Navigator.pop(context);
            }),
            NavigationButton('Replace', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PushReplacementPage()),
              );
            }),
            NavigationButton('Named', () {
              Navigator.pushNamed(context, '/named');
            }),
            NavigationButton('Remove', () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/remove',
                (route) => false,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  NavigationButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(text),
    );
  }
}
