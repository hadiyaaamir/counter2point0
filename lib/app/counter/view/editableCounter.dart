import 'package:counter2point0/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditableCounter extends StatelessWidget {
  EditableCounter({
    super.key,
    required this.setCounter,
    required this.setEditing,
    required this.counter,
  });
  final Function(int) setCounter;
  final Function(bool) setEditing;
  final int counter;

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
            initialVal: '$counter',
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
                onPressed: () => setEditing(false),
              ),
              const SizedBox(width: 30),
              Btn(
                  title: 'Done',
                  highlight: true,
                  onPressed: () {
                    final FormState form = _formKey.currentState as FormState;
                    if (form.validate()) {
                      setEditing(false);
                      setCounter(_counterController.text.isEmpty
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
}
