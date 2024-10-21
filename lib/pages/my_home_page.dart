import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab_dispositivosmoviles/pages/about.dart';
import 'package:lab_dispositivosmoviles/pages/details.dart';
import 'package:lab_dispositivosmoviles/pages/auditoriaPage.dart';
import 'package:lab_dispositivosmoviles/pages/preferences.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:lab_dispositivosmoviles/AppData.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  State<MyHomePage> createState() {
    logger.d("Crear estado");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String _username = '';
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appData = Provider.of<AppData>(context, listen: false);
      appData.actionLog('accesso a la pagina principal');
    });

    _loadPreferences();

    print('initState, mounted: $mounted');
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _saveCounter(int counter) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', counter);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _saveCounter(_counter);
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    _saveCounter(_counter);
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _saveCounter(_counter);
  }

  String get displayedAsset {
    if (_counter >= 10) {
      return 'assets/icons/victory.svg';
    } else if (_counter == 5) {
      return 'assets/icons/gameover.svg';
    } else {
      return 'assets/icons/stonks.svg';
    }
  }

  String get displayedText {
    if (_counter >= 10) {
      return '¡Victoria!';
    } else if (_counter == 5) {
      return '¡Derrota!';
    } else {
      return 'Has presionado el boton estas veces:';
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //logger.i('MyHomePage is loading');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.stacked_line_chart_outlined),
              title: Text('Contador'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(title: 'Contador')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Detalles'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => details()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Acerca'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => about()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.notes),
              title: Text('Auditoría'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => auditoriaPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.room_preferences),
              title: Text('Preferencias'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Preferences()),
                ).then((_) {
                  _loadPreferences();
                });
              },
            )
          ],
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Counter(
            username: _username,
            counter: _counter,
            onIncrement: _incrementCounter,
            onDecrement: _decrementCounter,
            onReset: _resetCounter,
            asset: displayedAsset,
            text: displayedText,
          ),
        ],
      )),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble, mounted: $mounted');
  }
}

class Counter extends StatelessWidget {
  final String username;
  final int counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onReset;
  final String asset;
  final String text;

  const Counter({
    super.key,
    required this.username,
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
    required this.asset,
    required this.text,
  });

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
            Text('Hola $username',
                style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 50),
            SvgPicture.asset(
              asset,
              semanticsLabel: 'stonks',
              width: 30,
              height: 30,
            ),
            Text(text, style: Theme.of(context).textTheme.headlineSmall),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: onIncrement,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onDecrement,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onReset,
                  child: const Icon(Icons.refresh),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
