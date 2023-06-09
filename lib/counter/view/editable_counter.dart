part of 'view.dart';

class EditableCounter extends StatefulWidget {
  const EditableCounter({
    super.key,
    required this.setCounter,
    required this.setEditing,
    required this.counter,
  });
  final Function(Counter) setCounter;
  final Function(bool) setEditing;
  final Counter counter;

  @override
  State<EditableCounter> createState() => _EditableCounterState();
}

class _EditableCounterState extends State<EditableCounter> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController counterController =
        widget.counter.counterController;
    return Column(
      children: [
        Form(
          key: _formKey,
          child: TextFieldCustom(
            controller: counterController,
            initialVal: '${widget.counter.counter}',
            validate: (value) {
              if (value == null || !RegExp(r'^-?\d+$').hasMatch(value)) {
                return "Value must be an integer";
              }
              return null;
            },
          ),
        ),
        //buttons
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
                      widget.setEditing(false);
                      widget.setCounter(
                        Counter(
                          counter: int.parse(counterController.text),
                          editing: false,
                          counterController: TextEditingController(
                              text: counterController.text),
                        ),
                      );
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
    widget.counter.counterController.dispose();
  }
}
