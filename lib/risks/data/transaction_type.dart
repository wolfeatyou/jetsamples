import 'package:flutter/cupertino.dart';

import 'base/observable_provider.dart';
import 'base/data_store_list.dart';
import 'card_type.dart';
import 'named_types.dart';

class TransactionType {
  final int uid;
  final String description;
  final double amount;

  TransactionType({this.description, this.amount, this.uid});
  static TransactionType fromJson(Map<String, dynamic> json) {
    return TransactionType(
        description: json['description'], amount: json['amount'], uid: json['uid']);
  }

  toJson(TransactionType card) {
    return {
      'description': card.description,
      'amount': card.amount,
      'uid': card.uid,
    };
  }

}


class TransactionProvider  {

  static ObservableProvider<TransactionType> cardTransactions({child}){
    return ObservableProvider<TransactionType>.list(
      child: child,
        get: TransactionProvider.getByCard
    );
  }

  static ObservableProvider<TransactionType> subTransactions({child}){
    return ObservableProvider<TransactionType>.list(
        child: child,
        get: TransactionProvider.getSubTransactions
    );
  }


  static ReadOperationType<TransactionType> getByCard(context, observe){
    var cardCode = observe(Take.valueOf<CardType>(context)?.value);
    var inst = observe(Take.valueOf<InstitutionType>(context)?.value);
    return () {
      return [
        TransactionType.fromJson(
            {"description": "Transaction for card $cardCode - $inst", "amount": 111.0, "uid": 0}),
        TransactionType.fromJson(
            {"description": "Transaction for card $cardCode", "amount": 222.0, "uid": 1}),
      ].toList();
    };
  }

  static ReadOperationType getSubTransactions(context, observe) {
    var cardCode = observe(Take.valueOf<CardType>(context)?.value);
   // int cardCode = 5;
    var tId = observe(Take.valueOf<TransactionType>(context)?.uid);
    var institution = observe(Take.valueOf<InstitutionType>(context)?.value);
    return () {
      return [
        TransactionType.fromJson(
            {"description": "Sub Transaction for $tId and inst $institution - $cardCode", "amount": 111.0, "uid": 0}),
        TransactionType.fromJson(
            {"description": "Sub Transaction for $tId and inst $institution", "amount": 222.0, "uid": 1}),
      ].toList();
    };
  }
}
