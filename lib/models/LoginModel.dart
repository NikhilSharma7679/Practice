// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? status;
  Data? data;

  LoginModel({
    this.status,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? mobile;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? address;
  String? image;
  String? roleId;
  String? isActive;
  DateTime? lastLogin;
  int? locationId;
  String? locationName;

  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.mobile,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.image,
    this.roleId,
    this.isActive,
    this.lastLogin,
    this.locationId,
    this.locationName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    mobile: json["mobile"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    address: json["address"],
    image: json["image"],
    roleId: json["role_id"],
    isActive: json["is_active"],
    lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
    locationId: json["location_id"],
    locationName: json["location_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "mobile": mobile,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "address": address,
    "image": image,
    "role_id": roleId,
    "is_active": isActive,
    "last_login": lastLogin?.toIso8601String(),
    "location_id": locationId,
    "location_name": locationName,
  };
}
