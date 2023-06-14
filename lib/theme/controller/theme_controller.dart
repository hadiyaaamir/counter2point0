part of 'controller.dart';

class ThemeController extends ChangeNotifier {
  AppTheme _theme = const AppTheme(
    themeMode: ThemeMode.system,
    textStyle: TextStyle(),
  );
  AppTheme get theme => _theme;

  toggleMode() {
    _theme = _theme.toggleTheme();
    notifyListeners();
  }
}
