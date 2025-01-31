


import 'package:get_it/get_it.dart';
import 'package:getx_joke/provider/model/joke_service.dart';
import 'package:getx_joke/provider/model/joke_service_interface.dart';
import 'package:getx_joke/provider/view/joke_view_model.dart';

final SL = GetIt.instance;
final class ServiceLocator {
  ServiceLocator._();
  
  static void createInstances() {
    SL.registerLazySingleton<JokeServiceInterface>(() => JokeService());
  }
}
