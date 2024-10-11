import 'package:flutter/material.dart';
import 'package:lab_dispositivosmoviles/AppData.dart';
import 'package:provider/provider.dart';
import 'pages/my_home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //logger.i('logger is working!');

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'SaiyanSans',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 249, 73, 3)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contador'),
    );
  }
}
