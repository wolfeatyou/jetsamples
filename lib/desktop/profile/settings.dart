import 'package:flutter/material.dart';
import 'package:jetkit/jetkit.dart';

import '../../account_form.dart';

class Settings extends StatefulWidget {
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  var expandedItems = {};
  var headerColor = Color(0xff5E6366);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //expandedItems[1] = true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 52, end: 16, top: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 75,
              child: Column(
                children: <Widget>[
                  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 86,
                        child: Text('User settings',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 48, fontFamily: "Roboto")),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: Switch(
                        activeColor: Color(0xff367BF5),
                        onChanged: (c) {},
                        value: true,
                      ),
                    )
                  ],
                    ),
                  JetExpansionPanel2(
                      headerBuilder: (c, expanded, hovered) {
                        return Text(
                          'Delivery address & Onhovered state',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: (expanded || hovered)
                                  ? Colors.black
                                  : Color(0xff5E6366),
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.15),
                        );
                      },
                      body: AccountForm()),
                  JetExpansionPanel2(
                      headerBuilder: (c, expanded, hovered) {
                        return Text(
                          'Delivery address & Onhovered state',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: (expanded || hovered)
                                  ? Colors.black
                                  : Color(0xff5E6366),
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.15),
                        );
                      },
                      body: AccountForm()),
                  JetExpansionPanel2(
                      isExpanded: true,
                      headerBuilder: (c, expanded, hovered) {
                        return Text(
                          'Delivery address & Onhovered state',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: (expanded || hovered)
                                  ? Colors.black
                                  : Color(0xff5E6366),
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.15),
                        );
                      },
                      body: AccountForm()),
                  JetExpansionPanel2(
                      headerBuilder: (c, expanded, hovered) {
                        return Text(
                          'Delivery address & Onhovered state',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: (expanded || hovered)
                                  ? Colors.black
                                  : Color(0xff5E6366),
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.15),
                        );
                      },
                      body: AccountForm()),
                  JetExpansionPanel2(
                      headerBuilder: (c, expanded, hovered) {
                        return Text(
                          'Delivery address & Onhovered state',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: (expanded || hovered)
                                  ? Colors.black
                                  : Color(0xff5E6366),
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.15),
                        );
                      },
                      body: AccountForm()),
                  JetExpansionPanel2(
                      headerBuilder: (c, expanded, hovered) {
                        return Text(
                          'Delivery address & Onhovered state',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: (expanded || hovered)
                                  ? Colors.black
                                  : Color(0xff5E6366),
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.15),
                        );
                      },
                      body: AccountForm()),
                  JetExpansionPanel2(
                      headerBuilder: (c, expanded, hovered) {
                        return Text(
                          'Delivery address & Onhovered state',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: (expanded || hovered)
                                  ? Colors.black
                                  : Color(0xff5E6366),
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.15),
                        );
                      },
                      body: AccountForm()),
                  JetExpansionPanel2(
                      headerBuilder: (c, expanded, hovered) {
                        return Text(
                          'Delivery address & Onhovered state',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: (expanded || hovered)
                                  ? Colors.black
                                  : Color(0xff5E6366),
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.15),
                        );
                      },
                      body: AccountForm()),
                ],
              ),
            ),
            if(MediaQuery.of(context).size.width>900) Expanded(
              flex: 25,
              child: Container(
                padding: EdgeInsetsDirectional.only(top: 26, start: 42, end: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    MenuList(
                      children: [
                        MenuListGroup("Settings"),
                        MenuListItem("Account", selected: true),
                        MenuListItem("Email"),
                        MenuListItem("Password"),
                        MenuListItem("Account"),
                        MenuListItem("Email notifications"),
                        MenuListItem("Billing & usages"),
                        MenuListItem("Team"),
                        MenuListItem("Security"),
                        MenuListItem("Domains"),
                        MenuListItem("Advanced"),
                        MenuListItem("Data"),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

    // TODO: implement build
    // throw UnimplementedError();
  }
}
