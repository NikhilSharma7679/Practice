import 'package:experiment/Ui/CoachUI/CoachLoginView/CoachLoginView.dart';
import 'package:experiment/Ui/PlayerHomepage/PlayerHomeView.dart';
import 'package:experiment/Ui/PlayerUI/DiscoverPageView/DiscoverPageView.dart';
import 'package:experiment/Ui/PlayerUI/PlayerSignupView/PlayerSignupView.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../Services/auth_api_service.dart';
import '../Ui/ChooseAuthView/ChooseAuthView.dart';
import '../Ui/CoachUI/CoachSignupView/CoachSignupView.dart';
import '../Ui/PlayerUI/LoginView/PlayerLoginView.dart';
import '../Ui/PlayerUI/PlayerHomepage/PlayerHomeView.dart';
import '../Ui/PlayerUI/ReportPageView/ReportPageView.dart';
import '../Ui/PlayerUI/SettingsPageView/SettingsPageView.dart';
@StackedApp(routes: [
MaterialRoute(page: ChooseAuthScreen,initial: true),
MaterialRoute(page: PlayerLoginview),
MaterialRoute(page: CoachLoginview),
MaterialRoute(page:PlayerSignupView),
MaterialRoute(page: CoachSignupView),
MaterialRoute(page: PlayerHomeView),
MaterialRoute(page: Settingspageview),
MaterialRoute(page: Reportpageview),
MaterialRoute(page: Discoverpageview),
MaterialRoute(page: TrainingPageView),
],
dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: AuthServiceApi),
],
)
class AppSetup {}