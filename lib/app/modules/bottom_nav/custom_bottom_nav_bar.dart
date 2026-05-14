import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomBottomNavScreen extends StatefulWidget {
  const CustomBottomNavScreen({super.key});

  @override
  State<CustomBottomNavScreen> createState() => _CustomBottomNavScreenState();
}

class _CustomBottomNavScreenState extends State<CustomBottomNavScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,
        onPressed: (){},shape: CircleBorder(),
        child: Icon(Icons.add,size: 40.px,color: AppColors.whiteColor,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.px),
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.bottomBarBgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.px),
                topRight: Radius.circular(20.px),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(bottomBarIcons.length, (index) {
              return Padding(
                padding: EdgeInsets.only(left: index == 2?20:0 ,right: index == 1?20:0),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      bottomBarIcons[index],
                      height: 24.px,
                      width: 24.px,
                    ),
                    getVerticalSpace(height: .5.h),
                    Text(bottomBarText[index],style: AppTextStyles.hintStyle,)
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
