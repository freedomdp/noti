import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/styles/colors.dart';
import 'package:noti/styles/text_styles.dart';
import '../blocs/time_input_bloc.dart';
import '../blocs/time_input_event.dart';

class TimeInputField extends StatefulWidget {
  final List<TextEditingController> controllers;

  const TimeInputField({Key? key, required this.controllers}) : super(key: key);

  @override
  TimeInputFieldState createState() => TimeInputFieldState();
}

class TimeInputFieldState extends State<TimeInputField> {
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(4, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildSingleInputField(
            0,
            (value) =>
                value == null ||
                value.isEmpty ||
                int.tryParse(value) != null && int.parse(value) <= 2),
        _buildSingleInputField(1),
        Text(
          ':',
          style: TextStyles.h3.copyWith(
            color: AppColors.inactiveColor,
          ),
        ),
        _buildSingleInputField(2),
        _buildSingleInputField(3),
      ],
    );
  }

  Widget _buildSingleInputField(int index,
      [bool Function(String?)? validator]) {
    return Container(
      width: 44.0,
      height: 48.0,
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: AppColors.inputBorderColor),
      ),
      child: TextField(
        controller: widget.controllers[index],
        focusNode: focusNodes[index],
        onTap: () {
          if (widget.controllers[index].text.isNotEmpty) {
            widget.controllers[index].clear();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyles.bodyMedium,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12.0),
          counterText: "",
        ),
        maxLength: 1,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        inputFormatters: _getInputFormatters(index),
        onChanged: (value) {
          if (index == 0) {
            setState(
                () {}); // Обновление состояния для изменения правил ввода второго поля
          }
          if (value.length == 1 && index < widget.controllers.length - 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.length == 1 &&
              index == widget.controllers.length - 1) {
            FocusScope.of(context).unfocus(); // Скрываем клавиатуру
            _checkAllFieldsFilled();
          }
          _updateBlocState();
        },
      ),
    );
  }

  List<TextInputFormatter> _getInputFormatters(int index) {
    // Если это второе поле, то устанавливаем форматтер на основе значения первого поля
    if (index == 1) {
      final firstFieldValue = widget.controllers[0].text;
      if (firstFieldValue == '2') {
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-4]'))
        ]; // Только 0-4, если первое поле - '2'
      } else {
        return [
          FilteringTextInputFormatter.digitsOnly
        ]; // Любая цифра, если первое поле - '0' или '1'
      }
    } else if (index == 2) {
      return [
        FilteringTextInputFormatter.allow(RegExp(r'[0-5]'))
      ]; // Для третьего поля - только 0-5
    } else {
      return [
        FilteringTextInputFormatter.digitsOnly
      ]; // Для остальных полей - любые цифры
    }
  }

  void _updateBlocState() {
    String hour = widget.controllers[0].text + widget.controllers[1].text;
    String minute = widget.controllers[2].text + widget.controllers[3].text;
    BlocProvider.of<TimeInputBloc>(context).add(
      TimeChanged(hour: hour, minute: minute),
    );
  }

  void _checkAllFieldsFilled() {
    bool allFilled =
        widget.controllers.every((controller) => controller.text.length == 1);
    if (allFilled) {
      _updateBlocState();
    }
  }
}
