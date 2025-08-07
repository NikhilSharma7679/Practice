import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../Services/auth_api_service.dart';
import '../../app/app.locator.dart';
import '../../models/LoginModel.dart';

class LoginViewModel extends BaseViewModel{


  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  LoginModel? loginModel;
  String? loginIssue;

  Future<LoginModel?> getLoginDetails(
      String? emailId, String? mobile, String? password) async {
    setBusy(true);
    try {
      loginModel =
      await locator<AuthApis>().getLogin(emailId, mobile, password);

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

  Future<void> openAlertDialog() async {
    DialogResponse? response = await _dialogService.showConfirmationDialog(
        title: "Please check your issue below !!",
        description: loginIssue!.replaceAll("Exception:", ''),
        barrierDismissible: true,
        dialogPlatform: DialogPlatform.Cupertino);
    if (response!.confirmed) {
      // User pressed the OK button
    } else {}
  }

  // void navigateToDashboardView() async {
  //   _navigationService.popRepeated(0);
  //   await _navigationService.navigateToDashboardView(
  //       loginModel: loginModel!.toString());
  }

