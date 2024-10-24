import 'package:flutter/material.dart';
import 'package:lab_dispositivosmoviles/pages/about.dart';
import 'package:lab_dispositivosmoviles/pages/auditoriaPage.dart';
import 'package:lab_dispositivosmoviles/pages/details.dart';
import 'package:lab_dispositivosmoviles/pages/my_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  final _formKey = GlobalKey<FormState>();
  String _username = 'UsernameNotFound';
  double _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
      _counter = (prefs.getInt('counter') ?? 0).toDouble();
      print('Counter value $_counter is loaded');
      print('Username value $_username is loaded');
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _username);
    await prefs.setInt('counter', _counter.toInt());
    print('Preferences saved');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
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
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camara'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Preferences()),
                );
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nombre de usuario',
                style: TextStyle(fontSize: 22),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ingresa tu nombre de usuario',
                ),
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                  _savePreferences();
                },
              ),
              SizedBox(height: 20),
              Text(
                'Contador',
                style: TextStyle(fontSize: 22),
              ),
              Slider(
                value: _counter,
                min: 0,
                max: 10,
                divisions: 10,
                label: _counter.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _counter = value;
                  });
                  _savePreferences();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
