part of 'model.dart';

@immutable
class Counter {
  final int counter;
  final bool editing;

  final int min;
  final int max;

  // final double fontSize;
  final double maxFont;
  final double minFont;

  final double fontSize;
  final int color;

  const Counter({
    required this.counter,
    required this.editing,
    required this.min,
    required this.max,
    required this.maxFont,
    required this.minFont,
    this.fontSize = 10,
    this.color = 0,
  });

  Counter copyWith({
    int? counter,
    bool? editing,
    int? min,
    int? max,
    double? maxFont,
    double? minFont,
    double? fontSize,
    int? color,
  }) {
    return Counter(
      counter: counter ?? this.counter,
      editing: editing ?? this.editing,
      min: min ?? this.min,
      max: max ?? this.max,
      maxFont: maxFont ?? this.maxFont,
      minFont: minFont ?? this.minFont,
      fontSize: fontSize ?? this.fontSize,
      color: color ?? this.color,
    );
  }

  Counter setCounter(int value) => copyWith(
        counter: value,
        fontSize: CounterController().getFontSize(value, this),
        color: CounterController().getColor(value, this),
      );

  Counter increment() {
    if (counter < max) {
      return copyWith(
        counter: counter + 1,
        fontSize: CounterController().getFontSize(counter + 1, this),
        color: CounterController().getColor(counter + 1, this),
      );
    }
    return this;
  }

  Counter decrement() {
    if (counter > min) {
      return copyWith(
        counter: counter - 1,
        fontSize: CounterController().getFontSize(counter - 1, this),
        color: CounterController().getColor(counter - 1, this),
      );
    }
    return this;
  }

  Counter reset() {
    int resetVal = min <= 0 ? 0 : min;
    return copyWith(
      counter: resetVal,
      fontSize: CounterController().getFontSize(resetVal, this),
      color: CounterController().getColor(resetVal, this),
    );
  }

  Counter setCounterAndExitEdit(int value) => copyWith(
        counter: value,
        editing: false,
        fontSize: CounterController().getFontSize(value, this),
        color: CounterController().getColor(value, this),
      );

  Counter toggleEditing() => copyWith(editing: !editing);
  Counter setEditing(bool edit) => copyWith(editing: edit);

  Counter setFontSize(double font) => copyWith(fontSize: font);
  Counter setColor(int color) => copyWith(color: color);
}
