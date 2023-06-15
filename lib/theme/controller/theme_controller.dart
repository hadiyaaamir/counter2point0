part of 'controller.dart';

class ThemeController extends ChangeNotifier {
  ThemeController() {
    _theme = _theme.setTextStyle(0);
  }

  AppTheme _theme = const AppTheme(
    themeMode: ThemeMode.system,
    counterTheme: CounterTheme(counterTextStyle: TextStyle()),
  );
  AppTheme get theme => _theme;

  toggleMode(int counterValue) {
    _theme = (_theme.toggleTheme()).setTextStyle(counterValue);
    notifyListeners();
  }

  updateCounterTextStyle(int counterValue) {
    _theme = _theme.setTextStyle(counterValue);
    notifyListeners();
  }
}
