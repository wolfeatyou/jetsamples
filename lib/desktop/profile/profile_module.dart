import 'package:JetSamples/desktop/kit/kit_docs_index.dart';
import 'package:JetSamples/desktop/profile/any_list.dart';
import 'package:JetSamples/desktop/profile/settings.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'account.dart';


class ProfileModule extends ChildModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router("/account", child: (_, args) => Account(), transition: TransitionType.leftToRight),
    Router("/settings", child: (_, args) => Settings(), transition: TransitionType.leftToRight),
    Router("/any_list", child: (_, args) => AnyList(), transition: TransitionType.leftToRight),
    Router("/grid_index", child: (_, args) => KitDocsIndex(), transition: TransitionType.leftToRight)

  ];

  static Inject get to => Inject<ProfileModule>.of();
}