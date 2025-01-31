import 'package:flutter/material.dart';
import 'package:getx_joke/nopackage/view/joke_view.dart';

final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const JokeView(), maintainState: false),
                  );
                },
                child: Text('Joke view'))
          ],
        ),
      ),
    );
  }
}
