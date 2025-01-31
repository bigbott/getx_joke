import 'package:flutter/material.dart';
import 'package:getx_joke/provider/global/service_locator.dart';
import 'package:getx_joke/provider/model/joke_service_interface.dart';
import 'package:getx_joke/provider/view/joke_view.dart';
import 'package:getx_joke/provider/view/joke_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  ServiceLocator.createInstances();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                JokeViewModel(jokeService: SL<JokeServiceInterface>())),
      ],
      child: MaterialApp(
        home: JokeView(),
      ),
    ),
  );
}
