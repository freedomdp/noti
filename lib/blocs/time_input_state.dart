class TimeInputState {
  final String hour;
  final String minute;
  final bool isTimeValid;
  final bool showError; // Новое поле

  TimeInputState({
    required this.hour,
    required this.minute,
    this.isTimeValid = false,
    this.showError = false, // Инициализация поля
  });

  TimeInputState copyWith({
    String? hour,
    String? minute,
    bool? isTimeValid,
    bool? showError,
  }) {
    return TimeInputState(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      isTimeValid: isTimeValid ?? this.isTimeValid,
      showError: showError ?? this.showError,
    );
  }
}
