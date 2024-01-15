import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/blocs/time_input_bloc.dart';
import 'package:noti/widgets/confirm_button.dart';
import 'package:noti/widgets/current_time_display.dart';
import 'package:noti/widgets/login_header.dart';
import 'package:noti/widgets/time_input_field.dart';

import '../styles/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final List<TextEditingController> _timeControllers = List.generate(
      4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimeInputBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log In'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginHeader(),
              const SizedBox(height: 42),
              const CurrentTimeDisplay(),
              const SizedBox(height: 42),
              TimeInputField(controllers: _timeControllers),
              const SizedBox(height: 42),
              const ConfirmButton(), // Использование виджета ConfirmButton
            ],
          ),
        ),
      ),
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeInputBloc, bool>(
      builder: (context, isButtonEnabled) {
        return ElevatedButton(
          onPressed: isButtonEnabled ? () => _onConfirmPressed(context) : null,
          style: ElevatedButton.styleFrom(
            primary: isButtonEnabled ? AppColors.primaryColor : Colors.grey,
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
