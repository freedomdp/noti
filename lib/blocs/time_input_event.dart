abstract class TimeInputEvent {}

class TimeChanged extends TimeInputEvent {
  final String hour;
  final String minute;

  TimeChanged({required this.hour, required this.minute});
}

class ShowErrorEvent extends TimeInputEvent {
  final bool showError;

  ShowErrorEvent(this.showError);
}
