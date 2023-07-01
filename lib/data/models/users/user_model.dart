import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  AddressModel? address;
  String? phone;
  String? website;
  CompanyModel? company;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class AddressModel {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoModel? geo;

  AddressModel({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}

@JsonSerializable()
class GeoModel {
  String? lat;
  String? lng;

  GeoModel({this.lat, this.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);
  Map<String, dynamic> toJson() => _$GeoModelToJson(this);
}

@JsonSerializable()
class CompanyModel {
  String? name;
  String? catchPhrase;
  String? bs;

  CompanyModel({this.name, this.catchPhrase, this.bs});

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
