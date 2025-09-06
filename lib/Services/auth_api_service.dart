import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:experiment/Services/api.dart';
import 'package:experiment/models/AuthServicesModels/RegisterationModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Constants/ApiConstants.dart';
import '../models/ApiErrorModel.dart';
import '../models/AuthServicesModels/LoginErrorModel.dart';
import '../models/AuthServicesModels/LoginModel.dart';

class AuthServiceApi extends Api {
  RegisterationModel? _registerationModel;
  LoginModel? _loginModel;
  LoginErrorModel? _loginErrorModel;
  Future<LoginModel?> getLogin(String? emailId, String? mobile,
      String? password) async {
    try {
      Map<String, dynamic> formUpdated = {};

      if (emailId!.isNotEmpty) formUpdated['email'] = emailId;

      if (mobile!.isNotEmpty) formUpdated['mobile'] = mobile;

      if (password!.isNotEmpty) formUpdated['password'] = password;

      Response response = await Client.post(ApiConstants.Login,
          data: jsonEncode(formUpdated),
          options: Options(
              contentType: Headers.jsonContentType,
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
              },
              method: "POST"));
      print("Response ${response.statusCode}");
      if (response.statusCode == 200) {
        _loginModel = LoginModel.fromJson(response.data);
        // print("loginModel data in loginModel Api 2 ${_loginModel!.toJson()}");
        return _loginModel;
      } else if (response.statusCode == 401) {
        _loginErrorModel = LoginErrorModel.fromJson(response.data);

        print("Login Error ${_loginErrorModel!.toJson()}");
        // return _loginErrorModel;
      } else if (response.statusCode == 403) {
        _loginErrorModel = LoginErrorModel.fromJson(response.data);

        print("Login Error ${_loginErrorModel!.toJson()}");
        // return _loginErrorModel;
      }
    } on DioError catch (e) {
      print("in DioError condition ${e.response?.data}");
      if (e.response?.data != null) {
        print("in DioError condition ${e.response?.data}");
        try {
          print("in DioError Try parsing Error catch");
          // Attempt to parse the error data as ApiErrorModel
          ApiErrorModel errorModel = ApiErrorModel.fromJson(e.response?.data);

          // Throw an exception with more detailed error info
          throw Exception(errorModel.message);
        } catch (parsingError) {
          // If parsing fails, throw a generic exception
          ApiErrorModel errorModel = ApiErrorModel.fromJson(e.response?.data);
          print("i n Try parsing Error catch${errorModel.message}");
          throw Exception(errorModel.message);
        }
      } else {
        print("in else catch");
        // If there's no response data, throw a generic exception
        throw Exception(e.message);
      }
    } catch (e) {
      // Handle other types of exceptions.
      print('Other Exception: $e');
    }
    return null;
  }
  Future<RegisterationModel?> getRegister(String? emailId, String? mobile,
      String? password, String? name) async {
    try {
      final Map<String, dynamic> formUpdated = {};

      if (name?.isNotEmpty ?? false) formUpdated['name'] = name;
      if (emailId?.isNotEmpty ?? false) formUpdated['email'] = emailId;
      if (mobile?.isNotEmpty ?? false) formUpdated['mobile'] = mobile;
      if (password?.isNotEmpty ?? false) formUpdated['password'] = password;

      final response = await Client.post(
        ApiConstants.Register,
        data: jsonEncode(formUpdated),
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
          method: "POST",
        ),
      );

      print("✅ Response ${response.statusCode}  -- Data: ${response.data}");

      if (response.statusCode == 200) {
        _registerationModel = RegisterationModel.fromJson(response.data);
        return _registerationModel;
      } else if (response.statusCode == 422) {
        // Validation error (e.g. mobile already taken)
        final errorModel = ApiErrorModel.fromJson(response.data);
        throw Exception(errorModel.firstError);
      } else {
        throw Exception("Unexpected error: ${response.statusCode}");
      }
    } on DioError catch (e) {
      String errorMsg = "Something went wrong. Please try again.";

      if (e.type == DioErrorType.other &&
          e.error is SocketException) {
        errorMsg = "No Internet Connection. Please check your network.";
      } else if (e.response?.data != null) {
        try {
          final errorModel = ApiErrorModel.fromJson(e.response?.data);
          errorMsg = errorModel.firstError; // clean error
        } catch (_) {
          errorMsg = e.response?.data.toString() ?? errorMsg; // ✅ safe assign
        }
      } else {
        errorMsg = e.message ?? errorMsg;
      }

      // ✅ Show in Toast/Dialog
      showErrorToast(errorMsg);

      // throw Exception(errorMsg);
    }
  }

  void showErrorToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.0, // ✅ text style
    );
  }

}
