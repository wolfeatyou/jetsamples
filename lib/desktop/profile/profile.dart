import 'package:JetSamples/desktop/profile/profile_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jetkit/jetkit.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  int idx = 0;
  dynamic selectedMenuItemValue;

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: JetToolbarTheme(
        styles: JetToolbarStyles(
            backgroundColor: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Color(0xffC6CACC)))),
        child: m.Column(mainAxisSize: MainAxisSize.min, children: [
          JetToolbar(size: 72, children: <Widget>[
            Logo('Profile', Icon(Icons.keyboard)),
            Expanded(
              child: Container(),
            ),
            Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.search,
                  size: 20,
                  color: Color(0xff78909C),
                )),
            Container(
              width: 150,
              height: 31,
              padding: EdgeInsets.only(right: 16),
              child: TextFormField(
                initialValue: "",
                style: m.TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: m.FontWeight.w300),
                obscureText: false,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8),
                    filled: false,
                    fillColor: m.Color(0xffF7F9FA),
                    border: m.OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: m.BorderSide(
                            width: 1, color: m.Color(0xffE3E5E6)))),
              ),
            ),
            FlatButton(
                onPressed: () => {},
                color: Color(0xff367BF5),
                child: Text('Go action!',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: "Roboto"))),
            RaisedButton(
              //clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 4,
              onPressed: () {},
              color: Colors.white,
              textColor: Colors.white,
              child: Icon(
                Icons.settings,
                size: 18,
                color: Color(0xff78909C),
              ),
              padding: EdgeInsets.all(0),
              shape: CircleBorder(),
            )
          ]),
          Flexible(
            child: JetRow(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (MediaQuery.of(context).size.width > 900)
                  Expanded(
                      flex: 20,
                      child: Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: Menu(
                          onSelectedChanged: (value, ctx) {
                            idx++;
                            if (value != null) {
                              navigatorKey.currentState
                                  .pushReplacementNamed(value);
                              //navigatorKey.currentState.pop(value);
                            } else {
                              if (idx % 2 == 0) {
                                //  ModalRoute.of(context).settings.name;
                                navigatorKey.currentState
                                    .pushReplacementNamed('/settings');
                              } else {
                                navigatorKey.currentState
                                    .pushReplacementNamed('/account');
                              }
                            }
                          },
                          children: [
                            MenuItem(
                              "Billing & Cards",
                              value: "/settings",
                              description: "Payment Methods",
                              iconData: Icons.payment,
                              iconColor: Colors.green,
                            ),
                            MenuItem(
                              "Account",
                              value: "/account",
                              selected: true,
                              description: "Userpic, name, password",
                              iconData: Icons.account_circle,
                              iconColor: Colors.blue,
                            ),
                            MenuItem(
                              "Notifications",
                              value: "/any_list",
                              description: "Email, desctop, mobile",
                              iconData: Icons.notifications,
                              iconColor: Colors.orange,
                            ),
                            MenuItem(
                              "Plans",
                              value: "/grid_index",
                              description: "Get more satisfaction",
                              iconData: Icons.calendar_today,
                              iconColor: Colors.red,
                            ),
                            MenuItem(
                              "Message shortcuts",
                              value: "/settings",
                              description: "Payment Methods",
                              iconData: Icons.message,
                              iconColor: Colors.blue,
                            ),
                            MenuItem(
                              "Website settings",
                              value: "/account",
                              description: "Manage landing page",
                              iconData: Icons.language,
                              iconColor: Colors.deepPurpleAccent,
                            ),
                            MenuItem(
                              "Availability",
                              value: "/settings",
                              description: "You're visible",
                              iconData: Icons.sim_card_alert,
                              iconColor: Colors.redAccent,
                            ),
                            MenuItem(
                              "Status page",
                              value: "/account",
                              description: "Dead or alive",
                              iconData: Icons.phone_in_talk,
                              iconColor: Colors.deepOrangeAccent,
                            ),
                            MenuItem(
                              "Helpdesk",
                              value: "/settings",
                              description: "Tikets for dummies",
                              iconData: Icons.help_outline,
                              iconColor: Color(0xff069697),
                            ),
                          ],
                        ),
                      )),
                if (true)

                  Expanded(
                    flex: 80,
                    child: ClipRect(
                      child: IntrinsicHeight(
                        //height: 2000,
                        child: RouterOutlet(
                            navigatorKey: navigatorKey,
                            initialRoute: "/settings",
                            module: ProfileModule()),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
