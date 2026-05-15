import 'package:cooklkeme/app/modules/home/view/following_screen.dart';
import 'package:cooklkeme/app/modules/home/view/for_you_screen.dart';
import 'package:cooklkeme/app/modules/home/view/map_screen.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/get_horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Expanded(
                  child: SizedBox(
                    height: 36,
                    child: TabBar(
                      indicatorWeight: 1.0,
                      labelPadding:EdgeInsets.zero ,
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        unselectedLabelStyle: AppTextStyles.hintStyle,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabAlignment: TabAlignment.fill,
                        dividerColor: Colors.transparent,
                        automaticIndicatorColorAdjustment: true,
                        labelStyle: AppTextStyles.whiteRegularStyle,
                        indicatorColor: AppColors.whiteColor,
                        tabs: [
                      Tab(text: "Map"),
                      Tab(text: "Following"),
                      Tab(text: "For You"),
                    ]),
                  )),
              getHorizontalSpace(width: 10.w,),
              Icon(Icons.search_rounded,size: 25.px,color: AppColors.whiteColor,)
            ],
          ),
        ),
        body: TabBarView(children: [
          MapScreen(),
          FollowingScreen(),
          ForYouScreen(),
        ])
      ),
    );
  }
}
