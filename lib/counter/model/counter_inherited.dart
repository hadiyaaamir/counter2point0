part of 'model.dart';

class CounterInherited extends MyInheritedWidget<CounterController> {
  const CounterInherited({
    super.key,
    required CounterController listenable,
    required Widget child,
  }) : super(listenable: listenable, child: child);

  static CounterInherited of(BuildContext context) {
    final CounterInherited? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<CounterInherited>();
    assert(inheritedWidget != null, 'No MyListenableWidget found in context');
    return inheritedWidget!;
  }
}
