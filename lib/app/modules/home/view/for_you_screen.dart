import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({super.key});

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("For You",style: AppTextStyles.whiteRegularStyle,),),
    );
  }
}
