
import 'package:flutter/material.dart';
import 'package:jetgrid/column.dart';
import 'package:jetgrid/data_grid.dart';
import 'package:jetkit/app/app.dart';


import 'loader.dart';

void main() {
  runApp(JetApp(child:ScrolledGridSample()));
}

class ScrolledGridSample extends StatefulWidget {
  @override
  _ScrolledGridSampleState createState() => _ScrolledGridSampleState();
}

class _ScrolledGridSampleState extends State<ScrolledGridSample> {
  List<dynamic> data;

  Future<void> load() async {
    var d = await parseJsonFromAssets('assets/data.json');
    List<dynamic> list = d["data"] as List<dynamic>;
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
              return Container(
                height: 575,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(width: 1, color: Color(0xffE3E5E5)))
                ),
                child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(0),
                          // paddings: Edge
                          child: JetGridWidget(
                            columns: [
                              JetColumn('Coll 01',
                                  freezePosition: FreezePosition.Left, group: 'Group 0'),
                              JetColumn('Coll Long long long long text ',
                                  width: 200,
                                  freezePosition: FreezePosition.Left, group: 'Group 0'),
                              JetColumn('Coll 03'),
                              JetColumn('Coll 04',
                                  group: 'Group1', width: 250),
                              JetColumn('Coll 05', group: 'Group1'),
                              JetColumn('Coll 06'),
                              JetColumn('Coll 07 middle text'),
                              JetColumn('Coll 08', width: 250)
                            ],
                          ),
                        ),
                      )
                    ]
                ),
              );
            });
  }

}
