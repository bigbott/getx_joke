import 'package:flutter/material.dart';
import 'package:getx_joke/inherited_widget/home_view_model.dart';
import 'package:getx_joke/inherited_widget/view_model_provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ViewModel viewModel = SL<ViewModel>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: viewModel.increment, child: Text('increment'))
          ],
        ),
      ),
    );
  }
}
