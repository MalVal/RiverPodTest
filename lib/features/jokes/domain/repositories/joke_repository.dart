import '../../data/models/Joke.dart';

abstract interface class JokeRepository {
  Future<Joke> fetchRandomJoke();
}