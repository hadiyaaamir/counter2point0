part of 'model.dart';

class ThemeInherited extends InheritedWidget {
  final ThemeController listenable;

  const ThemeInherited({
    super.key,
    required this.listenable,
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
    print('update should notifier called');

    print('darkmode old: ${oldWidget.listenable.theme.isDarkMode}');
    print('darkmode new: ${listenable.theme.isDarkMode}');
    return true;
    // return listenable.themeMode != oldWidget.listenable.themeMode;
  }
}
