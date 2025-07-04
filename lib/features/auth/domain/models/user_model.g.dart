// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  user_name: json['user_name'] as String?,
  email: json['email'] as String,
  password: json['password'] as String,
  created_at: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.user_name,
      'email': instance.email,
      'password': instance.password,
      'created_at': instance.created_at?.toIso8601String(),
    };
