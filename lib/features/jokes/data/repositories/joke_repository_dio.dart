import 'package:dio/dio.dart';

import '../dto/joke_dto.dart';
import '../models/Joke.dart';
import '../../domain/repositories/joke_repository.dart';

class JokeRepositoryDio implements JokeRepository {
  JokeRepositoryDio(this._dio);

  final Dio _dio;

  @override
  Future<Joke> fetchRandomJoke() async {
    final response = await _dio.get<Map<String, dynamic>>(
      'https://official-joke-api.appspot.com/random_joke',
    );

    final dto = JokeDto.fromJson(response.data!);

    return Joke(
      setup: dto.setup,
      punchline: dto.punchline,
    );
  }
}