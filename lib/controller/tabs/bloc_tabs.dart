import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shimoa/controller/tabs/event_tabs.dart';
import 'package:shimoa/controller/tabs/state_tabs.dart';

@injectable
class BlocTabs extends Bloc<EventTabs, StateTabs> {
  static BlocTabs get(context) => BlocProvider.of(context);
  BlocTabs(super.initialState);

  chageTabs(int selected) {
    emit(state.copyWith(index: selected));
  }
}
