import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class AddNotificationScreen extends StatelessWidget {
  const AddNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Add New Notification'),
      body: Center(
        child: Text('Content for adding a new notification goes here'),
        // Здесь будет содержимое страницы для добавления нового уведомления
      ),
    );
  }
}
