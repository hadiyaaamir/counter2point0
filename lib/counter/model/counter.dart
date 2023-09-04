part of 'model.dart';

@immutable
class Counter {
  final int counter;
  final bool editing;

  const Counter({
    required this.counter,
    required this.editing,
  });

  Counter copyWith({
    int? counter,
    bool? editing,
  }) {
    return Counter(
      counter: counter ?? this.counter,
      editing: editing ?? this.editing,
    );
  }

  Counter setCounter(int value) => copyWith(counter: value);

  Counter increment() {
    if (counter < kMaxValue) {
      return copyWith(
        counter: counter + 1,
      );
    }
    return this;
  }

  Counter decrement() {
    if (counter > kMinValue) {
      return copyWith(
        counter: counter - 1,
      );
    }
    return this;
  }

  Counter reset() {
    int resetVal = kMinValue <= 0 ? 0 : kMinValue;
    return copyWith(counter: resetVal);
  }

  Counter setCounterAndExitEdit(int value) =>
      copyWith(counter: value, editing: false);

  Counter toggleEditing() => copyWith(editing: !editing);
  Counter setEditing(bool edit) => copyWith(editing: edit);

  bool isMaxValue() => counter == kMaxValue;
  bool isMinValue() => counter == kMinValue;
}
