import 'package:cooklkeme/app/routes/app_pages.dart';
import 'package:cooklkeme/app/routes/app_routes.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyChEAAw2PVRDp8d_iwYx9C2pQPsui4UAMo",
        appId: "1:153409870169:android:484a8ca01253f0a14f5448",
        messagingSenderId: "153409870169",
        projectId: "cooklkeme-4da45"
    )
  );

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
