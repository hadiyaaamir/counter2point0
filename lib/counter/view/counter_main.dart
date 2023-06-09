part of 'view.dart';

class CounterMain extends StatefulWidget {
  const CounterMain({super.key});

  @override
  State<CounterMain> createState() => _CounterMainState();
}

class _CounterMainState extends State<CounterMain> {
  Counter _counter = const Counter(
    counter: 0,
    editing: false,
  );

  void setCounter(Counter c) {
    setState(() {
      _counter = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter 2.0'),
        centerTitle: true,
        actions: const [
          ThemeButton(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //top text
            Text(
              'This is the current counter value:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            //number
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 30, vertical: _counter.editing ? 5 : 10),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 750),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: _counter.editing
                    //editable number
                    ? EditableCounter(
                        key: const Key('editable counter'),
                        counter: _counter,
                        setCounter: setCounter,
                        setEditing: (bool edit) => setState(
                            () => _counter = _counter.setEditing(edit)),
                      )

                    //clickable number
                    : GestureDetector(
                        key: const Key('normal counter'),
                        child: Text(
                          '${_counter.counter}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        onTap: () {
                          setState(() => _counter = _counter.toggleEditing());
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonsRow(
        isVisible: !_counter.editing,
        counter: _counter,
        setCounter: setCounter,
      ),
    );
  }
}
