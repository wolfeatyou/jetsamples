import 'package:JetSamples/desktop/datagrid/grids/scrolled_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jetkit/jetkit.dart';

import 'kit_docs_module.dart';

class KitDocsIndex extends StatefulWidget {
  @override
  _KitDocsIndexState createState() => _KitDocsIndexState();
}

class _KitDocsIndexState extends State<KitDocsIndex> {
  final GlobalKey<NavigatorState> navigatorKey =
  new GlobalKey<NavigatorState>();

  Widget build(BuildContext context) {
    return Column(
      children: [
        JetToolbar(
            stylesBuilder: (w) {
              return JetToolbarStyles(
                  backgroundColor: Colors.white,
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffC6CACC))),
                  toolbarItemIconColor: Color(0xff78909C),
                  toolbarItemBackgroundColor: Colors.amberAccent,
                  toolbarItemSelectedIconColor: Colors.blue,
                  textSelectedColor: Colors.blue);
            },
            size: 72,
            direction: Axis.horizontal,
            children: <Widget>[
              Logo('Profile', Icon(Icons.keyboard)),
              Expanded(
                child: Container(),
              ),
              JetTabs.squareButtons(
                size: 60,
                theme: JetTabStyles(
                  padding: EdgeInsets.only(right: 8)
                ),
                items: [
                  JetTabEntry(text: 'Sent', icon: Icons.send),
                  JetTabEntry(text: 'Stats', icon: Icons.shop_two),
                  JetTabEntry(text: 'Apps', icon: Icons.apps)
                ],
              )
            ]),
        Expanded(
          child: JetRow(
            children: [

              JetPanel(
                color: Color(0xffF7F9FA),
                width: 350,
                title: 'Index',
                child: _buildNavigation(),
              ),
              Expanded(
                child: ClipRect(
                  //  child: IntrinsicHeight(
                  child: RouterOutlet(
                      navigatorKey: navigatorKey,
                      initialRoute: "/text_styles",
                      module: KitDocsModule()),
                  //),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _buildNavigation() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: NavPanel(
          onSelectedChanged: (value, ctx) {
            if (value != null) {
              navigatorKey.currentState.pushReplacementNamed(value);
            }
          },
          items: [
            NavPanelItem(
                text: 'Typography', value: "/text_styles", selected: true),
            NavPanelItem(
                text: 'Table',
                value: "/simple",
                child: NavPanel(items: [
                  NavPanelItem(text: 'Full featured table', value: '/full'),
                  NavPanelItem(
                    text: 'Scrolling',
                    child: NavPanel(items: [
                      NavPanelItem(text: 'Scrolling'),
                      NavPanelItem(text: 'Paging'),
                      NavPanelItem(text: 'Columns grouping')
                    ]),
                  ),
                  NavPanelItem(text: 'Paging'),
                  NavPanelItem(text: 'Columns grouping')
                ])),
            NavPanelItem(text: 'Get started'),
            NavPanelItem(text: 'Get started'),
            NavPanelItem(text: 'Get started'),
            NavPanelItem(text: 'Get started'),
            NavPanelItem(
                text: 'Get started', child: NavPanelItem(text: 'lalal')),
            NavPanelItem(
                text: 'Get started', child: NavPanelItem(text: 'lalal')),
            NavPanelItem(
                text: 'Get started', child: NavPanelItem(text: 'lalal')),
            NavPanelItem(
                text: 'Get started', child: NavPanelItem(text: 'lalal')),
            NavPanelItem(
                text: 'Get started', child: NavPanelItem(text: 'lalal')),
            NavPanelItem(
                text: 'Get started', child: NavPanelItem(text: 'lalal')),
            NavPanelItem(
                text: 'Get started', child: NavPanelItem(text: 'lalal')),
            NavPanelItem(
                text: 'Get started', child: NavPanelItem(text: 'lalal')),
            NavPanelItem(
                text: 'Get started', child: NavPanelItem(text: 'lalal')),
            NavPanelItem(
                text: 'Get started', child: NavPanelItem(text: 'lalal')),
            NavPanelItem(
                text: 'Get started', child: NavPanelItem(text: 'lalal')),
          ]),
    );
  }
}
