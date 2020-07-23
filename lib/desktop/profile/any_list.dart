

import 'package:JetSamples/desktop/datagrid/grids/scrolled_grid.dart';
import 'package:flutter/material.dart';

class AnyList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsetsDirectional.only(start:48, end: 48, top:48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
                child: Text('Notifications', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 48, fontFamily:"Roboto" ))),
            ScrolledGridSample(),
          ],
        ));
  }

}