import 'package:counter2point0/app/counter/view/buttonsRow.dart';
import 'package:counter2point0/app/counter/view/editableCounter.dart';
import 'package:counter2point0/app/darkmode/view/modeButton.dart';
import 'package:counter2point0/app/root.dart';
import 'package:flutter/material.dart';

class CounterMain extends StatefulWidget {
  const CounterMain({super.key});

  @override
  State<CounterMain> createState() => _CounterMainState();
}

class _CounterMainState extends State<CounterMain> {
  int _counter = 0;
  bool editing = false;

  final TextEditingController _counterController = TextEditingController();

  void setCounter(int value) {
    setState(() {
      _counter = value;
    });
  }

  void changeTheme() {
    // MyApp.of(context).changeTheme(ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    _counterController.text = "$_counter";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter 2.0'),
        centerTitle: true,
        actions: [
          ModeButton(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //top text
            Text(
              'This is the current counter value:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            //number
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 30, vertical: editing ? 5 : 10),
              child: editing
                  //editable number
                  ? EditableCounter(
                      counter: _counter,
                      setCounter: setCounter,
                      setEditing: (bool edit) => setState(() => editing = edit),
                    )

                  //clickable number
                  : GestureDetector(
                      child: Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      onTap: () {
                        setState(() => editing = !editing);
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonsRow(
        isVisible: !editing,
        counter: _counter,
        setCounter: setCounter,
      ),
    );
  }
}
