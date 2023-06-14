part of 'controller.dart';

class ThemeController extends ChangeNotifier {
  ThemeController({required this.counterValue}) {
    _theme = _theme.setTextStyle(counterValue);
  }

  int counterValue;

  AppTheme _theme = const AppTheme(
    themeMode: ThemeMode.system,
    counterTheme: CounterTheme(counterTextStyle: TextStyle()),
  );
  AppTheme get theme => _theme;

  AppTheme _oldTheme = const AppTheme(
    themeMode: ThemeMode.system,
    counterTheme: CounterTheme(counterTextStyle: TextStyle()),
  );

  bool get stateChanged => _theme != _oldTheme;

  toggleMode(int counterValue) {
    _oldTheme = _theme;
    _theme = (_theme.toggleTheme()).setTextStyle(counterValue);
    notifyListeners();
  }

  updateCounterTextStyle(int counterValue) {
    _theme = _theme.setTextStyle(counterValue);
    notifyListeners();
  }
}
