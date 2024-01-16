import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';

class ErrorSnackbar extends StatelessWidget {
  final String message;

  const ErrorSnackbar({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.errorBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.error_outline, color: AppColors.errorColor),
          const SizedBox(width: 8),
          Text(
            message,
            style: TextStyles.errorText.copyWith(
              color: AppColors.errorColor,
            ),
          ),
        ],
      ),
    );
  }
}
