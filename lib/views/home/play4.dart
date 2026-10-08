import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';

class Play4View extends StatefulWidget {
  const Play4View({super.key});

  @override
  State<Play4View> createState() => _Play4ViewState();
}

class _Play4ViewState extends State<Play4View> {
  int count = prefs.getInt("counter")??1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                count--;
                prefs.setInt("counter", count);
                setState(() {});
              },
              icon: Icon(Icons.remove),
            ),
            Text("$count", style: TextStyle(fontSize: 30)),
            IconButton(
              onPressed: () {
                count++;
                prefs.setInt("counter", count);
                setState(() {});
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
