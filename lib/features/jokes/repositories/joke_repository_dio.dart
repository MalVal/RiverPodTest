import 'package:dio/dio.dart';

import '../dto/joke.dart';
import 'joke_repository.dart';

class JokeRepositoryDio implements JokeRepository {
  JokeRepositoryDio(this._dio);

  final Dio _dio;

  @override
  Future<Joke> fetchRandomJoke() async {
    final response = await _dio.get<Map<String, dynamic>>(
      'https://official-joke-api.appspot.com/random_joke',
    );

    return Joke.fromJson(response.data!);
  }
}