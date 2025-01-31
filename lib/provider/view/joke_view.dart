import 'package:flutter/material.dart';
import 'package:getx_joke/provider/global/service_locator.dart';
import 'package:getx_joke/provider/view/joke_view_model.dart';
import 'package:getx_joke/provider/view/widgets/gradient_background.dart';
import 'package:getx_joke/provider/view/widgets/translucent_panel.dart';
import 'package:provider/provider.dart';

class JokeView extends StatelessWidget {
  const JokeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool firstBuild = true;
    //final jokeViewModel = SL<JokeViewModel>();
    return Scaffold(
      body: GradientBackground(
        colors: [Colors.black, Colors.blue, Colors.black, Colors.purple],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TranslucentPanel(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Consumer<JokeViewModel>(
                              builder: (context, jokeViewModel, child) {
                            if (jokeViewModel.isLoading) {
                              return CircularProgressIndicator();
                            } else {
                              if (firstBuild) {
                                jokeViewModel.fetchJoke().then((error) {
                                  if (error != null) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      _showSnackbar(context, error);
                                    });
                                  }
                                });
                                firstBuild = false;
                              }
                              return SingleChildScrollView(
                                child: Text(
                                  jokeViewModel.joke,
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                              );
                            }
                          }),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TranslucentPanel(
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          Provider.of<JokeViewModel>(context, listen: false)
                              .fetchJoke()
                              .then((error) {
                            if (error != null) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _showSnackbar(context, error);
                              });
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          minimumSize: Size(double.infinity, double.infinity),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        child:
                            Text('Next Joke', style: TextStyle(fontSize: 24)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackbar(context, error) {
    var snackBar = SnackBar(
      content: Text(error),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
