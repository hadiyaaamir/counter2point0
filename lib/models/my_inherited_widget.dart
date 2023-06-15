import 'package:flutter/material.dart';

class MyInheritedWidget<T extends ChangeNotifier> extends InheritedWidget {
  final T listenable;

  const MyInheritedWidget({
    Key? key,
    required this.listenable,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant MyInheritedWidget<T> oldWidget) {
    return false;
  }
}
