import 'package:getx_joke/nopackage/global/service_locator.dart';
import 'package:getx_joke/nopackage/model/joke_service.dart';
import 'package:getx_joke/nopackage/view/joke_view_model.dart';
import 'package:test/test.dart';

void main() {
  test('joke should not be empty after fetchJoke() is called',
      () async {
    // Arrange
     SL.registerLazySingleton<JokeService>(() => JokeService());
    var viewModel = JokeViewModel();

    // Act
    await viewModel.fetchJoke();

    // Assert
    expect(viewModel.joke == '', false);
  });
}
