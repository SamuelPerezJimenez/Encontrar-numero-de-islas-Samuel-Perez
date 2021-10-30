import 'dart:math';
import 'package:flutter/material.dart';

import 'package:encuentra_numero_islas/views/island_result.dart';

class DefineArray extends StatefulWidget {
  DefineArray({Key? key}) : super(key: key);

  @override
  _DefineArrayState createState() => _DefineArrayState();
}

class _DefineArrayState extends State<DefineArray> {
  String arrayDimentions = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Define la dimensión del arreglo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            const Text(
              'Ejemplo: 54 creará un arreglo de dimensión 5 x 4',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                  onChanged: (value) {
                    setState(() {
                      arrayDimentions = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: inputDecoration('54')),
            ),
            OutlinedButton(
                onPressed: () {
                  if (arrayDimentions.length == 2) {
                    var m = int.tryParse(arrayDimentions[0]);
                    var n = int.tryParse(arrayDimentions[1]);

                    List<List<int>> array = List.generate(
                        m!,
                        (int) =>
                            List.generate(n!, (int) => Random().nextInt(2)));
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return IslandResult(
                        array: array,
                        m: m,
                        n: n!,
                      );
                    }));
                  } else {
                    showSnackBar('Formato incorrecto');
                  }
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text('Definir'),
                ))
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xff707070).withOpacity(0.5))),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xff707070).withOpacity(0.5))),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade400));
  }

  void showSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red.shade400,
      duration: const Duration(seconds: 2),
    ));
  }
}
