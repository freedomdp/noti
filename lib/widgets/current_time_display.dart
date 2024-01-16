import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noti/styles/text_styles.dart';

class CurrentTimeDisplay extends StatefulWidget {
  const CurrentTimeDisplay({Key? key}) : super(key: key);

  @override
  CurrentTimeDisplayState createState() => CurrentTimeDisplayState();

  static String getCurrentTime() {
    final now = DateTime.now();
    return DateFormat('HH:mm').format(now); // Отображение времени включая секунды
  }
}

class CurrentTimeDisplayState extends State<CurrentTimeDisplay> {
  String _timeString = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timeString = _formatCurrentTime();
    // Изменение интервала таймера на 1 секунду
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime = _formatCurrentTime();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatCurrentTime() {
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm'); // Форматирование времени с секундами
    return formatter.format(now);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: TextStyles.h3,
      textAlign: TextAlign.center,
    );
  }
}
