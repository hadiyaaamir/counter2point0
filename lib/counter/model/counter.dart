part of 'model.dart';

@immutable
class Counter {
  final int counter;
  final bool editing;

  final TextEditingController counterController;

  final int max;
  final int min;

  const Counter({
    required this.counter,
    required this.editing,
    required this.counterController,
    this.min = -250,
    this.max = 250,
  });

  Counter setCounter(int value) {
    return Counter(
      counter: value,
      editing: editing,
      counterController: TextEditingController(text: '$value'),
      min: min,
      max: max,
    );
  }

  Counter increment() {
    if (counter == max) return this;
    return Counter(
      counter: counter + 1,
      editing: editing,
      counterController: TextEditingController(text: '${counter + 1}'),
      min: min,
      max: max,
    );
  }

  Counter decrement() {
    if (counter == min) return this;
    return Counter(
      counter: counter - 1,
      editing: editing,
      counterController: TextEditingController(text: '${counter - 1}'),
      min: min,
      max: max,
    );
  }

  Counter reset() {
    int resetVal = min <= 0 ? 0 : min;

    return Counter(
      counter: resetVal,
      editing: editing,
      counterController: TextEditingController(text: '$resetVal'),
      min: min,
      max: max,
    );
  }

  Counter toggleEditing() {
    return Counter(
      counter: counter,
      editing: !editing,
      counterController: TextEditingController(text: '$counter'),
      min: min,
      max: max,
    );
  }

  Counter setEditing(bool edit) {
    return Counter(
      counter: counter,
      editing: edit,
      counterController: TextEditingController(text: '$counter'),
      min: min,
      max: max,
    );
  }

  Counter setText(String text) {
    return Counter(
      counter: counter,
      editing: editing,
      counterController: TextEditingController(text: text),
      min: min,
      max: max,
    );
  }
}
