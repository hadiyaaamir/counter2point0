part of 'view.dart';

class CounterMain extends StatefulWidget {
  const CounterMain({super.key});

  @override
  State<CounterMain> createState() => _CounterMainState();
}

class _CounterMainState extends State<CounterMain> {
  final ThemeController themeController = ThemeController();
  final CounterController counterController = CounterController();

  @override
  void initState() {
    super.initState();

    counterController.counter = counterController.counter.setFontSize(
        CounterController().getFontSize(counterController.counter.counter));
    counterController.counter =
        counterController.counter.setColor(counterController.counter.counter);
  }

  @override
  void dispose() {
    super.dispose();
    themeController.dispose();
    counterController.dispose();
  }

  void checkSnackbar(Counter c) {
    if (c.isMaxValue() || c.isMinValue()) {
      final snackBar = getSnackbar(c.isMaxValue());

      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
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
        body: ListenableBuilder(
            listenable: counterController,
            builder: (BuildContext context, Widget? child) {
              checkSnackbar(counterController.counter);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'This is the current counter value:',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    CounterNumber(),
                  ],
                ),
              );
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ButtonsRow());
  }
}
