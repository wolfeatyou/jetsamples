import 'card_type.dart';
import 'contract_type.dart';
import 'institution_type.dart';
import 'transaction_type.dart';
import 'base/data_store.dart';

class TransactionTypeStore extends ObservableStore<TransactionType> {

  TransactionTypeStore.cardTransactions({child})
      : super(
            child: child,
            get: TransactionType.getByCard);

  TransactionTypeStore.subTransactions({child})
      : super(
      child: child,
      get: TransactionType.getSubTransactions);
}