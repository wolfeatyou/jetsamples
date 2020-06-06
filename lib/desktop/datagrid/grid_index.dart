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
    return JetRow(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.only(left: 32),
                child: Row(
                  children: [
                    Label(
                      "Index",
                      width: 20,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _buildNavigation(),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(),
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
