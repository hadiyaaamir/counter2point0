part of 'view.dart';

class CounterNumber extends StatelessWidget {
  const CounterNumber({
    super.key,
    required this.setCounter,
    required this.setEditing,
    required this.counter,
  });

  final Counter counter;
  final Function(Counter) setCounter;
  final Function(bool) setEditing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 30, vertical: counter.editing ? 5 : 10),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        child: counter.editing
            ? TextfieldCounter(
                key: const Key('editable counter'),
                counter: counter,
                setCounter: setCounter,
                setEditing: setEditing)
            : EditableCounter(
                counter: counter,
                setCounter: setCounter,
                setEditing: setEditing,
              ),
      ),
    );
  }
}
