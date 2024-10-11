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

  String get displayedAsset {
    if (_counter >= 10) {
      return 'assets/icons/victory.svg';
    } else if (_counter == 5) {
      return 'assets/icons/gameover.svg';
    } else {
      return 'assets/icons/stonks.svg';
    }
  }

  String get displayedText {
    if (_counter >= 10) {
      return '¡Victoria!';
    } else if (_counter == 5) {
      return '¡Derrota!';
    } else {
      return 'Has presionado el boton estas veces:';
    }
  }
}
