// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JokeDto _$JokeDtoFromJson(Map<String, dynamic> json) => _JokeDto(
      type: json['type'] as String,
      setup: json['setup'] as String,
      punchline: json['punchline'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$JokeDtoToJson(_JokeDto instance) => <String, dynamic>{
      'type': instance.type,
      'setup': instance.setup,
      'punchline': instance.punchline,
      'id': instance.id,
    };
