import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/screens/add_notification_screen.dart';
import 'package:noti/screens/add_recurring_notification_screen.dart';
import '../blocs/notification_bloc.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/notification_toggle.dart';
import '../widgets/recurring_list_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationBloc>(
      create: (context) => NotificationBloc(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Notification'),
        body: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            return Column(
              children: [
                const NotificationToggle(),
                const SizedBox(height: 16),
                // Добавляем отступ ниже NotificationToggle
                Expanded(
                  child: state.isRecurringActive
                      ? ListView(
                          children: [
                            RecurringListItem(
                              text: '1 Minute',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddRecurringNotificationScreen(
                                            title: '1 Minute'),
                                  ),
                                );
                              },
                            ),
                            RecurringListItem(
                              text: '3 Minute',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddRecurringNotificationScreen(
                                            title: '3 Minute'),
                                  ),
                                );
                              },
                            ),
                            RecurringListItem(
                              text: '5 Minute',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddRecurringNotificationScreen(
                                            title: '5 Minute'),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomButton(
                            text: 'Add new notification',
                            icon: Icons.add_circle,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddNotificationScreen()),
                              );
                            },
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
