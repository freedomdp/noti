import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/blocs/time_input_event.dart';
import 'package:noti/blocs/time_input_state.dart';


class TimeInputBloc extends Bloc<TimeInputEvent, TimeInputState> {
  TimeInputBloc() : super(TimeInputState(hour: '', minute: '', isTimeValid: false));

  @override
  Stream<TimeInputState> mapEventToState(TimeInputEvent event) async* {
    if (event is TimeChanged) {
      bool isFilled = event.hour.length == 2 && event.minute.length == 2;
      yield state.copyWith(
        hour: event.hour,
        minute: event.minute,
        isTimeValid: isFilled,
        showError: false, // Сбросить showError при любом изменении времени
      );
    } else if (event is ShowErrorEvent) {
      yield state.copyWith(showError: event.showError);
    }
  }
}
