import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

void demo() {
  logger.d('Log message with 2 methods');

  loggerNoStack.i('Info message');

  loggerNoStack.w('Just a warning');

  logger.e('Error! Something bad happened', error: 'Test Error');

  loggerNoStack.t({'key': 5, 'value': 'something'});

  Logger(printer: SimplePrinter(colors: true)).t('boom');
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;

      logger.i('counter increased, new count: $_counter');
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
      logger.i('counter decreased, new count: $_counter');
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      logger.i('counter reseted, new count: $_counter');
    });
  }

  List<Widget> _createPersistentButtons() {
    return [
      ElevatedButton(
          onPressed: _decreaseCounter, child: const Icon(Icons.remove)),
      ElevatedButton(onPressed: _resetCounter, child: const Icon(Icons.refresh))
    ];
  }

  @override
  Widget build(BuildContext context) {
    logger.i('MyHomePage is loading');

    String stonksAsset = 'assets/icons/stonks.svg';

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                stonksAsset,
                semanticsLabel: 'stonks',
                width: 30,
                height: 30,
              ),
              const Text(
                'Has persionado el boton estas veces:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.delete),
        ),
        persistentFooterButtons: _createPersistentButtons());
  }
}
