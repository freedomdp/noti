import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NotificationEvent {}

class ToggleRecurringEvent extends NotificationEvent {}

class NotificationState {
  final bool isRecurringActive;

  NotificationState({required this.isRecurringActive});
}

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState(isRecurringActive: false));

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is ToggleRecurringEvent) {
      yield NotificationState(isRecurringActive: !state.isRecurringActive);
    }
  }
}
