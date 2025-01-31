import 'package:flutter/material.dart';
import 'package:getx_joke/inherited_widget/home_view.dart';
import 'package:getx_joke/inherited_widget/home_view_model.dart';
import 'package:getx_joke/inherited_widget/view_model_provider.dart';




void main() {
  runApp(
    ViewModelProvider(
      viewModel: ViewModel(),
      child: MaterialApp(
        home: HomeView(),
      ),
    ),
  );
}
