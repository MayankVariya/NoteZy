import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    String? user_name,
    required String email,
    required String password,
    DateTime? created_at,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  String toJsonString() => jsonEncode(toJson());

  static UserModel? fromJsonString(String json) =>
      UserModel.fromJson(jsonDecode(json));

  factory UserModel.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final Map<String, dynamic>? data = snapshot.data();
    return UserModel.fromJson(data!);
  }
}
