import 'package:flutter/material.dart';
import 'package:getx_joke/provider/model/joke_model.dart';
import 'package:getx_joke/provider/global/service_locator.dart';
import 'package:getx_joke/provider/model/joke_service.dart';
import 'package:getx_joke/provider/model/joke_service_interface.dart';

class JokeViewModel with ChangeNotifier {
  JokeServiceInterface jokeService;
  JokeViewModel({required this.jokeService});
  var joke = '';
  var isLoading = false;

  Future<String?> fetchJoke() async {
    String? error;
    isLoading = true;
    notifyListeners();
    JokeModel jokeModel = await jokeService.fetchJoke();
    if (jokeModel.joke != null) {
      joke = jokeModel.joke!;
    } else {
      error = jokeModel.error;
    }
    isLoading = false;
    notifyListeners();
    return error;
  }
}
