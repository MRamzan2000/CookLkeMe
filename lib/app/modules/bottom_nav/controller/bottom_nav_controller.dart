import 'package:cooklkeme/app/modules/explore/view/explore_screen.dart';
import 'package:cooklkeme/app/modules/home/view/home_screen.dart';
import 'package:cooklkeme/app/modules/inbox/view/inbox_screen.dart';
import 'package:cooklkeme/app/modules/profile/view/profile_screen.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final selectedIndex = 0.obs;

  final bottomBarIcons = [
    "assets/icons/home.svg",
    "assets/icons/explore.svg",
    "assets/icons/inbox.svg",
    "assets/icons/profile.svg",
  ];

  final bottomBarText = [
    "Home",
    "Explore",
    "Inbox",
    "Profile",
  ];
  final  screens = [
    HomeScreen(),
    ExploreScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    if (selectedIndex.value == index) return;
    selectedIndex.value = index;
  }
}