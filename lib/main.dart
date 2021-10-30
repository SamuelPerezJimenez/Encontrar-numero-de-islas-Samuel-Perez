import 'package:flutter/material.dart';

import 'package:encuentra_numero_islas/views/define_array.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Número de islas - Samuel Pérez',
      home: Scaffold(
          appBar: AppBar(title: const Text('Encontrar número de islas')),
          body: DefineArray()),
    );
  }
}
