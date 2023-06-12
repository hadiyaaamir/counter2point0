part of 'view.dart';

class EditableCounter extends StatelessWidget {
  EditableCounter({
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
                  style: TextStyle(
                    fontSize: counterController.counter.fontSize,
                    color: themeController.isDarkMode
                        ? Color.fromARGB(
                            255,
                            255,
                            255 - counterController.counter.color,
                            255 - counterController.counter.color)
                        : Color.fromARGB(
                            255, counterController.counter.color, 0, 0),
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
