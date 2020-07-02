import 'package:JetSamples/desktop/datagrid/grids/scrolled_grid.dart';
import 'package:JetSamples/desktop/datagrid/simple_grid_page.dart';
import 'package:JetSamples/desktop/kit/text_styles_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../datagrid/full_grid_page.dart';


class KitDocsModule extends ChildModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router("/text_styles", child: (_, args) => TextStylesPage(),  transition: TransitionType.leftToRight),
    Router("/simple", child: (_, args) => SimpleGridPage(),  transition: TransitionType.leftToRight),
    Router("/full", child: (_, args) => FullGridPage(), transition: TransitionType.leftToRight),

  ];

  static Inject get to => Inject<KitDocsModule>.of();
}