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

class Push<T> extends StatelessWidget{
  final Widget child;
  final ReadOperationObservable read;
  final UpdateOperationObservable update;
  final CustomOperationObservable custom;
  Push({this.child, this.read, this.update, this.custom});

  @override
  Widget build(BuildContext context) {
    return Observer(
      name: "DataContext observer $T",
      builder: (context) {
        ReadOperationType<T> readOperation = this.read!=null?this.read(context):null;
        UpdateOperationType<T> updateOperation = this.update!=null?this.update(context):null;
        CustomOperationType<T> customOperation = this.custom!=null?this.custom(context):null;
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

class Pull{

  static DataStoreList<T> store<T>(BuildContext context){
    return Push._of<T>(context);
  }

  static T selected<T>(BuildContext context){
    return Push._of<T>(context).selected;
  }

}
