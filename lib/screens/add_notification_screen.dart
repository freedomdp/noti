import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class AddNotificationScreen extends StatelessWidget {
  const AddNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Add New Notification'),
      body: const Center(
        child: Text('Here you can add a new notification.'),
      ),
    );
  }
}
