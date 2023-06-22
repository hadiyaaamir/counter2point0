part of 'view.dart';

class RegularCounter extends StatelessWidget {
  const RegularCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController =
        CustomInheritedWidget.of<ThemeController>(context).listenable;

    final CounterController counterController =
        CustomInheritedWidget.of<CounterController>(context).listenable;

    return ListenableBuilder(
      listenable: themeController,
      builder: (BuildContext context, Widget? child) {
        return ListenableBuilder(
          listenable: counterController,
          builder: (BuildContext context, Widget? child) {
            return GestureDetector(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 400),
                style: themeController.theme.counterTheme
                    .getCounterTextStyle(counterController.counter.counter),
                child: Text(
                  '${counterController.counter.counter}',
                ),
              ),
              onTap: () {
                counterController.counter =
                    counterController.counter.toggleEditing();
              },
            );
          },
        );
      },
    );
  }
}
