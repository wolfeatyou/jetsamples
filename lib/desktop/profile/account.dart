import 'package:flutter/material.dart';
import 'package:jetkit/jetkit.dart';

import '../../account_form.dart';


class Account extends StatefulWidget {
  @override
  AccountSettingsState3 createState() => AccountSettingsState3();
}

class AccountSettingsState3 extends State<Account> {
  var expandedItems = {};
  var headerColor = Color(0xff5E6366);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    expandedItems[1] = true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
                padding: EdgeInsets.only(left: 52, right: 16, top: 32),
                child: JetRow(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Expanded(
                      flex: 75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          JetRow(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Expanded(
                                child: Container(
                                  height: 86,
                                  child: Text('Account settings', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 48, fontFamily:"Roboto" )),
                                ),
                              ),
                                Container(
                                  width: 80,
                                  child: Switch(
                                    activeColor: Color(0xff367BF5),
                                    onChanged: (c){},
                                    value: true,

                                  ),
                                )],
                            ),
                          JetExpansionPanel2(
                              headerBuilder: (c, expanded, hovered){
                                return Text(
                                  'Delivery address & Onhovered state',
                                  overflow: TextOverflow.ellipsis,
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
                                  overflow: TextOverflow.ellipsis,
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
                                  overflow: TextOverflow.ellipsis,
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
                                  overflow: TextOverflow.ellipsis,
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
                                  overflow: TextOverflow.ellipsis,
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
                                  overflow: TextOverflow.ellipsis,
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
                                  overflow: TextOverflow.ellipsis,
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
                                  overflow: TextOverflow.ellipsis,
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
                    Flexible(
                       flex: 25,
                      child: Container(
                        padding: EdgeInsets.only(top:26, left:42, right: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
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
