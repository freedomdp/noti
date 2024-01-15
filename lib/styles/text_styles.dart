import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  static const TextStyle displayLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textColor,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle notificationText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
    height: 1.5,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.subtitleColor,
    height: 1.5,
  );
}
