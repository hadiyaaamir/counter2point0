part of 'controller.dart';

class ThemeController extends ChangeNotifier {
  static final ThemeController _singleton = ThemeController._internal();

  factory ThemeController() {
    return _singleton;
  }

  ThemeController._internal();

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  ThemeData get themeData {
    return isDarkMode
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          );
  }

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  toggleMode() {
    isDarkMode ? _themeMode = ThemeMode.light : _themeMode = ThemeMode.dark;

    notifyListeners();
  }
}
