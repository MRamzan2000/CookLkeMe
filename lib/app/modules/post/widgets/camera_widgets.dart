import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:cooklkeme/app/modules/post/controller/create_post_controller.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/get_horizontal_space.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CameraBottomBar extends StatelessWidget {
  final CameraState state;
  final CreatePostController ctrl;

  const CameraBottomBar({
    super.key,
    required this.state,
    required this.ctrl,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(bottom: 5.h,right: 40.px),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _RecordButton(ctrl: ctrl, state: state),
            getHorizontalSpace(width: 100.px),
            _UploadButton(onTap: ctrl.pickFromGallery),

          ],
        ),
      );
}


class _RecordButton extends StatelessWidget {
  final CreatePostController ctrl;
  final CameraState state;

  const _RecordButton({
    required this.ctrl,
    required this.state,
  });

  @override
  Widget build(BuildContext context) => Obx(() {
        final recording = ctrl.isRecording.value;
        final color = recording ? Colors.red : AppColors.secondaryColor;

        return GestureDetector(
          onTap: () => ctrl.toggleRecording(state),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 7.h,
            width: 16.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(color: AppColors.whiteColor, width: 3),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(.5),
                  blurRadius: 16,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Center(
              child: recording
                  ? Text(
                      ctrl.formattedTime,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    )
                  : SizedBox.shrink()
            ),
          ),
        );
      });
}

class _UploadButton extends StatelessWidget {
  final VoidCallback onTap;

  const _UploadButton({required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            SvgPicture.asset("assets/icons/upload.svg",height: 28.px,),
             getVerticalSpace(height: .3.h),
             Text(
              'Upload',
              style : AppTextStyles.whiteRegularStyle.copyWith(
                fontSize: 12.px
              )
            ),
          ],
        ),
      );
}







