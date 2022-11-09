import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable(explicitToJson: true)
class ServiceModel {
  final String id;
  final String name;
  final String description;
  final double duration;
  final String price;

  factory ServiceModel.fromJson(Map<String, dynamic>? json, String id) =>
      _$ServiceModelFromJson(json, id);

  ServiceModel(this.id, this.name, this.description, this.duration, this.price);

  Map<String, Object?> toJson() => _$ServiceModelToJson(this);
}
