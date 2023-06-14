part of 'controller.dart';

class CounterController extends ChangeNotifier {
  Counter _counter = const Counter(
    counter: 0,
    editing: false,
  );
  Counter get counter => _counter;

  Counter _oldCounter = const Counter(
    counter: 0,
    editing: false,
  );
  // Counter get oldCounter => _oldCounter;

  set counter(Counter c) {
    _oldCounter = _counter;
    _counter = c;
    notifyListeners();
  }

  bool get stateChanged => _counter != _oldCounter;

  isValueValid(var value) {
    if (value == null || !RegExp(r'^-?\d+$').hasMatch(value)) {
      return "Value must be an integer";
    } else if (int.parse(value) > kMaxValue) {
      return "Value must be less than $kMaxValue";
    } else if (int.parse(value) < kMinValue) {
      return "Value must be greater than $kMinValue";
    }
    return null;
  }
}
