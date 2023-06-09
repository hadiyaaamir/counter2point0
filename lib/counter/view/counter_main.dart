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
    min: -50,
    max: 50,
    maxFont: 200,
    minFont: 10,
  );

  @override
  void initState() {
    super.initState();
    _counter = _counter.setFontSize(
        CounterController().getFontSize(_counter.counter, _counter));
    _counter = _counter
        .setColor(CounterController().getColor(_counter.counter, _counter));
  }

  void setCounter(Counter c) {
    setState(() {
      _counter = c;
    });
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
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                    );
                  },
                  child: _counter.editing
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
                          child: ListenableBuilder(
                            listenable: themeController,
                            builder: (BuildContext context, Widget? child) {
                              return AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 400),
                                style: TextStyle(
                                  fontSize: _counter.fontSize,
                                  color: themeController.isDarkMode
                                      ? Color.fromARGB(
                                          255,
                                          255,
                                          255 - _counter.color,
                                          255 - _counter.color)
                                      : Color.fromARGB(
                                          255, _counter.color, 0, 0),
                                ),
                                child: Text(
                                  '${_counter.counter}',
                                ),
                              );
                            },
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
          setCounter: setCounter,
          counter: _counter,
        ));
  }
}
