import 'package:flutter/cupertino.dart';

import 'base/data_store.dart';
import 'base/data_store_list.dart';
import 'card_type.dart';
import 'institution_type.dart';

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

  static ObservableStore<TransactionType> cardTransactions({child}){
    return ObservableStore<TransactionType>(
      child: child,
        get: TransactionProvider.getByCard
    );
  }

  static ObservableStore<TransactionType> subTransactions({child}){
    return ObservableStore<TransactionType>(
        child: child,
        get: TransactionProvider.getSubTransactions
    );
  }

  static ReadOperationType getByCard(context, observe){
    var cardCode = observe(Take.selectedOf<CardType>(context).value);
    var inst = observe(Take.selectedOf<InstitutionType>(context).value);
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
    var cardCode = observe(Take.selectedOf<CardType>(context).value);
    var tId = observe(Take.selectedOf<TransactionType>(context)?.uid);
    var institution = observe(Take.selectedOf<InstitutionType>(context)?.value);
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
