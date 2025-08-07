import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:experiment/Constants/ApiConstants.dart';
import 'package:experiment/Services/api.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../models/ApiErrorModel.dart';
import '../models/LoginErrorModel.dart';
import '../models/LoginModel.dart';

class AuthApis extends Api{
  LoginModel? _loginModel;
  LoginErrorModel? _loginErrorModel;
  final DialogService _dialogService = locator<DialogService>();


  Future<LoginModel?> getLogin(String? emailId , String? mobile, String? password) async {
try{


 Map<String, dynamic> formUpdated  =  {};

if(emailId!.isNotEmpty) formUpdated['email']= emailId;
if(mobile!.isNotEmpty) formUpdated['mobile']= mobile;
if(password!.isNotEmpty) formUpdated['password']= password;


       Response response = await Client.post(
        ApiConstants.Login,
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


}


on DioError catch (e) {
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

  }
