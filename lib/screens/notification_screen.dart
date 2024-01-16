import 'package:flutter/material.dart';
import 'package:noti/screens/add_notification_screen.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/notification_toggle.dart';
import 'package:noti/widgets/custom_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Notification'),
      body: Stack(
        children: [
          const NotificationToggle(), // Добавьте новый виджет
          CustomButton(
            text: 'Add new notification',
            icon: Icons.add_circle, // Иконка с знаком плюс в круге
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddNotificationScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
