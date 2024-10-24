import 'package:flutter/material.dart';
import 'package:lab_dispositivosmoviles/pages/about.dart';
import 'package:lab_dispositivosmoviles/pages/auditoriaPage.dart';
import 'package:lab_dispositivosmoviles/pages/details.dart';
import 'package:lab_dispositivosmoviles/pages/my_home_page.dart';
import 'package:lab_dispositivosmoviles/AppData.dart';
import 'package:lab_dispositivosmoviles/pages/preferences.dart';
import 'package:provider/provider.dart';

class cameraPage extends StatefulWidget {
  const cameraPage({
    super.key,
  });

  @override
  State<cameraPage> createState() {
    return _cameraPageState();
  }
}

class _cameraPageState extends State<cameraPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appData = Provider.of<AppData>(context, listen: false);
      appData.actionLog('accesso a detalles de la aplicacion');
    });
    print('initState, mounted: $mounted');
  }

  @override
  Widget build(BuildContext context) {
    //getting the device's size
    final Size screenSize = MediaQuery.of(context).size;
    final appData = Provider.of<AppData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camara'),
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
                  MaterialPageRoute(builder: (context) => cameraPage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
