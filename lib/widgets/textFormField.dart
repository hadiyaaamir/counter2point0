import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    super.key,
    required this.controller,
    this.textAlign = TextAlign.center,
    this.validate,
    this.initialVal = "",
  });

  final TextEditingController controller;
  final TextAlign textAlign;
  final Function(String?)? validate;
  final String initialVal;

  @override
  Widget build(BuildContext context) {
    controller.text = initialVal;

    return TextFormField(
      // initialValue: initialVal,
      controller: controller,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.headlineMedium,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(5),
      ),
      validator: (value) {
        return validate == null ? null : validate!(value);
      },
    );
  }
}
