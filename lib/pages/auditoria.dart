import 'package:flutter/material.dart';

class auditoria extends StatelessWidget {
  const auditoria({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //getting the device's size
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Auditoría'),
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
                      Text('Auditoría',
                          style: Theme.of(context).textTheme.headlineSmall),
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
