import 'package:flutter/material.dart';

class PushPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push and Pop'),
      ),
      body: Center(
        child: Text('Its Push & Pop navigations'),
      ),
    );
  }
}
