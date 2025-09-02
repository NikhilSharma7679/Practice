import 'package:experiment/Services/auth_api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


import '../../../app/app.locator.dart';
import '../../../models/AuthServicesModels/RegisterationModel.dart';

class CoachSignupViewModel extends BaseViewModel{


  final NavigationService _navigationService = locator<NavigationService>();

  final DialogService _dialogService = locator<DialogService>();
  RegisterationModel? registerModel;


  Future<RegisterationModel?> getRegisterationDetails(
      String? emailId, String? mobile, String? password, String? name) async {
    setBusy(true);
    try {



      registerModel = await locator<AuthServiceApi>()
          .getRegister(emailId, mobile, password, name);

      if (registerModel != null) {

        Fluttertoast.showToast(msg: "You have successfully registered! Please login with your details.", fontSize: 20, backgroundColor: Colors.orange, gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG, webShowClose: true, textColor: Colors.white);
        // navigateToLogin();

      }

      // print("Response in viewmodel ${registerModel!.toJson()}");
    } catch (e) {
      print("Error in exception in viewmodel ${e.toString()}");
      String error = e.toString().replaceAll("Exception:", "");
      String error2 = error
          .replaceAll("}", "")
          .replaceAll("{", "")
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(",", "\n");
      openAlertDialog(error2);
    }
    notifyListeners();
    setBusy(false);

    return Future.value(registerModel);
  }
  Future<void> openAlertDialog(String message) async {

    final response = await _dialogService.showConfirmationDialog(

      title: " ⚠️ ",
      description: message,
      confirmationTitle: "OK", // ✅ only one button
      barrierDismissible: true,
      dialogPlatform: DialogPlatform.Cupertino,
    );

    if (response?.confirmed ?? false) {
      // User pressed OK
    }

  }


  void navigateToCoachHome()
  {


  }
}