import 'package:JetSamples/desktop/datagrid/scrolled_grid.dart';
import 'package:JetSamples/desktop/datagrid/simple_grid_sample.dart';
import 'package:flutter_modular/flutter_modular.dart';


class DataGridModule extends ChildModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router("/simple", child: (_, args) => SimpleGridSample(), transition: TransitionType.leftToRight),
  ];

  static Inject get to => Inject<DataGridModule>.of();
}