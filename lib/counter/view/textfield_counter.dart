part of 'view.dart';

class TextfieldCounter extends StatefulWidget {
  const TextfieldCounter({
    super.key,
    required this.setCounter,
    required this.setEditing,
    required this.counter,
  });
  final Function(Counter) setCounter;
  final Function(bool) setEditing;
  final Counter counter;

  @override
  State<TextfieldCounter> createState() => _TextfieldCounterState();
}

class _TextfieldCounterState extends State<TextfieldCounter> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController counterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    counterController.text = '${widget.counter.counter}';

    return Column(
      children: [
        Form(
          key: _formKey,
          child: TextFieldCustom(
            controller: counterController,
            initialVal: '${widget.counter.counter}',
            validate: (value) {
              return CounterController().isValueValid(value);
            },
          ),
        ),
        //buttons
        // EditingButtons(
        //   setCounter: widget.setCounter,
        //   setEditing: widget.setEditing,
        //   counter: widget.counter,
        //   formKey: _formKey,
        //   counterText: counterController.text,
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Btn(
                title: 'Cancel',
                onPressed: () => widget.setEditing(false),
              ),
              const SizedBox(width: 30),
              Btn(
                  title: 'Done',
                  highlight: true,
                  onPressed: () {
                    final FormState form = _formKey.currentState as FormState;
                    if (form.validate()) {
                      widget.setCounter(widget.counter.setCounterAndExitEdit(
                          int.parse(counterController.text)));
                    }
                  }),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    counterController.dispose();
  }
}
