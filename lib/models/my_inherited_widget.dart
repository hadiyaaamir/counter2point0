import 'package:flutter/material.dart';

class MyInheritedWidget<T extends ChangeNotifier> extends InheritedWidget {
  final T listenable;

  const MyInheritedWidget({
    Key? key,
    required this.listenable,
    required Widget child,
  }) : super(key: key, child: child);

  static MyInheritedWidget<T> of<T extends ChangeNotifier>(
      BuildContext context) {
    final MyInheritedWidget<T>? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<MyInheritedWidget<T>>();
    assert(inheritedWidget != null, 'No MyInheritedWidget found in context');
    return inheritedWidget!;
  }

  @override
  bool updateShouldNotify(covariant MyInheritedWidget<T> oldWidget) {
    return false;
  }
}
