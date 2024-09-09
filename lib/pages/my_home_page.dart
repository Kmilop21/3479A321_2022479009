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

  String displayedAsset = 'assets/icons/stonks.svg';
  String displayedText = 'Has persionado el boton estas veces:';

  void _incrementCounter() {
    setState(() {
      _counter++;
      logger.i('counter increased, new count: $_counter');
      _CheckResults();
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
      logger.i('counter decreased, new count: $_counter');
      _CheckResults();
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      logger.i('counter reseted, new count: $_counter');
      _CheckResults();
    });
  }

  void _CheckResults() {
    if (_counter >= 5) {
      displayedAsset = 'assets/icons/victory.svg';
      displayedText = '¡Victoria!';
    } else if (_counter <= -5) {
      displayedAsset = 'assets/icons/gameover.svg';
      displayedText = '¡Derrota!';
    } else {
      displayedAsset = 'assets/icons/stonks.svg';
      displayedText = 'Has persionado el boton estas veces:';
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.i('MyHomePage is loading');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: counter(
            displayedAsset: displayedAsset,
            displayedText: displayedText,
            count: _counter,
            incrementCounter: _incrementCounter,
            decreaseCounter: _decreaseCounter,
            resetCounter: _resetCounter),
      ),
    );
  }
}

class counter extends StatelessWidget {
  const counter(
      {super.key,
      required this.displayedAsset,
      required this.displayedText,
      required this.count,
      required this.incrementCounter,
      required this.decreaseCounter,
      required this.resetCounter});

  final String displayedAsset;
  final String displayedText;
  final int count;
  final VoidCallback incrementCounter;
  final VoidCallback decreaseCounter;
  final VoidCallback resetCounter;

  @override
  Widget build(BuildContext context) {
    //getting the device's size
    final Size screenSize = MediaQuery.of(context).size;

    return Center(
        child: SizedBox(
      width: screenSize.width * 0.9,
      height: screenSize.height * 0.8,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              displayedAsset,
              semanticsLabel: 'stonks',
              width: 30,
              height: 30,
            ),
            Text(displayedText,
                style: Theme.of(context).textTheme.headlineSmall),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: incrementCounter, child: const Icon(Icons.add)),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: decreaseCounter,
                    child: const Icon(Icons.remove)),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: resetCounter, child: const Icon(Icons.refresh))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
