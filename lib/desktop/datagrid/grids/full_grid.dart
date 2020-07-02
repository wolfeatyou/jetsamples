
import 'package:flutter/material.dart';
import 'package:jetgrid/column.dart';
import 'package:jetgrid/data_grid.dart';
import 'package:jetkit/app/app.dart';


import '../loader.dart';

class FullGridPart extends StatefulWidget {
  @override
  _FullGridPartState createState() => _FullGridPartState();

}

class _FullGridPartState extends State<FullGridPart> {

  Future<void> load() async {
    var d = await parseJsonFromAssets('assets/data.json');
    List<dynamic> list = d["data"] as List<dynamic>;
    return list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

        builder: (context, snapshot) {
          return JetGridWidget(
            columns: [
              JetColumn('Name', width:200, freezePosition: FreezePosition.Left),
              JetColumn('Quantity', group: "Financial"),
              JetColumn('Net', group: "Financial"),
              JetColumn('Gross', group: "Financial"),
              JetColumn('Type of Actions'),
              JetColumn('Last Purchased ',width: 200),
              JetColumn('Value One'),
              JetColumn('Value Two', width: 250),
              JetColumn('From')
            ],
          );
        });
  }

}