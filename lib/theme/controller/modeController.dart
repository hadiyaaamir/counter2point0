part of 'controller.dart';

class ThemeController extends ChangeNotifier {
  // ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  bool _isDarkMode =
      WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
  bool get isDarkMode => _isDarkMode;

  toggleMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
