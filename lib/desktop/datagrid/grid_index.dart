import 'package:JetSamples/desktop/datagrid/scrolled_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jetkit/jetkit.dart';

import 'datagrid_module.dart';


class GridIndex extends StatefulWidget {
  @override
  _GridIndexState createState() => _GridIndexState();
}

class _GridIndexState extends State<GridIndex> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Widget build(BuildContext context) {
    return JetRow(
      children: [
        Container(
          width: 350,
          child: JetPanel(
            title: 'Index',
            child: _buildNavigation(),
          )
        ),
        Expanded(
          child: RouterOutlet(
                    navigatorKey: navigatorKey,
                    initialRoute: "/simple",
                    module: DataGridModule()),
              )
      ],
    );
  }

  _buildNavigation(){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: NavPanel(items: [
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
      ]),
    );
  }
}
