import 'dart:convert';


import 'package:experiment/Services/auth_api_service.dart';
import 'package:experiment/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/AuthServicesModels/LoginModel.dart';



class CoachLoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  LoginModel? loginModel;
  String? loginIssue;

  Future<LoginModel?> getLoginDetails(
      String? emailId, String? mobile, String? password) async {
    setBusy(true);
    try {
      loginModel =
      await locator<AuthServiceApi>().getLogin(emailId, mobile, password);

      String loginModelStr = jsonEncode(loginModel);
      if (loginModel != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isSignin', true);
        prefs.setInt("userId", loginModel!.data!.id!);
        prefs.setString("roleID", loginModel!.data!.roleId!);
        prefs.setString("agentMobile", loginModel!.data!.mobile!);
        prefs.setString('loginModel', loginModelStr);
      }
    } catch (e) {
      loginIssue = e.toString();
      setBusy(false);
    }
    notifyListeners();
    setBusy(false);
    return Future.value(loginModel);
  }

  Future<void> showErrorToast(String message) async {
    Fluttertoast.showToast(
      msg: message.replaceAll("Exception:", '').trim(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

// Future<void> openAlertDialog() async {
  //   DialogResponse? response = await _dialogService.showConfirmationDialog(
  //       title: "Please check your issue below !!",
  //       description: loginIssue!.replaceAll("Exception:", ''),
  //       barrierDismissible: true,
  //       dialogPlatform: DialogPlatform.Cupertino);
  //   if (response!.confirmed) {
  //     // User pressed the OK button
  //   } else {}
  // }

  // void navigateToDashboardView() async {
  //   _navigationService.popRepeated(0);
  //   await _navigationService.navigateToPlayerHomeView(
  //       loginModel: loginModel!.toString());
  // }
  //
  // void navigateToForgget() async {
  //   await _navigationService.navigateToForgetPassword();
  // }
  //
  // void navigateToRegister() async {
  //   await _navigationService.navigateToSignUpView();
  // }
}
