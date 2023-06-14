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

  toggleMode(int counterValue) {
    _theme = (_theme.toggleTheme()).setTextStyle(counterValue);
    notifyListeners();
  }

  updateCounterTextStyle(int counterValue) {
    print('update counter text style called');
    _theme = _theme.setTextStyle(counterValue);
    notifyListeners();
  }
}
