// part of 'view.dart';

// class EditingButtons extends StatelessWidget {
//   const EditingButtons({
//     super.key,
//     required this.setCounter,
//     required this.setEditing,
//     required this.counter,
//     required this.formKey,
//     required this.counterText,
//   });

//   final Function(Counter) setCounter;
//   final Function(bool) setEditing;
//   final Counter counter;
//   final GlobalKey<FormState> formKey;
//   final String counterText;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Btn(
//             title: 'Cancel',
//             onPressed: () => setEditing(false),
//           ),
//           const SizedBox(width: 30),
//           Btn(
//               title: 'Done',
//               highlight: true,
//               onPressed: () {
//                 final FormState form = formKey.currentState as FormState;
//                 if (form.validate()) {
//                   setCounter(
//                       counter.setCounterAndExitEdit(int.parse(counterText)));
//                 }
//               }),
//         ],
//       ),
//     );
//   }
// }
