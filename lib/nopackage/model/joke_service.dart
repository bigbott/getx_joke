

import 'package:dio/dio.dart';
import 'package:getx_joke/nopackage/model/joke_model.dart';
import 'package:getx_joke/nopackage/model/joke_service_interface.dart';

class JokeService implements JokeServiceInterface {
  final String url = 'https://v2.jokeapi.dev/joke/Programming?format=json&type=single';
  final Dio _dio = Dio();

  @override
  Future<JokeModel> fetchJoke() async {
    try {
      final response = await _dio.get(url);
      
      if (response.statusCode == 200) {
        return JokeModel(joke: response.data['joke']);
      } else {
        return JokeModel(error: 'Error: Failed to load joke');
      }
    } on DioException catch (e) {
      return JokeModel(error: 'DioError: ${e.message}');
    } catch (e) {
      return JokeModel(error: 'Error: $e');
    }
  }
}