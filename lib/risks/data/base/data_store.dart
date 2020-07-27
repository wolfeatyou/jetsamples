import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'data_store_list.dart';

typedef ReadOperationType<T> ReadOperationObservable<T>(BuildContext context, Map<String, dynamic> rels);
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
    return true;
    //return data != oldWidget.data;
  }


}

class ObservableProvider<T> extends StatefulWidget{
  final Widget child;
  final ReadOperationObservable get;
  final UpdateOperationObservable set;
  final CustomOperationObservable run;
  ObservableProvider({this.child, this.get, this.set, this.run});

  @override
  _ObservableProviderState<T> createState() => _ObservableProviderState<T>();

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

class _ObservableProviderState<T> extends State<ObservableProvider<T>> {
  DataStoreList<T> store;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context_out) {

    if(store == null){
      Map<String, dynamic> props = {};
      ReadOperationType<T> readOperation = this.widget.get!=null?this.widget.get(context, props):null;
      UpdateOperationType<T> updateOperation = this.widget.set!=null?this.widget.set(context):null;
      CustomOperationType<T> customOperation = this.widget.run!=null?this.widget.run(context):null;

      store = DataStoreList<T>(onRead: readOperation,
          props: props,
          onUpdate: updateOperation,
          onCustom: customOperation,
          context: context);
    }

        return Observer(
          builder: (context) {
            Map<String, dynamic> props = {};
            ReadOperationType<T> readOperation = this.widget.get!=null?this.widget.get(context, props):null;
            store.onRead = readOperation;
            store.setProps(props);
            return DataContextInherited<T>(
              data: store,
              child: widget.child,
            );
          }
        );
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
