
import 'package:flutter/material.dart';
import 'package:jetgrid/column.dart';
import 'package:jetgrid/data_grid.dart';
import 'package:jetkit/app/app.dart';


import 'loader.dart';

class SimpleGridPart extends StatefulWidget {
  @override
  _SimpleGridPartState createState() => _SimpleGridPartState();

}

class _SimpleGridPartState extends State<SimpleGridPart> {
  List<dynamic> data;

  Future<void> load() async {
    if(data!=null) return data;
    var d = await parseJsonFromAssets('assets/data.json');
    List<dynamic> list = d["data"] as List<dynamic>;
    data = list;
    return list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: load(),
        builder: (context, snapshot) {
          return JetGridWidget(
                        columns: [
                          JetColumn('Type of Actions'),
                          JetColumn('Last Purchased ',width: 200),
                          JetColumn('Value One'),
                          JetColumn('Value Two', width: 250),
                          JetColumn('From'),
                          JetColumn('Quantity')
                        ],
                      );
        });
  }

}
