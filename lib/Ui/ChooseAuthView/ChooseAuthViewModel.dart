import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class ChooseAuthViewModel extends BaseViewModel {
 final NavigationService _navigationService = locator<NavigationService>();

 bool showCard = false;
 String actionType = "";

 void openCard(String type) {
  actionType = type;
  showCard = true;
  notifyListeners();
 }

 void closeCard() {
  showCard = false;
  notifyListeners();
 }

 Future<void> navigateToRole(String role) async {
  if (actionType == "Login" && role == "Coach") {
   await _navigationService.navigateToCoachLoginview();
  } else if (actionType == "Login" && role == "Player") {
   await _navigationService.navigateToPlayerLoginview();
  } else if (actionType == "Sign Up" && role == "Coach") {
   await _navigationService.navigateToCoachSignupView();
  } else if (actionType == "Sign Up" && role == "Player") {
   await _navigationService.navigateToPlayerSignupView();
  }

  showCard = false;
  notifyListeners();
 }
}
