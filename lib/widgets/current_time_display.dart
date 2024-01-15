import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noti/styles/text_styles.dart';

class CurrentTimeDisplay extends StatefulWidget {
  const CurrentTimeDisplay({Key? key}) : super(key: key);

  @override
  CurrentTimeDisplayState createState() => CurrentTimeDisplayState();
}

class CurrentTimeDisplayState extends State<CurrentTimeDisplay> {
  String _timeString = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timeString = _formatCurrentTime();
    _timer = Timer.periodic(const Duration(minutes: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime = _formatCurrentTime();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatCurrentTime() {
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm');
    return formatter.format(now);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: TextStyles.h3, // Применение стиля H3
      textAlign: TextAlign.center,
    );
  }
}