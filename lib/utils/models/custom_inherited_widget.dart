part of 'models.dart';

class CustomInheritedWidget<T extends ChangeNotifier> extends InheritedWidget {
  final T listenable;

  const CustomInheritedWidget({
    Key? key,
    required this.listenable,
    required Widget child,
  }) : super(key: key, child: child);

  static CustomInheritedWidget<T> of<T extends ChangeNotifier>(
      BuildContext context) {
    final CustomInheritedWidget<T>? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<CustomInheritedWidget<T>>();
    assert(inheritedWidget != null, 'No MyInheritedWidget found in context');
    return inheritedWidget!;
  }

  @override
  bool updateShouldNotify(covariant CustomInheritedWidget<T> oldWidget) {
    return false;
  }
}
