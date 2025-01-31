

import 'package:getx_joke/provider/model/joke_model.dart';

abstract interface class JokeServiceInterface {
  Future<JokeModel> fetchJoke();
}