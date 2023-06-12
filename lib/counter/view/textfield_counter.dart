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
  final CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
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
                    return CounterController().isValueValid(value);
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
                    Btn(
                        title: 'Done',
                        highlight: true,
                        onPressed: () {
                          final FormState form =
                              _formKey.currentState as FormState;
                          if (form.validate()) {
                            counterController.counter =
                                counterController.counter.setCounterAndExitEdit(
                                    int.parse(textController.text));
                          }
                        }),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }
}
