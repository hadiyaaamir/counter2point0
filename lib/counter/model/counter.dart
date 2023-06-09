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

  const Counter({
    required this.counter,
    required this.editing,
    required this.min,
    required this.max,
    required this.maxFont,
    required this.minFont,
    this.fontSize = 5,
  });

  Counter copyWith({
    int? counter,
    bool? editing,
    int? min,
    int? max,
    double? maxFont,
    double? minFont,
    double? fontSize,
  }) {
    return Counter(
      counter: counter ?? this.counter,
      editing: editing ?? this.editing,
      min: min ?? this.min,
      max: max ?? this.max,
      maxFont: maxFont ?? this.maxFont,
      minFont: minFont ?? this.minFont,
      fontSize: fontSize ?? this.fontSize,
    );
  }

  Counter setCounter(int value) => copyWith(counter: value);

  Counter increment() {
    if (counter < max) {
      return copyWith(
        counter: counter + 1,
        fontSize: CounterController().getFontSize(counter + 1, this),
      );
    }
    return this;
  }

  Counter decrement() {
    if (counter > min) {
      return copyWith(
        counter: counter - 1,
        fontSize: CounterController().getFontSize(counter - 1, this),
      );
    }
    return this;
  }

  Counter reset() {
    int resetVal = min <= 0 ? 0 : min;
    return copyWith(
      counter: resetVal,
      fontSize: CounterController().getFontSize(resetVal, this),
    );
  }

  Counter setCounterAndExitEdit(int value) =>
      copyWith(counter: value, editing: false);

  Counter toggleEditing() => copyWith(editing: !editing);
  Counter setEditing(bool edit) => copyWith(editing: edit);

  Counter setFontSize(double font) => copyWith(fontSize: font);
}
