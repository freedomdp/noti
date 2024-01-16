import 'package:flutter/material.dart';
import 'package:noti/styles/colors.dart';
import 'package:noti/styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final TextStyle textStyle;
  final EdgeInsetsGeometry margin;

  const CustomButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryColor,
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.bold, // Эквивалент для bodyBold
      color: AppColors.backgroundColor,
    ),
    this.margin = const EdgeInsets.only(left: 16, right: 16, bottom: 20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: margin,
      child: ElevatedButton.icon(
        icon: Icon(icon, color: textStyle.color),
        label: Text(text, style: textStyle),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          onPrimary: textStyle.color,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
