import 'package:flutter/material.dart';
import 'package:jetkit/jetkit.dart';


class GridIndex extends StatefulWidget {
  @override
  _GridIndexState createState() => _GridIndexState();
}

class _GridIndexState extends State<GridIndex> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Widget build(BuildContext context) {
    return  NavPanel(items: [
      NavPanelItem(text: 'Get started'),
      NavPanelItem(
          text: 'Data Grid',
          child: NavPanel(items: [
            NavPanelItem(
              text: 'Scrolling',
              child: NavPanel(items: [
                NavPanelItem(text: 'Scrolling'),
                NavPanelItem(text: 'Paging'),
                NavPanelItem(
                    text: 'Columns grouping')
              ]),
            ),
            NavPanelItem(text: 'Paging'),
            NavPanelItem(
                text: 'Columns grouping')
          ])),
      NavPanelItem(text: 'Get started'),
      NavPanelItem(text: 'Get started'),
      NavPanelItem(text: 'Get started'),
      NavPanelItem(text: 'Get started'),
      NavPanelItem(text: 'Get started',
          child:NavPanelItem(text:'lalal')),
      NavPanelItem(text: 'Get started',
          child:NavPanelItem(text:'lalal')),
      NavPanelItem(text: 'Get started',
          child:NavPanelItem(text:'lalal')),
      NavPanelItem(text: 'Get started',
          child:NavPanelItem(text:'lalal')),
      NavPanelItem(text: 'Get started',
          child:NavPanelItem(text:'lalal')),
      NavPanelItem(text: 'Get started',
          child:NavPanelItem(text:'lalal')),
      NavPanelItem(text: 'Get started',
          child:NavPanelItem(text:'lalal')),
      NavPanelItem(text: 'Get started',
          child:NavPanelItem(text:'lalal')),
      NavPanelItem(text: 'Get started',
          child:NavPanelItem(text:'lalal')),
      NavPanelItem(text: 'Get started',
          child:NavPanelItem(text:'lalal')),
      NavPanelItem(text: 'Get started',
          child:NavPanelItem(text:'lalal')),
    ]);
  }
}
