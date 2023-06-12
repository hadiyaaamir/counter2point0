part of 'view.dart';

class EditableCounter extends StatelessWidget {
  EditableCounter({
    super.key,
    required this.setCounter,
    required this.setEditing,
    required this.counter,
  });

  final Counter counter;
  final Function(Counter) setCounter;
  final Function(bool) setEditing;

  final ThemeController themeController = ThemeController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('normal counter'),
      child: ListenableBuilder(
        listenable: themeController,
        builder: (BuildContext context, Widget? child) {
          return AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 400),
            style: TextStyle(
              fontSize: counter.fontSize,
              color: themeController.isDarkMode
                  ? Color.fromARGB(
                      255, 255, 255 - counter.color, 255 - counter.color)
                  : Color.fromARGB(255, counter.color, 0, 0),
            ),
            child: Text(
              '${counter.counter}',
            ),
          );
        },
      ),
      onTap: () {
        setCounter(counter.toggleEditing());
      },
    );
  }
}
