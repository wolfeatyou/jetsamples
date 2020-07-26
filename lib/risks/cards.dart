import 'package:JetSamples/risks/data/institution_type.dart';
import 'package:JetSamples/risks/transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jetkit/jetkit.dart';
import 'data/base/data_store.dart';
import 'data/card_type.dart';
import 'data/transaction_type.dart';

class Cards extends StatelessWidget {
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
            FlatButton(
              child: Text('ok'),
              onPressed: (){
                var val = Take.selected<InstitutionType>(context);
                if(val.value == 555) {
                  val.setValue
                      .call([333]);
                }
                else{
                      val.setValue
                      .call([555]);
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
                    get: (context) {
                      int cardCode = Take.selected<CardType>(context).value;
                      var institution = Take.selected<InstitutionType>(context)?.value;
                      return () => TransactionType.getByCardCode(cardCode, institution);
                    },
                    child:Row(
                          children: [
                            Expanded(flex: 1, child: Transactions()),
                            Expanded(
                                flex: 1,
                                child: ObservableProvider<TransactionType>(
                                    get: (context) {
                                      int cardCode = Take.selected<CardType>(context).value;
                                      var transactionId =
                                          Take.selected<TransactionType>(context)?.uid;
                                      var institution = Take.selected<InstitutionType>(context)?.value;
                                      return () =>
                                          TransactionType.getRelated(transactionId, institution, cardCode);
                                    },
                                    child: Transactions()))
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
