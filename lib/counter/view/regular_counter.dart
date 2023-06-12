part of 'view.dart';

class RegularCounter extends StatelessWidget {
  RegularCounter({
    super.key,
  });

  final ThemeController themeController = ThemeController();
  final CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: counterController,
        builder: (BuildContext context, Widget? child) {
          return GestureDetector(
            child: ListenableBuilder(
              listenable: themeController,
              builder: (BuildContext context, Widget? child) {
                return AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 400),
                  style: CounterThemeController().getThemestyle(
                    themeController.isDarkMode,
                    counterController.counter.counter,
                  ),
                  child: Text(
                    '${counterController.counter.counter}',
                  ),
                );
              },
            ),
            onTap: () {
              counterController.counter =
                  counterController.counter.toggleEditing();
            },
          );
        });
  }
}
