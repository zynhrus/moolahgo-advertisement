import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@CopyWith()
@JsonSerializable()
class ApiErrorModel extends Equatable implements Exception {
  final String error;
  final String message;
  final int statusCode;

  const ApiErrorModel({this.error, this.message, this.statusCode});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  @override
  List<Object> get props => [error, statusCode];

  @override
  String toString() =>
      'ApiErrorModel { Error Code: $error, Status Code: $statusCode,  Message: $message}';
}
