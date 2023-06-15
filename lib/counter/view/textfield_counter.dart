part of 'view.dart';

class TextfieldCounter extends StatefulWidget {
  const TextfieldCounter({
    super.key,
  });

  @override
  State<TextfieldCounter> createState() => _TextfieldCounterState();
}

class _TextfieldCounterState extends State<TextfieldCounter> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CounterController counterController =
        CounterInherited.of(context).listenable;
    final ThemeController themeController =
        ThemeInherited.of(context).listenable;
    return ListenableBuilder(
      listenable: counterController,
      builder: (BuildContext context, Widget? child) {
        return Column(
          children: [
            Form(
              key: _formKey,
              child: TextFieldCustom(
                controller: textController,
                initialVal: '${counterController.counter.counter}',
                validate: (value) {
                  return counterController.isValueValid(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Btn(
                    title: 'Cancel',
                    onPressed: () => counterController.counter =
                        counterController.counter.setEditing(false),
                  ),
                  const SizedBox(width: 30),
                  ListenableBuilder(
                    listenable: themeController,
                    builder: (BuildContext context, Widget? child) {
                      return Btn(
                          title: 'Done',
                          highlight: true,
                          onPressed: () {
                            final FormState form =
                                _formKey.currentState as FormState;
                            if (form.validate()) {
                              counterController.counter = counterController
                                  .counter
                                  .setCounterAndExitEdit(
                                      int.parse(textController.text));
                              themeController.updateCounterTextStyle(
                                  counterController.counter.counter);
                            }
                          });
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }
}
