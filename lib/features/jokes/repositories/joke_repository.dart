import '../dto/joke.dart';

abstract interface class JokeRepository {
  Future<Joke> fetchRandomJoke();
}