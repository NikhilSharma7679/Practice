// To parse this JSON data, do
//
//     final registerationModel = registerationModelFromJson(jsonString);

import 'dart:convert';

RegisterationModel registerationModelFromJson(String str) => RegisterationModel.fromJson(json.decode(str));

String registerationModelToJson(RegisterationModel data) => json.encode(data.toJson());

class RegisterationModel {
  String? message;
  bool? status;

  RegisterationModel({
    this.message,
    this.status,
  });

  factory RegisterationModel.fromJson(Map<String, dynamic> json) => RegisterationModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}
