// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Joke _$JokeFromJson(Map<String, dynamic> json) => _Joke(
      type: json['type'] as String,
      setup: json['setup'] as String,
      punchline: json['punchline'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$JokeToJson(_Joke instance) => <String, dynamic>{
      'type': instance.type,
      'setup': instance.setup,
      'punchline': instance.punchline,
      'id': instance.id,
    };
