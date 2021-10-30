import 'package:flutter/material.dart';

import 'package:encuentra_numero_islas/utils/count_islands.dart';

class IslandResult extends StatefulWidget {
  IslandResult({
    Key? key,
    required this.array,
    required this.m,
    required this.n,
  }) : super(key: key);
  final List<List<int>> array;
  final int m;
  final int n;

  @override
  _IslandResultState createState() => _IslandResultState();
}

class _IslandResultState extends State<IslandResult> {
  @override
  Widget build(BuildContext context) {
    var tempBoard = <List<int>>[];
    for (var item in widget.array) {
      tempBoard.add(item.toList());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Cantidad de islas: ${(CountIsland().getNumberOfIslands(widget.array, widget.m, widget.n)).toString()}'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8.0),
            child: Text(
              'Presiona un valor para cambiar el resultado',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: ListView(children: [
              for (int i = 0; i < widget.m; i++) ...[
                Row(
                  children: <Widget>[
                    for (int j = 0; j < widget.n; j++)
                      GridTile(
                          child: Container(
                              width:
                                  MediaQuery.of(context).size.width / widget.n,
                              height: 50,
                              color: tempBoard[i][j] == 1
                                  ? Colors.brown
                                  : Colors.blue.shade300,
                              child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    widget.array.clear();
                                    tempBoard[i][j] =
                                        tempBoard[i][j] = 1 ^ tempBoard[i][j];
                                    for (var item in tempBoard) {
                                      widget.array.add(item.toList());
                                    }

                                    setState(() {});
                                  },
                                  child: Center(
                                    child: Text(
                                      tempBoard[i][j].toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ))))
                  ],
                )
              ]
            ]),
          )
        ],
      ),
    );
  }
}
