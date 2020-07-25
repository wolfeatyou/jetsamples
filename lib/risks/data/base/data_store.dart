import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'data_store_list.dart';

typedef ReadOperationType<T> ReadOperationObservable<T>(BuildContext context);
typedef UpdateOperationType<T> UpdateOperationObservable<T>(BuildContext context);
typedef CustomOperationType<T> CustomOperationObservable<T>(BuildContext context);

typedef List<T> ReadOperationType<T>();
typedef void UpdateOperationType<T>(T value);
typedef void CustomOperationType<T>(T value, String actionName);

class DataContextInherited<T> extends InheritedWidget {
  final DataStoreList<T> data;

  DataContextInherited(
      {Widget child,
        this.data,
      UpdateOperationType<T> update,
      CustomOperationType<T> action,
      ReadOperationType<T> read}) : super(child: child);

  @override
  bool updateShouldNotify(DataContextInherited oldWidget) {
    return data != oldWidget.data;
  }


}

class ObservableProvider<T> extends StatelessWidget{
  final Widget child;
  final ReadOperationObservable get;
  final UpdateOperationObservable set;
  final CustomOperationObservable run;
  ObservableProvider({this.child, this.get, this.set, this.run});

  @override
  Widget build(BuildContext context) {
    return Observer(
      name: "DataContext observer $T",
      builder: (context) {
        ReadOperationType<T> readOperation = this.get!=null?this.get(context):null;
        UpdateOperationType<T> updateOperation = this.set!=null?this.set(context):null;
        CustomOperationType<T> customOperation = this.run!=null?this.run(context):null;
        return DataContextInherited<T>(
          data: DataStoreList<T>(onRead: readOperation, onUpdate: updateOperation, onCustom: customOperation, context: context),
          child: child,
        );
      }
    );
  }

  static DataStoreList<T> _of<T>(BuildContext context) {
    final DataContextInherited inh =
    context.dependOnInheritedWidgetOfExactType<DataContextInherited<T>>();
    DataStoreList<T> data = inh?.data;
    if (data == null) {
      throw 'Data store not defined in hierarchy';
    }
    return data;
  }
}

class ObservableProviders extends StatelessWidget{
  final List<DataStoreList> list;
  ObservableProviders({this.list, child});

  @override
  Widget build(BuildContext context) {
     throw "not implemented";
  }
}
class Take{

  static DataStoreList<T> list<T>(BuildContext context){
    return ObservableProvider._of<T>(context);
  }

  static T selected<T>(BuildContext context){
    return ObservableProvider._of<T>(context).selected;
  }

}
