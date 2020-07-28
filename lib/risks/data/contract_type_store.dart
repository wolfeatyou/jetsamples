import 'card_type.dart';
import 'contract_type.dart';
import 'base/data_store.dart';

class ContractTypeStore extends ObservableStore<ContractType> {
  ContractTypeStore.cardContracts({child})
      : super(
            child: child,
            get: (context, observe) {
              var cId = observe(Take.selected<CardType>(context).value);
              return () => ContractType.getByCard(cId);
            });
}
