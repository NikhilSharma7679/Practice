

import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../Ui/ChooseAuthView/ChooseAuthView.dart';
import '../Ui/LoginView/LoginView.dart';

@StackedApp(routes: [
MaterialRoute(page: ChooseAuthScreen,initial: true),
MaterialRoute(page: Loginview),
],

dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SnackbarService),
],
)

class AppSetup {}