class StateTabs {
  int index = 0;
  StateTabs({required this.index});

  StateTabs copyWith({int index = 0}) {
    return StateTabs(index: index ?? index);
  }
}

class StateInitTabs extends StateTabs {
  StateInitTabs() : super(index: 0);
}
