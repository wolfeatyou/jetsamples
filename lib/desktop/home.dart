
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jetkit/jetkit.dart';

import 'home_tabs_module.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Widget build(BuildContext context) {
    return JetApp(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JetToolbar(
              direction: Axis.vertical,
              size: 88,
              color: Color(0xff3E4345),
              onSelectedChanged: (value){
                print('fff');
                print(value);
                if (value != null) {
                  //navigatorKey.currentState.popUntil((route) => false);
                  navigatorKey.currentState.pushReplacementNamed(value);
                }
              },
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 38),
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.indigoAccent,
                    child: Icon(
                      Icons.edit,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(10.0),
                    shape: CircleBorder(),
                  ),
                ),
                JetToolbarItem(label: "Messages", icon: Icons.message, value: 'kit_docs_index'),
                JetToolbarItem(
                    label: "Groups", icon: Icons.group, selected: true, value: 'profile',),
                JetToolbarItem(label: "Tasks", icon: Icons.assignment_turned_in),
                JetToolbarItem(label: "Sent", icon: Icons.send),
                JetToolbarItem(label: "Stats", icon: Icons.shop_two),
                JetToolbarItem(label: "Apps", icon: Icons.apps),
              ],
            ),
            Expanded(
              child:ClipRect(
                child: RouterOutlet(
                    navigatorKey: navigatorKey,
                    initialRoute: "/kit_docs_index",
                    module: HomeTabsModule()
                ),
              )
            )
          ]),
    );
  }
}