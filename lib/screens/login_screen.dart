import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/blocs/time_input_bloc.dart';
import 'package:noti/widgets/confirm_button.dart';
import 'package:noti/widgets/current_time_display.dart';
import 'package:noti/widgets/login_header.dart';
import 'package:noti/widgets/time_input_field.dart';
import 'package:noti/widgets/custom_app_bar.dart';
import 'package:noti/widgets/error_snackbar.dart';

import '../blocs/time_input_state.dart'; // Добавление импорта для виджета сообщения об ошибке

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final List<TextEditingController> _timeControllers =
      List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimeInputBloc(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Log In'),
        resizeToAvoidBottomInset: false, // Отключение изменения размера экрана
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 72),
                  // Отступ от AppBar
                  const LoginHeader(),
                  const SizedBox(height: 42),
                  const CurrentTimeDisplay(),
                  const SizedBox(height: 42),
                  TimeInputField(controllers: _timeControllers),
                  const SizedBox(height: 120),
                  // Увеличение отступа для компенсации места под кнопкой
                ],
              ),
            ),
            BlocBuilder<TimeInputBloc, TimeInputState>(
              builder: (context, state) {
                return state.showError
                    ? const Positioned(
                        bottom: 122,
                        child: ErrorSnackbar(
                            message:
                                'The time is wrong. Try again.'), // Отображение ошибки
                      )
                    : const SizedBox
                        .shrink(); // Ничего не показывать, если нет ошибки
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: ConfirmButton(timeControllers: _timeControllers),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
