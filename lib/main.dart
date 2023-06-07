import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  //adding this static of() method to our StatefulWidget makes its
  //State object accessible for any descendant widget
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heyy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: _themeMode,
      home: const MyHomePage(title: 'Counter 2.0'),
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool editing = false;

  final TextEditingController _counterController = TextEditingController();

  bool isDarkMode(context) => Theme.of(context).brightness == Brightness.dark;

  void _incrementCounter() {
    editing
        ? _counterController.text = "${int.parse(_counterController.text) + 1}"
        : setState(() {
            _counter++;
          });
  }

  void _decrementCounter() {
    editing
        ? _counterController.text = "${int.parse(_counterController.text) - 1}"
        : setState(() {
            _counter--;
          });
  }

  void _resetCounter() {
    editing
        ? _counterController.text = "0"
        : setState(() {
            _counter = 0;
          });
  }

  void changeTheme() {
    MyApp.of(context).changeTheme(ThemeMode.light);
  }

  bool isInt(var value) {
    return value is int;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _counterController.text = "$_counter";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => MyApp.of(context).changeTheme(
                  isDarkMode(context) ? ThemeMode.light : ThemeMode.dark),
              icon: Icon(
                  isDarkMode(context) ? Icons.light_mode : Icons.dark_mode))
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
                  ? Form(
                      key: _formKey,
                      child:
                          //textfield
                          TextFormField(
                        controller: _counterController,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                        ),
                        validator: (value) {
                          if (value == null ||
                              !RegExp(r'^-?\d+$').hasMatch(value)) {
                            return "Value must be an integer";
                          }
                          return null;
                        },
                      ),
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

            if (editing) ...[
              //buttons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() => editing = !editing);
                        },
                        child: const Text('Cancel')),
                    const SizedBox(width: 30),
                    ElevatedButton(
                      onPressed: () {
                        final FormState form =
                            _formKey.currentState as FormState;
                        if (form.validate()) {
                          _counter = _counterController.text.isEmpty
                              ? 0
                              : int.parse(_counterController.text);
                          setState(() => editing = !editing);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              Theme.of(context).colorScheme.inversePrimary),
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //subtract
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),

          //reset
          if (_counter != 0) ...[
            FloatingActionButton(
              onPressed: _resetCounter,
              tooltip: 'Reset',
              child: const Icon(Icons.refresh),
            ),
          ],

          //add
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
