import 'package:get/get.dart';

import '../modules/bet/bet_2_d/bindings/bet_2_d_binding.dart';
import '../modules/bet/bet_2_d/views/bet_2_d_view.dart';
import '../modules/bet/bet_2_over/bindings/bet_2_over_binding.dart';
import '../modules/bet/bet_2_over/views/bet_2_over_view.dart';
import '../modules/bet/bet_3_d/bindings/bet_3_d_binding.dart';
import '../modules/bet/bet_3_d/views/bet_3_d_view.dart';
import '../modules/bet/bet_3_over/bindings/bet_3_over_binding.dart';
import '../modules/bet/bet_3_over/views/bet_3_over_view.dart';
import '../modules/bet/bet_history_2_d/bindings/bet_history_2_d_binding.dart';
import '../modules/bet/bet_history_2_d/views/bet_history_2_d_view.dart';
import '../modules/bet/bet_history_2_over/bindings/bet_history_2_over_binding.dart';
import '../modules/bet/bet_history_2_over/views/bet_history_2_over_view.dart';
import '../modules/bet/bet_history_3_d/bindings/bet_history_3_d_binding.dart';
import '../modules/bet/bet_history_3_d/views/bet_history_3_d_view.dart';
import '../modules/bet/bet_history_3_over/bindings/bet_history_3_over_binding.dart';
import '../modules/bet/bet_history_3_over/views/bet_history_3_over_view.dart';
import '../modules/dashboard/admin_management/bindings/admin_management_binding.dart';
import '../modules/dashboard/admin_management/views/admin_management_view.dart';
import '../modules/dashboard/user_data_dashboard/bindings/user_data_dashboard_binding.dart';
import '../modules/dashboard/user_data_dashboard/views/user_data_dashboard_view.dart';
import '../modules/disable_enable/bet_disable/bindings/bet_disable_binding.dart';
import '../modules/disable_enable/bet_disable/views/bet_disable_view.dart';
import '../modules/disable_enable/bet_enable/bindings/bet_enable_binding.dart';
import '../modules/disable_enable/bet_enable/views/bet_enable_view.dart';
import '../modules/home/admin_home/bindings/admin_home_binding.dart';
import '../modules/home/admin_home/views/admin_home_view.dart';
import '../modules/home/user_home/bindings/user_home_binding.dart';
import '../modules/home/user_home/views/user_home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/rules/rule_detail/bindings/rule_detail_binding.dart';
import '../modules/rules/rule_detail/views/rule_detail_view.dart';
import '../modules/rules/rule_history/bindings/rule_history_binding.dart';
import '../modules/rules/rule_history/views/rule_history_view.dart';
import '../modules/rules/three_d_management/bindings/three_d_management_binding.dart';
import '../modules/rules/three_d_management/views/three_d_management_view.dart';
import '../modules/rules/two_d_managment/views/two_d_management_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/transfer/transfer/bindings/transfer_binding.dart';
import '../modules/transfer/transfer/views/transfer_view.dart';
import '../modules/transfer/transfer_history/bindings/transfer_history_binding.dart';
import '../modules/transfer/transfer_history/views/transfer_history_view.dart';
import '../modules/winning-result-today/bindings/winning_result_today_binding.dart';
import '../modules/winning-result-today/views/winning_result_today_view.dart';
import '../modules/winning_result/bindings/winning_result_binding.dart';
import '../modules/winning_result/views/winning_result_view.dart';

import 'package:winner_v3_5/app/modules/rules/two_d_managment/bindings/two_d_management_binding.dart'
    show TwoDManagementBinding;

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => const AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.USER_HOME,
      page: () => const UserHomeView(),
      binding: UserHomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER,
      page: () => const TransferView(),
      binding: TransferBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER_HISTORY,
      page: () => const TransferHistoryView(),
      binding: TransferHistoryBinding(),
    ),
    GetPage(
      name: _Paths.BET_DISABLE,
      page: () => const BetDisableView(),
      binding: BetDisableBinding(),
    ),
    GetPage(
      name: _Paths.BET_ENABLE,
      page: () => const BetEnableView(),
      binding: BetEnableBinding(),
    ),
    GetPage(
      name: _Paths.WINNING_RESULT,
      page: () => const WinningResultView(),
      binding: WinningResultBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_MANAGEMENT,
      page: () => const AdminManagementView(),
      binding: AdminManagementBinding(),
    ),

    GetPage(
      name: _Paths.USER_DATA_DASHBOARD,
      page: () => const UserDataDashboardView(),
      binding: UserDataDashboardBinding(),
    ),
    GetPage(
      name: _Paths.TWO_D_MANAGEMENT,
      page: () => const TwoDManagementView(),
      binding: TwoDManagementBinding(),
    ),
    GetPage(
      name: _Paths.THREE_D_MANAGEMENT,
      page: () => const ThreeDManagementView(),
      binding: ThreeDManagementBinding(),
    ),
    GetPage(
      name: _Paths.BET_2_D,
      page: () => const Bet2DView(),
      binding: Bet2DBinding(),
    ),
    GetPage(
      name: _Paths.BET_3_D,
      page: () => const Bet3DView(),
      binding: Bet3DBinding(),
    ),
    GetPage(
      name: _Paths.BET_HISTORY_2_D,
      page: () => const BetHistory2DView(),
      binding: BetHistory2DBinding(),
    ),
    GetPage(
      name: _Paths.BET_HISTORY_3_D,
      page: () => const BetHistory3DView(),
      binding: BetHistory3DBinding(),
    ),
    GetPage(
      name: _Paths.BET_HISTORY_2_OVER,
      page: () => const BetHistory2OverView(),
      binding: BetHistory2OverBinding(),
    ),
    GetPage(
      name: _Paths.BET_HISTORY_3_OVER,
      page: () => const BetHistory3OverView(),
      binding: BetHistory3OverBinding(),
    ),
    GetPage(
      name: _Paths.BET_3_OVER,
      page: () => const Bet3OverView(),
      binding: Bet3OverBinding(),
    ),
    GetPage(
      name: _Paths.BET_2_OVER,
      page: () => const Bet2OverView(),
      binding: Bet2OverBinding(),
    ),
    GetPage(
      name: _Paths.RULE_HISTORY,
      page: () => const RuleHistoryView(),
      binding: RuleHistoryBinding(),
    ),
    GetPage(
      name: _Paths.RULE_DETAIL,
      page: () => const RuleDetailView(),
      binding: RuleDetailBinding(),
    ),
    GetPage(
      name: _Paths.WINNING_RESULT_TODAY,
      page: () => const WinningResultTodayView(),
      binding: WinningResultTodayBinding(),
    ),
  ];
}
