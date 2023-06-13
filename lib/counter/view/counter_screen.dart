part of 'view.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // final ThemeController themeController = ThemeController();
  final CounterController counterController = CounterController();

  @override
  void dispose() {
    super.dispose();
    // themeController.dispose();
    counterController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return CounterInherited(
      listenable: counterController,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Counter 2.0'),
          centerTitle: true,
          actions: const [ThemeButton()],
        ),
        body: ListenableBuilder(
            listenable: counterController,
            builder: (BuildContext context, Widget? child) {
              // final CounterController counterController =
              //     CounterInherited.of(context).listenable;
              checkSnackbar(counterController.counter);
              return Center(
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
              );
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ButtonsRow(),
      ),
    );
  }
}
