

import 'package:getx_joke/nopackage/model/joke_model.dart';

abstract interface class JokeServiceInterface {
  Future<JokeModel> fetchJoke();
}