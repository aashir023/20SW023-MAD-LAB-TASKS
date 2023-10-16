import 'package:flutter/material.dart';

class DisplayData extends StatefulWidget {
  DisplayData({super.key, required this.email, required this.dob});

  String email, dob;

  State<DisplayData> createState() => DisplayDataState();
}

class DisplayDataState extends State<DisplayData> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            // color: ,
            child: Column(
              children: [
                Text(widget.email.toString()),
                Text(widget.dob.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
