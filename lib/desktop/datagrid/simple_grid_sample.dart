import 'package:JetSamples/desktop/datagrid/simple_grid.dart';
import 'package:flutter/material.dart';
import 'package:jetkit/jetkit.dart';

class SimpleGridSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return JetPanel(
        color: Color(0xffF7F9FA),
        title: "Simple grid",
        child: ListView(children: [
          Container(height: 600, child: JetCard(child: Text('grid')/*SimpleGridPart()*/))
        ]));
  }
}
