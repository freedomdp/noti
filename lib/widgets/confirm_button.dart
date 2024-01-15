import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/styles/colors.dart';

import '../blocs/time_input_bloc.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeInputBloc, bool>(
      builder: (context, isButtonEnabled) {
        return ElevatedButton(
          onPressed: isButtonEnabled ? () => _onConfirmPressed(context) : null,
          style: ElevatedButton.styleFrom(
            primary: isButtonEnabled ? AppColors.primaryColor : AppColors.inactiveColor,
            onPrimary: Colors.white,
            minimumSize: const Size(360, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text(
            'Confirm',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  void _onConfirmPressed(BuildContext context) {
    // Здесь реализуйте логику, которая должна выполняться при нажатии на кнопку
  }
}
