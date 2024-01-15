import 'package:flutter/material.dart';
import 'package:noti/styles/text_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Log In', style: TextStyles.displayLarge, textAlign: TextAlign.center),
        SizedBox(height: 16),
        Text(
          'Enter current time in hh:mm format',
          style: TextStyles.subtitle, // Используем новый стиль
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
