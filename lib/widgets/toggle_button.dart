import 'package:flutter/material.dart';
import 'package:noti/styles/colors.dart';
import 'package:noti/styles/text_styles.dart';

class ToggleButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final VoidCallback onPressed;

  const ToggleButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0), // Отступ вокруг кнопки
        child: ElevatedButton.icon(
          icon: Icon(icon, color: isActive ? AppColors.backgroundColor : AppColors.textColor),
          label: Text(
            text,
            style: TextStyles.bodyBold.copyWith(
              color: isActive ? AppColors.backgroundColor : AppColors.textColor,
            ),
          ),
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isActive ? AppColors.primaryColor : AppColors.backgroundColor,
            minimumSize: const Size(double.infinity, 40), // Минимальная высота 40
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
