import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:getx_joke/inherited_widget/home_view_model.dart';

class ViewModelProvider extends InheritedWidget {
  const ViewModelProvider({
    super.key,
    required this.viewModel,
    required super.child,
  });

  final ViewModel viewModel;

  static ViewModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ViewModelProvider>();
  }

  @override
  bool updateShouldNotify(ViewModelProvider oldWidget) {
    return oldWidget.viewModel != viewModel;
  }
}

final SL = GetIt.instance;

final class ServiceLocator {
  ServiceLocator._();

  static void createInstances() {
    SL.registerLazySingleton<ViewModel>(() => ViewModel());
  }
}
