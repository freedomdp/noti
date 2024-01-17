import 'package:flutter/material.dart';
import 'package:noti/styles/colors.dart';
import 'package:noti/styles/text_styles.dart';

class RecurringListItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const RecurringListItem({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.secondaryBackgroundColor, // Фон виджета
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity, // Ширина во всю ширину экрана
          height: 56.0, // Высота 56px
          padding: const EdgeInsets.all(16.0), // Отступ со всех сторон 16px
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyles.bodyBold.copyWith(
                  color: AppColors.textColor, // Цвет текста
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios, // Иконка стрелка вправо
                color: AppColors.primaryColor, // Цвет иконки
                size: 19.0, // Размер иконки
              ),
            ],
          ),
        ),
      ),
    );
  }
}
