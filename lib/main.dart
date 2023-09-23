import 'package:calendar_expt/tableCalendarExample.dart';
import 'package:flutter/material.dart';

import 'eventExample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: EventExample(),
      ),
    );
  }
}
