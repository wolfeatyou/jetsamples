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
    return JetRow(
      children: [
        JetPanel(
          width: 350,
          title: 'Index',
          child: _buildNavigation(),
        ),
        Expanded(
          child: ClipRect(
            child: RouterOutlet(
                navigatorKey: navigatorKey,
                initialRoute: "/text_styles",
                module: KitDocsModule()),
          ),
        )
      ],
    );
  }

  _buildNavigation() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: NavPanel(
          onSelectedChanged: (value) {
            if (value != null) {
              navigatorKey.currentState.pushReplacementNamed(value);
            }
          },
          items: [
            NavPanelItem(text: 'Typography', value: "/text_styles", selected: true),
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
