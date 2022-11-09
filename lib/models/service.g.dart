// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic>? json, String id) =>
    ServiceModel(
      id,
      json?['name'] as String,
      json?['description'] as String,
      (json?['duration'] as num).toDouble(),
      json?['price'] as String,
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
      'price': instance.price,
    };
