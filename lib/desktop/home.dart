import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jetkit/app/material_theme/palette.dart';
import 'package:jetkit/jetkit.dart';
import 'home_tabs_module.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Widget build(BuildContext context) {
    return JetApp(
      child: JetRouter(
        child: Column(
          children: [
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    JetToolbar(
                      direction: Axis.vertical,
                      size: 88,
                      color: Color(0xff3E4345),
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
                        Tabs.squareButtonsTabs(
                          size: 84,
                          direction: Axis.vertical,
                          itemScheme: JetButtonColorScheme.whiteScheme(MaterialJetThemePalette.defaultPalette()).scheme,
                          tabs: [
                            JetTab(text: 'Messages', icon: Icons.message,  value: 'kit_docs_index'),
                            JetTab(text: 'Stats', icon: Icons.shop_two,  value: 'profile'),
                            JetTab(text: 'Apps', icon: Icons.apps),
                            JetTab(
                                text: "Tasks", icon: Icons.assignment_turned_in),
                            JetTab(text: "Sent", icon: Icons.send),
                            JetTab(text: "Stats", icon: Icons.shop_two),
                            JetTab(text: "Apps", icon: Icons.apps),
                          ],
                          onSelect: (value, ctx){
                            if(value !=null ) navigatorKey.currentState.pushReplacementNamed(value);
                          }
                        )
                      ],
                    ),
                    /*Expanded(
                      child: ClipRect(
                        child: JetRoute(builder: (String path) {
                          switch (path) {
                            case 'profile':
                              return Profile();
                            case 'kit_docs_index':
                              return KitDocsIndex();
                          }
                          return Text('empty route');
                        }),
                      ),
                    ),*/
                    Expanded(
                        child: ClipRect(
                      child: RouterOutlet(
                          navigatorKey: navigatorKey,
                          initialRoute: "/kit_docs_index",
                          module: HomeTabsModule()),
                    ))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
