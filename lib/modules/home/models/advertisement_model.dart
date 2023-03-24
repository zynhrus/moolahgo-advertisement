import 'package:json_annotation/json_annotation.dart';

part 'advertisement_model.g.dart';

@JsonSerializable()
class AdvertisementModel {
  String statusCode;
  String timestamp;
  String message;
  List<PayloadModel> payload;

  AdvertisementModel({
    this.statusCode,
    this.message,
    this.payload,
    this.timestamp,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementModelToJson(this);
}

@JsonSerializable()
class PayloadModel {
  int id;
  int version;
  String createDate;
  String lastUpdate;
  String name;
  String title;
  String imagePath;
  String body;
  String termsAndConditions;
  String recordStatus;
  String expiryDate;
  bool limitedToUserGroups;
  bool limitedToUser;
  List allowedUserGroups;
  List allowedUser;
  List allowedNationalities;
  bool limitedToNationality;
  int appearanceOrder;

  PayloadModel({
    this.id,
    this.version,
    this.name,
    this.title,
    this.allowedNationalities,
    this.allowedUser,
    this.allowedUserGroups,
    this.appearanceOrder,
    this.body,
    this.createDate,
    this.expiryDate,
    this.imagePath,
    this.lastUpdate,
    this.limitedToNationality,
    this.limitedToUser,
    this.limitedToUserGroups,
    this.recordStatus,
    this.termsAndConditions,
  });

  factory PayloadModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadModelToJson(this);
}
