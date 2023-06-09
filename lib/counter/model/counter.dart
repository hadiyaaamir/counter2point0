part of 'model.dart';

@immutable
class Counter {
  final int counter;
  final bool editing;

  const Counter({
    required this.counter,
    required this.editing,
  });

  Counter copyWith({int? counter, bool? editing}) {
    return Counter(
      counter: counter ?? this.counter,
      editing: editing ?? this.editing,
    );
  }

  Counter setCounter(int value) => copyWith(counter: value);
  Counter increment() => copyWith(counter: counter + 1);
  Counter decrement() => copyWith(counter: counter - 1);
  Counter reset() => copyWith(counter: 0);

  Counter toggleEditing() => copyWith(editing: !editing);
  Counter setEditing(bool edit) => copyWith(editing: edit);
}
