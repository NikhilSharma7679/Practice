import 'package:dio/dio.dart';
import 'package:experiment/Services/api.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../models/LoginModel.dart';

class AuthApis extends Api{
  LoginModel? _loginModel;
  final DialogService _dialogService = locator<DialogService>();


  Future<LoginModel?> getLogin(String? email , String? mobile, String? password) async {
try{


Map<String, dynamic> formUpdated  =  {};

}


on DioError catch (e) {}

  }








}
