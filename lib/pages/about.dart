import 'package:flutter/material.dart';
import 'package:lab_dispositivosmoviles/AppData.dart';
import 'package:lab_dispositivosmoviles/pages/auditoria.dart';
import 'package:lab_dispositivosmoviles/pages/details.dart';
import 'package:lab_dispositivosmoviles/pages/my_home_page.dart';
import 'package:lab_dispositivosmoviles/pages/preferences.dart';
import 'package:provider/provider.dart';

class about extends StatefulWidget {
  const about({
    super.key,
  });

  @override
  State<about> createState() {
    return _aboutState();
  }
}

class _aboutState extends State<about> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appData = Provider.of<AppData>(context, listen: false);
      appData.actionLog('accesso a informacion del desarrollador');
    });
  }

  @override
  Widget build(BuildContext context) {
    //getting the device's size
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Acerca de'),
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
                    MaterialPageRoute(builder: (context) => auditoria()),
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
              )
            ],
          ),
        ),
        body: Center(
            child: SizedBox(
          width: screenSize.width * 0.9,
          height: screenSize.height * 0.8,
          child: Column(
            children: [
              Expanded(
                  child: SizedBox(
                width: screenSize.width * 0.9,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          'App desarrollada por Camilo Provoste\nestudiante de ingenieria en desarrollo\nde videojuegos y realidad virtual',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
              )),
              const SizedBox(height: 10),
            ],
          ),
        )));
  }
}
