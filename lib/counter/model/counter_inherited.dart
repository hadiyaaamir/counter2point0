part of 'model.dart';

class CounterInherited extends InheritedWidget {
  final CounterController listenable;

  const CounterInherited({
    super.key,
    required this.listenable,
    required Widget child,
  }) : super(child: child);

  static CounterInherited of(BuildContext context) {
    final CounterInherited? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<CounterInherited>();
    assert(inheritedWidget != null, 'No MyListenableWidget found in context');
    return inheritedWidget!;
  }

  @override
  bool updateShouldNotify(CounterInherited oldWidget) {
    print('counter old: ${oldWidget.listenable.counter.counter}');
    print('counter new: ${listenable.counter.counter}');

    return true;
    // return listenable.counter != oldWidget.listenable.counter;
  }
}
