import 'package:flutter/material.dart';

class TapEvent extends StatefulWidget {

  @override
  _TapEventState createState() => _TapEventState();
}

class _TapEventState extends State<TapEvent> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("test::page2"),),
    );
  }
}