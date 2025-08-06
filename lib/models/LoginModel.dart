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
  String? adminRole;
  dynamic emailVerifiedAt;
  String? mobile;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic address;
  dynamic image;
  String? roleId;
  String? isActive;
  DateTime? lastLogin;
  dynamic locationId;
  dynamic locationName;
  String? level;
  String? appPassword;
  String? paymentStatus;
  String? userLevel;
  dynamic startDate;
  dynamic startTime;
  dynamic endDate;
  dynamic endTime;
  String? isApproved;

  Data({
    this.id,
    this.name,
    this.email,
    this.adminRole,
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
    this.level,
    this.appPassword,
    this.paymentStatus,
    this.userLevel,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.isApproved,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    adminRole: json["admin_role"],
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
    level: json["level"],
    appPassword: json["app_password"],
    paymentStatus: json["payment_status"],
    userLevel: json["user_level"],
    startDate: json["start_date"],
    startTime: json["start_time"],
    endDate: json["end_date"],
    endTime: json["end_time"],
    isApproved: json["is_approved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "admin_role": adminRole,
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
    "level": level,
    "app_password": appPassword,
    "payment_status": paymentStatus,
    "user_level": userLevel,
    "start_date": startDate,
    "start_time": startTime,
    "end_date": endDate,
    "end_time": endTime,
    "is_approved": isApproved,
  };
}
