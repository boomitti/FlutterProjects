import 'dart:async';
import 'package:flutter/material.dart';

class DigitalClock extends StatefulWidget {
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    // Update the time every second
    Timer.periodic(Duration(seconds: 1), _updateTime);
  }

  void _updateTime(Timer timer) {
    setState(() {
      // Get the current time
      DateTime now = DateTime.now();
      // Format the time as HH:mm:ss
      _currentTime = "${now.hour}:${_twoDigits(now.minute)}:${_twoDigits(now.second)}";
    });
  }

  String _twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _currentTime,
          style: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}