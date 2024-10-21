import 'package:flutter/material.dart';
import 'package:lab_dispositivosmoviles/pages/about.dart';
import 'package:lab_dispositivosmoviles/pages/auditoria.dart';
import 'package:lab_dispositivosmoviles/pages/my_home_page.dart';
import 'package:lab_dispositivosmoviles/AppData.dart';
import 'package:provider/provider.dart';

class details extends StatefulWidget {
  const details({
    super.key,
  });

  @override
  State<details> createState() {
    return _detailsState();
  }
}

class _detailsState extends State<details> {
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
          title: const Text('Detalles'),
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
                          'Laboratorio 6 de Camilo Provoste para el modulo de programacion para dispositivos moviles',
                          style: Theme.of(context).textTheme.headlineSmall),
                      SizedBox(height: 50),
                      Text('Contador: ${appData.counter}',
                          style: Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
                ),
              )),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              )
            ],
          ),
        )));
  }
}
