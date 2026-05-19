import 'package:cooklkeme/app/routes/app_pages.dart';
import 'package:cooklkeme/app/routes/app_routes.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder:(context,orientation,screenType)=>
            GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "CookLkeMe",
              theme: ThemeData(
                scaffoldBackgroundColor: AppColors.primaryColor
              ),
              initialRoute: AppRoutes.splash,
              getPages: AppPages.pages,
            )
    );
  }
}
