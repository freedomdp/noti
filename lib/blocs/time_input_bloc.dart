import 'package:flutter_bloc/flutter_bloc.dart';
import 'time_input_event.dart';

class TimeInputBloc extends Bloc<TimeInputEvent, bool> {
  TimeInputBloc() : super(false);

  @override
  Stream<bool> mapEventToState(TimeInputEvent event) async* {
    if (event is TimeChanged) {
      bool isFilled = event.hour.length == 2 && event.minute.length == 2;
      yield isFilled;
    }
  }
}

