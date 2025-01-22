


import 'package:flutter/material.dart';
import 'package:getx_joke/nopackage/model/joke_model.dart';
import 'package:getx_joke/nopackage/model/joke_service_interface.dart';

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
      // Get.snackbar(
      //   'Oops',
      //   jokeModel.error!,
      //   colorText: Colors.white,
      //   backgroundColor: Colors.blue.shade800,
      //   icon: const Icon(Icons.add_alert),
      // );
      error = jokeModel.error;
    }
    isLoading = false;
    notifyListeners();
    return error;
  }
  
}