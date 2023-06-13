part of 'controller.dart';

class ThemeController extends ChangeNotifier {
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
    print('mode toggle to $_themeMode');
    notifyListeners();
  }
}
