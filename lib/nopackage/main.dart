import 'package:flutter/material.dart';
import 'package:getx_joke/nopackage/global/service_locator.dart';
import 'package:getx_joke/nopackage/view/joke_view.dart';



void main() {
  ServiceLocator.createInstances();
  runApp(
    MaterialApp(
      home: JokeView(),
    ),
  );
}
