part of 'view.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
    required this.isVisible,
    required this.setCounter,
    required this.counter,
  });

  final bool isVisible;
  final Function(Counter) setCounter;
  final Counter counter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (isVisible) ...[
          //subtract
          FloatingActionButton(
            onPressed: () {
              setCounter(counter.decrement());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),

          //reset
          if (counter.counter != 0) ...[
            FloatingActionButton(
              onPressed: () => setCounter(counter.reset()),
              tooltip: 'Reset',
              child: const Icon(Icons.refresh),
            ),
          ],

          //add
          FloatingActionButton(
            onPressed: () => setCounter(counter.increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ],
    );
  }
}
