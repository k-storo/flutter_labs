import 'package:flutter/material.dart';

class MyWorkInProgress extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => MyWorkInProgress(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oops"),
      ),
      body: Center(
        child: Text("Work in progress"),
      ),
    );
  }
}
