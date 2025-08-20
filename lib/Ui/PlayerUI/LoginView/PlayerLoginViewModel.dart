import 'package:experiment/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class PlayerLoginViewModel extends BaseViewModel{
  final NavigationService _navigationService = locator<NavigationService>();


  void navigateToPlayerHome() async
  {
await _navigationService.navigateToPlayerHomeView();
  }

}