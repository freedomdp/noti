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
  _TimeInputFieldState createState() => _TimeInputFieldState();
}

class _TimeInputFieldState extends State<TimeInputField> {
  late List<FocusNode> _focusNodes; // Правильное объявление

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(4, (_) => FocusNode());
  }

  @override
  void dispose() {
    _focusNodes.forEach((node) => node.dispose());
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
        const Text(':', style: TextStyles.bodyMedium),
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
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyles.bodyMedium,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12.0),
          counterText: "", // Убираем символы 0 и 1
        ),
        maxLength: 1,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        inputFormatters: [
          validator != null ? FilteringTextInputFormatter.allow(
              RegExp(r'[0-2]')) : FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
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

  void _updateBlocState() {
    String hour = widget.controllers[0].text + widget.controllers[1].text;
    String minute = widget.controllers[2].text + widget.controllers[3].text;
    BlocProvider.of<TimeInputBloc>(context).add(
      TimeChanged(hour: hour, minute: minute),
    );
  }

  void _checkAllFieldsFilled() {
    bool allFilled = widget.controllers.every((controller) => controller.text.length == 1);
    if (allFilled) {
      _updateBlocState();
    }
  }
}