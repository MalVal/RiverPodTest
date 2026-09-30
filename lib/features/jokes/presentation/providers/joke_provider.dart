import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/Joke.dart';
import '../../data/repositories/joke_repository_dio.dart';
import '../../domain/repositories/joke_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final jokeRepositoryProvider = Provider<JokeRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return JokeRepositoryDio(dio);
});

final randomJokeProvider = FutureProvider<Joke>((ref) async {
  final repository = ref.watch(jokeRepositoryProvider);
  return repository.fetchRandomJoke();
});
