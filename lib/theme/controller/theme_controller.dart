part of 'controller.dart';

class ThemeController extends ChangeNotifier {
  AppTheme get theme => isDarkMode ? AppTheme.dark() : AppTheme.light();

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  toggleMode() {
    isDarkMode ? _themeMode = ThemeMode.light : _themeMode = ThemeMode.dark;
    notifyListeners();
  }
}
