import 'package:flutter/material.dart';

class MyClickedButton extends StatefulWidget {
  MyClickedButton({Key key, this.onPressed}) : super(key: key);

  // allow the widget that renders this widget to pass
  // in a callback for when the button is pressed
  final Function() onPressed;

  @override
  MyClickedButtonState createState() => MyClickedButtonState();
}

class MyClickedButtonState extends State<MyClickedButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: pressed ? Icon(Icons.monetization_on) : Icon(Icons.military_tech),
      label: pressed ? Text('ОФОРМИТЬ ПРЕМИУМ') : Text('ПРЕМИУМ ПОЛЬЗОВАТЕЛЬ'),
      backgroundColor: pressed ? Colors.orangeAccent : Colors.green,
      onPressed: () {
        setState(() => {pressed = !pressed});
        // call the callback that was passed in from the parent widget
        widget.onPressed();
      },
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
    );
  }
}
