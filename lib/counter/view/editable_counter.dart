part of 'view.dart';

class EditableCounter extends StatelessWidget {
  EditableCounter({
    super.key,
  });

  final CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: counterController,
        builder: (BuildContext context, Widget? child) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: counterController.counter.editing ? 5 : 10),
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
                  : RegularCounter(
                      key: const Key('normal counter'),
                    ),
            ),
          );
        });
  }
}
