import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String statusCode;
  String timestamp;
  String message;
  DataModel data;
  String error;

  UserModel({
    this.statusCode,
    this.message,
    this.data,
    this.timestamp,
    this.error,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class DataModel {
  String userName;
  String photo;
  String gender;
  String nationality;

  DataModel({
    this.userName,
    this.photo,
    this.gender,
    this.nationality,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
