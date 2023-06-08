part of 'model.dart';

@immutable
class Counter {
  final int counter;
  final bool editing;

  final TextEditingController counterController;

  const Counter({
    required this.counter,
    required this.editing,
    required this.counterController,
  });

  Counter setCounter(int value) {
    return Counter(
      counter: value,
      editing: editing,
      counterController: TextEditingController(text: '$value'),
    );
  }

  Counter increment() {
    return Counter(
      counter: counter + 1,
      editing: editing,
      counterController: TextEditingController(text: '${counter + 1}'),
    );
  }

  Counter decrement() {
    return Counter(
      counter: counter - 1,
      editing: editing,
      counterController: TextEditingController(text: '${counter - 1}'),
    );
  }

  Counter reset() {
    return Counter(
      counter: 0,
      editing: editing,
      counterController: TextEditingController(text: '${0}'),
    );
  }

  Counter toggleEditing() {
    return Counter(
      counter: counter,
      editing: !editing,
      counterController: TextEditingController(text: '$counter'),
    );
  }

  Counter setEditing(bool edit) {
    return Counter(
      counter: counter,
      editing: edit,
      counterController: TextEditingController(text: '$counter'),
    );
  }

  Counter setText(String text) {
    return Counter(
      counter: counter,
      editing: editing,
      counterController: TextEditingController(text: text),
    );
  }
}
