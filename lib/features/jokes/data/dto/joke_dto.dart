import 'package:freezed_annotation/freezed_annotation.dart';

part 'joke_dto.freezed.dart';
part 'joke_dto.g.dart';

@freezed
abstract class JokeDto with _$JokeDto {
  const factory JokeDto({
    required String type,
    required String setup,
    required String punchline,
    required int id,
  }) = _JokeDto;

  factory JokeDto.fromJson(Map<String, dynamic> json) =>
      _$JokeDtoFromJson(json);
}