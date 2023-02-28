import 'package:flutter/material.dart';
import 'add_event_screen.dart';
import 'volunteering_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volunteering App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddEventScreen(),
    );
  }
}


