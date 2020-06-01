import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart';
import 'package:jetkit/jetkit.dart';

import '../../account_form.dart';


class Account extends StatefulWidget {
  @override
  AccountSettingsState3 createState() => AccountSettingsState3();
}

class AccountSettingsState3 extends State<Account> {
  var expandedItems = {};
  var headerColor = m.Color(0xff5E6366);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    expandedItems[1] = true;
  }

  @override
  Widget build(BuildContext context) {
    return m.SingleChildScrollView(
      child: m.Padding(
                padding: m.EdgeInsets.only(left: 52, right: 16, top: 32),
                child: JetRow(
                  children:[
                    Expanded(
                      flex: 75,
                      child: m.Column(
                        children: <Widget>[
                          m.ConstrainedBox(
                            constraints:BoxConstraints(
                                maxWidth: 775
                            ),
                            child: Row(
                              crossAxisAlignment: m.CrossAxisAlignment.start,
                              children: [Expanded(
                                child: m.Container(
                                  height: 86,
                                  child: m.Text('Account settings', overflow: m.TextOverflow.ellipsis, style: m.TextStyle(fontSize: 48, fontFamily:"Roboto" )),
                                ),
                              ),
                                m.Container(
                                  width: 80,
                                  child: m.Switch(
                                    activeColor: Color(0xff367BF5),
                                    onChanged: (c){},
                                    value: true,

                                  ),
                                )],
                            ),
                          ),
                          JetExpansionPanel2(
                              headerBuilder: (c, expanded, hovered){
                                return Text(
                                  'Delivery address & Onhovered state',
                                  overflow: m.TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: (expanded || hovered)? Colors.black : Color(0xff5E6366),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.15),
                                );
                              },
                              body: AccountForm()
                          ),JetExpansionPanel2(
                              headerBuilder: (c, expanded, hovered){
                                return Text(
                                  'Delivery address & Onhovered state',
                                  overflow: m.TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: (expanded || hovered)? Colors.black : Color(0xff5E6366),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.15),
                                );
                              },
                              body: AccountForm()
                          ),JetExpansionPanel2(
                              headerBuilder: (c, expanded, hovered){
                                return Text(
                                  'Delivery address & Onhovered state',
                                  overflow: m.TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: (expanded || hovered)? Colors.black : Color(0xff5E6366),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.15),
                                );
                              },
                              body: AccountForm()
                          ),JetExpansionPanel2(
                              headerBuilder: (c, expanded, hovered){
                                return Text(
                                  'Delivery address & Onhovered state',
                                  overflow: m.TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: (expanded || hovered)? Colors.black : Color(0xff5E6366),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.15),
                                );
                              },
                              body: AccountForm()
                          ),JetExpansionPanel2(
                              headerBuilder: (c, expanded, hovered){
                                return Text(
                                  'Delivery address & Onhovered state',
                                  overflow: m.TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: (expanded || hovered)? Colors.black : Color(0xff5E6366),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.15),
                                );
                              },
                              body: AccountForm()
                          ),JetExpansionPanel2(
                              headerBuilder: (c, expanded, hovered){
                                return Text(
                                  'Delivery address & Onhovered state',
                                  overflow: m.TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: (expanded || hovered)? Colors.black : Color(0xff5E6366),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.15),
                                );
                              },
                              body: AccountForm()
                          ),JetExpansionPanel2(
                              headerBuilder: (c, expanded, hovered){
                                return Text(
                                  'Delivery address & Onhovered state',
                                  overflow: m.TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: (expanded || hovered)? Colors.black : Color(0xff5E6366),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.15),
                                );
                              },
                              body: AccountForm()
                          ),JetExpansionPanel2(
                              headerBuilder: (c, expanded, hovered){
                                return Text(
                                  'Delivery address & Onhovered state',
                                  overflow: m.TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: (expanded || hovered)? Colors.black : Color(0xff5E6366),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.15),
                                );
                              },
                              body: AccountForm()
                          ),
                        ],
                      ),
                    ),
                    JaExpanded(
                      minRowWidth: 800,
                      flex: 25,
                      child: m.Container(
                        padding: m.EdgeInsets.only(top:26, left:42, right: 0),
                        child: m.Column(
                          mainAxisAlignment: m.MainAxisAlignment.start,
                          children: <m.Widget>[
                            MenuList(
                              children: [
                                MenuListGroup("Settings"),
                                MenuListItem("Account", selected:true),
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
