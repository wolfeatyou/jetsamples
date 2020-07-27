import 'package:JetSamples/risks/data/institution_type.dart';
import 'package:JetSamples/risks/transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jetkit/jetkit.dart';
import 'data/base/data_store.dart';
import 'data/card_type.dart';
import 'data/transaction_type.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {

  int _rebuilds;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _rebuilds = 0;
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return JetPanel(
        child: Column(
      children: [
        JetToolbar(
          color: Colors.lightBlue,
          size: 70,
          children: [
            Logo('Cards', icon: Icons.apps),
            Expanded(child: Container()),
            Text('rebuilds: $_rebuilds'),
            FlatButton(
              child: Text('rebuild'),
              onPressed: (){
                setState(() {
                  _rebuilds = _rebuilds + 1;
                });
              },
            ),
            FlatButton(
              child: Text('ok'),
              onPressed: (){
                var val = Take.selected<InstitutionType>(context);
                if(val!=null) {
                  if (val.value == 555) {
                    val.setValue
                        .call([333]);
                  }
                  else {
                    val.setValue
                        .call([555]);
                  }
                }
              },
            ),
            FlatButton(
              child: Text('ok _ no'),
              onPressed: (){
                var val = Take.selected<InstitutionType>(context);
                if(val!=null) {
                  val.setValue
                      .call([val.value]);
                }
              },
            )
          ],
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Menu(
                    onSelectedChanged: (value, ctx) {
                      Take.list<CardType>(context).setSelectedIndex(value);
                    },
                    children: Take.list<CardType>(context)
                        .items
                        .map((e) => MenuItem(e.name,
                            value: e.value,
                            description: "description...",
                            iconData: Icons.payment))
                        .toList()),
              ),
              Expanded(
                flex: 2,
                child: ObservableProvider<TransactionType>(
                    get: (context, observe) {
                      var c = observe(Take.selected<CardType>(context).value);
                      var i = observe(Take.selected<InstitutionType>(context).value);
                      return () => TransactionType.getByCardCode(c, i);
                    },
                    child:Row(
                          children: [
                           Expanded(flex: 1, child: Transactions()),
                            Expanded(
                                flex: 1,
                                child: ObservableProvider<TransactionType>(
                                    get: (context, observe) {
                                       var c = observe(Take.selected<CardType>(context).value);
                                       var t = observe(Take.selected<TransactionType>(context)?.uid);
                                       var i = observe(Take.selected<InstitutionType>(context)?.value);
                                          return () =>
                                          TransactionType.getRelated(t, i, c);
                                    },
                                    child: Column(
                                      children: [
                                        Expanded(flex:1, child: Transactions()),
                                        Expanded(flex:1, child: Transactions())
                                      ],
                                    )))
                          ],
                        )

                    ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
