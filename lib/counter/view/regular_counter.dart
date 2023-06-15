part of 'view.dart';

class RegularCounter extends StatelessWidget {
  const RegularCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController =
        MyInheritedWidget.of<ThemeController>(context).listenable;

    final CounterController counterController =
        MyInheritedWidget.of<CounterController>(context).listenable;

    return ListenableBuilder(
      listenable: themeController,
      builder: (BuildContext context, Widget? child) {
        return ListenableBuilder(
          listenable: counterController,
          builder: (BuildContext context, Widget? child) {
            return GestureDetector(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 400),
                style: themeController
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
