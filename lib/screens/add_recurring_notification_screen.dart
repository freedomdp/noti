import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class AddRecurringNotificationScreen extends StatelessWidget {
  final String title;

  const AddRecurringNotificationScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: title),
      body: Center(
        child: Text('Add recurring notification content goes here'),
      ),
    );
  }
}
