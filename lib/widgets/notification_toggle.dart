import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/widgets/toggle_button.dart';
import 'package:noti/styles/colors.dart';

import '../blocs/notification_bloc.dart';

class NotificationToggle extends StatelessWidget {
  const NotificationToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return Container(
          color: AppColors.textColor, // Установка фона для всего блока
          child: Center(
            child: Container(
              width: 360,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor, // Фон внутреннего контейнера
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleButton(
                    text: 'One-time',
                    icon: Icons.alarm,
                    isActive: !state.isRecurringActive,
                    onPressed: () {
                      if (state.isRecurringActive) {
                        context
                            .read<NotificationBloc>()
                            .add(ToggleRecurringEvent());
                      }
                    },
                  ),
                  ToggleButton(
                    text: 'Recurring',
                    icon: Icons.repeat,
                    isActive: state.isRecurringActive,
                    onPressed: () {
                      if (!state.isRecurringActive) {
                        context
                            .read<NotificationBloc>()
                            .add(ToggleRecurringEvent());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
