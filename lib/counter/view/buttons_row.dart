part of 'view.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CounterController counterController =
        CounterInherited.of(context).listenable;
    final ThemeController themeController =
        ThemeInherited.of(context).listenable;

    return ListenableBuilder(
      listenable: themeController,
      builder: (BuildContext context, Widget? child) {
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
                      themeController.updateCounterTextStyle(
                          counterController.counter.counter);
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),

                  //reset
                  if (counterController.counter.counter != 0) ...[
                    FloatingActionButton(
                      onPressed: () {
                        counterController.counter =
                            counterController.counter.reset();
                        themeController.updateCounterTextStyle(
                            counterController.counter.counter);
                      },
                      tooltip: 'Reset',
                      child: const Icon(Icons.refresh),
                    ),
                  ],

                  //add
                  FloatingActionButton(
                    onPressed: () {
                      counterController.counter =
                          counterController.counter.increment();
                      themeController.updateCounterTextStyle(
                          counterController.counter.counter);
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
