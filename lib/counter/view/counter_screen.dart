part of 'view.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final CounterController counterController = CounterController();

  @override
  void dispose() {
    super.dispose();
    counterController.dispose();
  }

  @override
  void initState() {
    super.initState();

    counterController.addListener(() {
      setState(() {});
    });
  }

  void checkSnackbar(Counter c) {
    if (c.isMaxValue() || c.isMinValue()) {
      final snackBar = getSnackbar(c.isMaxValue());

      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    checkSnackbar(counterController.counter);
    return CounterInherited(
      listenable: counterController,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Counter 2.0'),
          centerTitle: true,
          actions: const [ThemeButton()],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'This is the current counter value:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const EditableCounter(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const ButtonsRow(),
      ),
    );
  }
}
