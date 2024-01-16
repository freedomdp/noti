import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/blocs/time_input_bloc.dart';
import 'package:noti/blocs/time_input_state.dart';
import 'package:noti/styles/colors.dart';
import 'package:noti/widgets/current_time_display.dart';

import '../blocs/time_input_event.dart';
import '../screens/notification_screen.dart';
import '../styles/text_styles.dart';

class ConfirmButton extends StatelessWidget {
  final List<TextEditingController> timeControllers;

  const ConfirmButton({Key? key, required this.timeControllers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeInputBloc, TimeInputState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 50), // Отступ снизу
          child: ElevatedButton(
            onPressed: state.isTimeValid
                ? () => _onConfirmPressed(context, state)
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: state.isTimeValid
                  ? AppColors.primaryColor
                  : AppColors.inactiveColor,
              foregroundColor: Colors.white,
              minimumSize: const Size(360, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Confirm',
              style: TextStyles.bodyBold.copyWith(
                color: AppColors.backgroundColor,
              ),
            ),
          ),
        );
      },
    );
  }

  void _onConfirmPressed(BuildContext context, TimeInputState state) {
    String currentTime = CurrentTimeDisplay.getCurrentTime();
    String enteredTime = "${state.hour}:${state.minute}";
    if (currentTime == enteredTime) {
// Переход на страницу Notification
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const NotificationScreen()));
    } else {
// Показать сообщение об ошибке, используя ShowErrorEvent
      context.read<TimeInputBloc>().add(ShowErrorEvent(true));
    }
  }
}
