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

  @override
  void initState() {
    super.initState();
    _counter =
        _counter.setFontSize(CounterController().getFontSize(_counter.counter));
    _counter =
        _counter.setColor(CounterController().getColor(_counter.counter));
  }

  void setCounter(Counter c) {
    setState(() {
      _counter = c;
    });
    if (_counter.isMaxValue() || _counter.isMinValue()) {
      final snackBar = getSnackbar(_counter.isMaxValue());
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  final ThemeController themeController = ThemeController();

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
              Text(
                'This is the current counter value:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              CounterNumber(
                counter: _counter,
                setCounter: setCounter,
                setEditing: (bool edit) => setState(
                  () => _counter = _counter.setEditing(edit),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ButtonsRow(
          isVisible: !_counter.editing,
          setCounter: setCounter,
          counter: _counter,
        ));
  }
}
