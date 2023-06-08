part of 'view.dart';

class EditableCounter extends StatefulWidget {
  const EditableCounter({
    super.key,
    required this.setCounter,
    required this.setEditing,
    required this.counter,
  });
  final Function(int) setCounter;
  final Function(bool) setEditing;
  final int counter;

  @override
  State<EditableCounter> createState() => _EditableCounterState();
}

class _EditableCounterState extends State<EditableCounter> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _counterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: TextFieldCustom(
            controller: _counterController,
            initialVal: '${widget.counter}',
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
                      widget.setCounter(_counterController.text.isEmpty
                          ? 0
                          : int.parse(_counterController.text));
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
    _counterController.dispose();
  }
}
