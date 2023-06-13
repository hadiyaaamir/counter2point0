part of 'view.dart';

class EditableCounter extends StatelessWidget {
  const EditableCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CounterController counterController =
        CounterInherited.of(context).listenable;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 30, vertical: counterController.counter.editing ? 5 : 10),
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
        child: counterController.counter.editing
            ? const TextfieldCounter(
                key: Key('editable counter'),
              )
            : const RegularCounter(
                key: Key('normal counter'),
              ),
      ),
    );
  }
}
