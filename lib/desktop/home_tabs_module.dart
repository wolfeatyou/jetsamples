import 'package:JetSamples/desktop/kit/kit_docs_index.dart';
import 'package:JetSamples/desktop/profile/profile.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home.dart';


class HomeTabsModule extends MainModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router("/profile", child: (_, args) => Profile(), transition: TransitionType.leftToRight),
    Router("/kit_docs_index", child: (_, args) => KitDocsIndex(), transition: TransitionType.leftToRight)
  ];

  static Inject get to => Inject<HomeTabsModule>.of();

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => Home();
}