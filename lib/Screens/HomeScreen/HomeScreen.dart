import 'package:fat_loss_for_women/Screens/Diet/Diet_Plan_Screen.dart';
import 'package:fat_loss_for_women/Screens/PlanScreen/PlanScreen.dart';
import 'package:fat_loss_for_women/Screens/ReportScreen/ReportScreen.dart';
import 'package:fat_loss_for_women/Screens/Settings/SettingScreen.dart';
import 'package:fat_loss_for_women/Screens/Utilities/UtitlitiesScreen.dart';
import 'package:fat_loss_for_women/Shared/Aleartbox.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isVisible = true;
  late ScrollController controller;
  bool isShow = false;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    showDiet();

    controller.addListener(() {
      setState(() {
        _isVisible =
            controller.position.userScrollDirection == ScrollDirection.forward;
      });
    });
  }

  showDiet() async {
    final prefs = await SharedPreferences.getInstance();
    final diet = prefs.getBool('diet') ?? false;
    isShow = diet;
    setState(() {});
  }

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: WillPopScope(
          onWillPop: _onBackPressed, child: screenSelect(_bottomNavIndex)),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        height: _isVisible ? 268.h : 0,
        child: Center(
          child: Container(
            child: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: AppColors.white,
              elevation: 10,
              iconSize: 66.h,
              selectedLabelStyle: TextStyle(fontSize: 10, height: 1.7),
              unselectedLabelStyle: TextStyle(fontSize: 10, height: 1.7),
              selectedItemColor: AppColors.primaryColor,
              selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              selectedFontSize: 14,
              unselectedItemColor: Colors.grey,
              enableFeedback: true,
              type: BottomNavigationBarType.shifting,
              onTap: (value) {
                _bottomNavIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/Plan_Icon.png',
                      color: Colors.grey,
                      height: 66.h,
                    ),
                    activeIcon: Image.asset(
                      'assets/icons/Plan_Icon.png',
                      color: AppColors.primaryColor,
                      height: 66.h,
                    ),
                    label: 'Plan'),
                if (isShow)
                  BottomNavigationBarItem(
                      icon: Image.asset('assets/icons/utilites_icon.png',
                          height: 66.h),
                      activeIcon: Image.asset('assets/icons/utilites_icon.png',
                          height: 66.h, color: AppColors.primaryColor),
                      label: 'Utilities'),
                if (isShow)
                  BottomNavigationBarItem(
                      icon: Image.asset('assets/icons/diet_icon.png',
                          height: 66.h),
                      activeIcon: Image.asset('assets/icons/diet_icon.png',
                          height: 66.h, color: AppColors.primaryColor),
                      label: 'Diet'),
                if (isShow)
                  BottomNavigationBarItem(
                      icon: Image.asset('assets/icons/reports_icon.png',
                          height: 66.h),
                      activeIcon: Image.asset('assets/icons/reports_icon.png',
                          height: 66.h, color: AppColors.primaryColor),
                      label: 'Reports'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/settings_icon.png',
                        height: 66.h),
                    activeIcon: Image.asset('assets/icons/settings_icon.png',
                        height: 66.h, color: AppColors.primaryColor),
                    label: 'Settings'),
              ],
              currentIndex: _bottomNavIndex,
            ).h(268.h),
          ),
        ),
      ),
    );
  }

  // void _update(int count) {
  //   setState(() => _bottomNavIndex = count);
  // }
  Future<bool> _onBackPressed() async {
    return await Alertbox().showCustomDialogBottomAnimation(context: context);
  }

  Widget screenSelect(int index) {
    return IndexedStack(
      index: index,
      children: [
        ListView(
          controller: controller,
          children: [
            PlanScreen(),
          ],
        ),
        !isShow ? SettingScreen() : UtitlitiesScreen(),
        !isShow ? SettingScreen() : DietPlanScreen(),
        !isShow ? SettingScreen() : ReportScreen(),
        SettingScreen(),
      ],
    );
    // switch (index) {
    //   case 1:
    //     FirebaseAnalytics().logEvent(
    //       name: 'Utitlity_Screen_View',
    //     );
    //     return !isShow ? SettingScreen() : UtitlitiesScreen();
    //   case 2:
    //     FirebaseAnalytics().logEvent(
    //       name: 'Diet_Screen_View',
    //     );
    //     return !isShow ? SettingScreen() : DietPlanScreen();
    //   case 3:
    //     FirebaseAnalytics().logEvent(
    //       name: 'Report_Screen_View',
    //     );
    //     return !isShow ? SettingScreen() : ReportScreen();
    //   case 4:
    //     FirebaseAnalytics().logEvent(
    //       name: 'Setting_Screen_View',
    //     );
    //     return SettingScreen();
    //   default:
    //     FirebaseAnalytics().logEvent(
    //       name: 'Plan_Screen_View',
    //     );
    //     return ListView(
    //       controller: controller,
    //       children: [
    //         PlanScreen(),
    //       ],
    //     );
    // }
  }
}
