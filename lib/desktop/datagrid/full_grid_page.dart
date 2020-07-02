import 'package:flutter/material.dart';
import 'package:jetkit/jetkit.dart';
import 'grids/full_grid.dart';

class FullGridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return JetPanel(
        color: Color(0xffF7F9FA),
        title: "Full featured grid",
        child: ListView(children: [
          Container(
            child: JetCard(
              color: Color(0xffF7F9FA),
              child: RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Each column in the grid is defined using a column definition. Columns are positioned in the grid according to the order the ColDefs are specified in the grid options.\n', style: Theme.of(context).textTheme.subtitle1 ),
                    TextSpan(text: 'The following example shows a simple grid with 3 columns defined', style: Theme.of(context).textTheme.subtitle1 ),

                  ],
                ),
              ),
            ),
          ),
          Container(height: 700, child: JetCard.list(
              padding: EdgeInsets.all(0),
              child: /*Text('sdds')*/FullGridPart()))
        ]));
  }
}
