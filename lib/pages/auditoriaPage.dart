import 'package:flutter/material.dart';
import 'package:lab_dispositivosmoviles/AppData.dart';
import 'package:lab_dispositivosmoviles/pages/about.dart';
import 'package:lab_dispositivosmoviles/pages/camera.dart';
import 'package:lab_dispositivosmoviles/pages/details.dart';
import 'package:lab_dispositivosmoviles/pages/my_home_page.dart';
import 'package:lab_dispositivosmoviles/pages/preferences.dart';
import 'package:provider/provider.dart';

class auditoriaPage extends StatefulWidget {
  const auditoriaPage({
    super.key,
  });

  @override
  State<auditoriaPage> createState() {
    return _auditoriaPageState();
  }
}

class _auditoriaPageState extends State<auditoriaPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appData = Provider.of<AppData>(context, listen: false);
      appData.actionLog('accesso a auditoria');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
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
      body: Consumer<AppData>(
        builder: (context, appData, child) {
          return ListView.builder(
            itemCount: appData.actions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(appData.actions[index]),
              );
            },
          );
        },
      ),
    );
  }
}
