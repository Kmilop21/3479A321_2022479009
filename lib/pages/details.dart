import 'package:flutter/material.dart';
import 'package:lab_dispositivosmoviles/pages/about.dart';

class details extends StatelessWidget {
  const details({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //getting the device's size
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles'),
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
                          'Laboratorio 3 de Camilo Provoste para el modulo de programacion para dispositivos moviles'),
                    ],
                  ),
                ),
              )),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Pagina anterior')),
                  const SizedBox(width: 30),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => about()),
                        );
                      },
                      child: const Text('Pagina siguiente')),
                ],
              )
            ],
          ),
        )));
  }
}
