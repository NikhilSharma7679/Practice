

import 'package:experiment/Ui/CoachUI/CoachLoginView/CoachLoginView.dart';
import 'package:experiment/Ui/PlayerUI/PlayerSignupView/PlayerSignupView.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../Ui/ChooseAuthView/ChooseAuthView.dart';
import '../Ui/CoachUI/CoachSignupView/CoachSignupView.dart';
import '../Ui/PlayerUI/LoginView/PlayerLoginView.dart';
import '../Ui/PlayerUI/PlayerHomepage/PlayerHomeView.dart';


@StackedApp(routes: [
MaterialRoute(page: ChooseAuthScreen,initial: true),
MaterialRoute(page: PlayerLoginview),
MaterialRoute(page: CoachLoginview),
MaterialRoute(page:PlayerSignupView),
MaterialRoute(page: CoachSignupView),
MaterialRoute(page: PlayerHomeView),
],
dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SnackbarService),
],
)

class AppSetup {}