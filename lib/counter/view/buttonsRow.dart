part of 'view.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow(
      {super.key,
      required this.isVisible,
      required this.setCounter,
      required this.counter});

  final bool isVisible;
  final Function(int) setCounter;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (isVisible) ...[
          //subtract
          FloatingActionButton(
            onPressed: () => setCounter(CounterController().decrement(counter)),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),

          //reset
          if (counter != 0) ...[
            FloatingActionButton(
              onPressed: () => setCounter(CounterController().reset()),
              tooltip: 'Reset',
              child: const Icon(Icons.refresh),
            ),
          ],

          //add
          FloatingActionButton(
            onPressed: () => setCounter(CounterController().increment(counter)),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ],
    );
  }
}
