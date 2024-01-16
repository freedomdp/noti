import 'package:flutter/material.dart';
import 'package:noti/styles/colors.dart';
import 'package:noti/styles/text_styles.dart';

class NotificationToggle extends StatefulWidget {
  const NotificationToggle({Key? key}) : super(key: key);

  @override
  NotificationToggleState createState() => NotificationToggleState();
}

class NotificationToggleState extends State<NotificationToggle> {
  bool isOneTimeActive = true; // Переменная для отслеживания активной кнопки

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.textColor,
      height: 78,
      child: Center(
        child: Container(
          width: 360,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              _buildToggleButton(
                text: 'One-time',
                icon: Icons.alarm,
                isActive: isOneTimeActive,
                onTap: () => _toggleActiveButton(true),
                margin: const EdgeInsets.only(left: 4), // Отступ слева для кнопки "One-time"
              ),
              _buildToggleButton(
                text: 'Recurring',
                icon: Icons.history, // Иконка для "Recurring"
                isActive: !isOneTimeActive,
                onTap: () => _toggleActiveButton(false),
                margin: const EdgeInsets.only(right: 4), // Отступ справа для кнопки "Recurring"
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton({
    required String text,
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
    required EdgeInsetsGeometry margin,
  }) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
        margin: margin,
        width: 176,
        height: 40,
        decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, color: isActive ? AppColors.backgroundColor : AppColors.textColor),
              const SizedBox(width: 6), // Отступ между иконкой и текстом
              Text(
                text,
                style: TextStyles.bodyBold.copyWith(
                  color: isActive ? AppColors.backgroundColor : AppColors.textColor,
                ),
              ),
            ],
          ),
        ),
    );
  }

  void _toggleActiveButton(bool isOneTime) {
    setState(() {
      isOneTimeActive = isOneTime;
    });
  }
}

