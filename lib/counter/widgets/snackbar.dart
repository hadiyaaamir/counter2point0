part of 'widgets.dart';

getSnackbar(bool isMaxValue) {
  return SnackBar(
    content: Text('You have reached the'
        '${isMaxValue ? ' maximum ' : ' minimum '}'
        'value'),
    action: SnackBarAction(
      label: 'Okay',
      onPressed: () {},
    ),
    duration: const Duration(seconds: 3),
  );
}
