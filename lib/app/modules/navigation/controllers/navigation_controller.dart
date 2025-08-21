import 'package:get/get.dart';
import 'package:winner_v3_5/app/modules/home/user_home/views/user_home_view.dart';
import 'package:winner_v3_5/app/modules/live/views/live_view.dart';

class NavigationController extends GetxController {
  // Reactive variables
  var selectedIndex = 0.obs;
  var pages = [const UserHomeView(), const LiveView()];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
