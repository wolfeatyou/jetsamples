import 'package:mobx/mobx.dart';
import 'data_store.dart';
part 'data_store_list.g.dart';

class DataStoreList<T> = _DataStoreList<T> with _$DataStoreList;

abstract class _DataStoreList<T> with Store {
  final OnReadType<T> onRead;
  final OnUpdateType<T> onUpdate;

  @observable
  int selectedIndex = 0;

  _DataStoreList({this.onRead, this.onUpdate});

  @computed
  List<T> get items {
    if (onRead != null) {
      return onRead();
    }
    return [];
  }

  @computed
  T get selected {
    var list = items;
    if (list.length > 0) {
      return list[selectedIndex];
    }
    return null;
  }

  @action
  void setSelectedIndex(value) {
    selectedIndex = value;
  }
}
