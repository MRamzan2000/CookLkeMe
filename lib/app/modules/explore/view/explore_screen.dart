import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Explore",style: AppTextStyles.whiteRegularStyle,),
      ),
    );
  }
}
