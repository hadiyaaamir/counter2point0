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
    return CustomInheritedWidget<CounterController>(
      listenable: counterController,
      child: ListenableBuilder(
        listenable: counterController,
        builder: (BuildContext context, Widget? child) {
          CounterController counterController =
              CustomInheritedWidget.of<CounterController>(context).listenable;

          checkSnackbar(counterController.counter);
          return Scaffold(
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: const ButtonsRow(),
          );
        },
      ),
    );
  }
}
