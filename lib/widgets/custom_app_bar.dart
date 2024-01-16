import 'package:flutter/material.dart';
import 'package:noti/styles/colors.dart';
import 'package:noti/styles/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;

  CustomAppBar({Key? key, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.textColor,
      centerTitle: true,
      title: Text(
        titleText,
        style: TextStyles.bodyBold.copyWith(
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
