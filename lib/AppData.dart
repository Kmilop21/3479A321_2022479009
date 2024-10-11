import 'package:flutter/foundation.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  List<String> _actions = [];

  int get counter => _counter;
  List<String> get actions => _actions;

  void incrementCounter() {
    _counter++;
    _actions.add('Contador aumentado');
    notifyListeners();
  }

  void decreaseCounter() {
    _counter--;
    _actions.add('Contador disminuido');
    notifyListeners();
  }

  void resetCounter() {
    _counter == 0;
    _actions.add('Contador reiniciado');
    notifyListeners();
  }
}
