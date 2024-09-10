import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //getting the device's size
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Acerca de'),
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Pagina anterior'))
            ],
          ),
        )));
  }
}
