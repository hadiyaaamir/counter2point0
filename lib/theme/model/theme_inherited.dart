part of 'model.dart';

class ThemeInherited extends InheritedWidget {
  final ThemeController listenable;
  final bool changed;

  const ThemeInherited({
    super.key,
    required this.listenable,
    required this.changed,
    required Widget child,
  }) : super(child: child);

  static ThemeInherited of(BuildContext context) {
    final ThemeInherited? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<ThemeInherited>();
    assert(inheritedWidget != null, 'No MyListenableWidget found in context');
    return inheritedWidget!;
  }

  @override
  bool updateShouldNotify(ThemeInherited oldWidget) {
    print('theme should update? ${changed != oldWidget.changed}');
    return changed != oldWidget.changed;
  }
}
