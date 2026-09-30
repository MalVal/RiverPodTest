import 'package:freezed_annotation/freezed_annotation.dart';

part 'joke.freezed.dart';
part 'joke.g.dart';

@freezed
abstract class Joke with _$Joke {
  const factory Joke({
    required String type,
    required String setup,
    required String punchline,
    required int id,
  }) = _Joke;

  factory Joke.fromJson(Map<String, dynamic> json) =>
      _$JokeFromJson(json);
}