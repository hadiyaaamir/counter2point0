part of 'model.dart';

class ThemeInherited extends MyInheritedWidget<ThemeController> {
  const ThemeInherited({
    super.key,
    required ThemeController listenable,
    required Widget child,
  }) : super(listenable: listenable, child: child);

  static ThemeInherited of(BuildContext context) {
    final ThemeInherited? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<ThemeInherited>();
    assert(inheritedWidget != null, 'No MyListenableWidget found in context');
    return inheritedWidget!;
  }
}
