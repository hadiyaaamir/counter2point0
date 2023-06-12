part of 'model.dart';

@immutable
class Counter {
  final int counter;
  final bool editing;

  final double fontSize;
  final int color;

  const Counter({
    required this.counter,
    required this.editing,
    this.fontSize = 10,
    this.color = 0,
  });

  Counter copyWith({
    int? counter,
    bool? editing,
    double? fontSize,
    int? color,
  }) {
    return Counter(
      counter: counter ?? this.counter,
      editing: editing ?? this.editing,
      fontSize: fontSize ?? this.fontSize,
      color: color ?? this.color,
    );
  }

  Counter setCounter(int value) => copyWith(
        counter: value,
        fontSize: CounterController().getFontSize(value),
        color: CounterController().getColor(value),
      );

  Counter increment() {
    if (counter < kMaxValue) {
      return copyWith(
        counter: counter + 1,
        fontSize: CounterController().getFontSize(counter + 1),
        color: CounterController().getColor(counter + 1),
      );
    }
    return this;
  }

  Counter decrement() {
    if (counter > kMinValue) {
      return copyWith(
        counter: counter - 1,
        fontSize: CounterController().getFontSize(counter - 1),
        color: CounterController().getColor(counter - 1),
      );
    }
    return this;
  }

  Counter reset() {
    int resetVal = kMinValue <= 0 ? 0 : kMinValue;
    return copyWith(
      counter: resetVal,
      fontSize: CounterController().getFontSize(resetVal),
      color: CounterController().getColor(resetVal),
    );
  }

  Counter setCounterAndExitEdit(int value) => copyWith(
        counter: value,
        editing: false,
        fontSize: CounterController().getFontSize(value),
        color: CounterController().getColor(value),
      );

  Counter toggleEditing() => copyWith(editing: !editing);
  Counter setEditing(bool edit) => copyWith(editing: edit);

  Counter setFontSize(double font) => copyWith(fontSize: font);
  Counter setColor(int color) => copyWith(color: color);

  bool isMaxValue() => counter == kMaxValue;
  bool isMinValue() => counter == kMinValue;
}
