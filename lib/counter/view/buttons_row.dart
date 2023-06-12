part of 'view.dart';

class ButtonsRow extends StatelessWidget {
  ButtonsRow({
    super.key,
  });
  final CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: counterController,
        builder: (BuildContext context, Widget? child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (!counterController.counter.editing) ...[
                //subtract
                FloatingActionButton(
                  onPressed: () {
                    counterController.counter =
                        counterController.counter.decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),

                //reset
                if (counterController.counter.counter != 0) ...[
                  FloatingActionButton(
                    onPressed: () => counterController.counter =
                        counterController.counter.reset(),
                    tooltip: 'Reset',
                    child: const Icon(Icons.refresh),
                  ),
                ],

                //add
                FloatingActionButton(
                  onPressed: () => counterController.counter =
                      counterController.counter.increment(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ],
          );
        });
  }
}
