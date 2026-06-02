import 'package:cooklkeme/app/modules/post/controller/post_preview_controller.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// A single icon button used in the bottom toolbar.
class _ToolBtn extends StatelessWidget {
  final String? svgAsset;
  final IconData? icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _ToolBtn({
    this.svgAsset,
    this.icon,
    required this.label,
    required this.onTap,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = active
        ? AppColors.secondaryColor
        : AppColors.whiteColor.withOpacity(0.85);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (svgAsset != null)
            SvgPicture.asset(svgAsset!,
                height: 25.px,
                width: 25.px,
                colorFilter:
                ColorFilter.mode(color, BlendMode.srcIn))
          else
            Icon(icon!, color: color, size: 25.px),
          getVerticalSpace(height: 4.px),
          Text(label,
              style: AppTextStyles.whiteRegularStyle.copyWith(
                fontSize: 12.px
              )),
        ],
      ),
    );
  }
}

class PostPreviewToolbar extends StatelessWidget {
  final String tag;

  const PostPreviewToolbar({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<PostPreviewController>(tag: tag);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(() {
          final total = ctrl.totalDuration.value.inMilliseconds;
          if (total == 0) return const SizedBox.shrink();

          return Column(
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 2.px,
                  thumbShape:
                  RoundSliderThumbShape(enabledThumbRadius: 6.px),
                  overlayShape:
                  RoundSliderOverlayShape(overlayRadius: 14.px),
                  activeTrackColor: AppColors.secondaryColor,
                  inactiveTrackColor: AppColors.whiteColor,
                  thumbColor: AppColors.secondaryColor,
                  overlayColor:
                  AppColors.secondaryColor.withOpacity(0.2),
                ),
                child: Slider(
                  value: ctrl.positionFraction.clamp(0.0, 1.0),
                  onChanged: ctrl.seekByFraction,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ctrl.formatDuration(ctrl.currentPosition.value),
                      style:AppTextStyles.whiteRegularStyle.copyWith(
                        fontSize: 12.px
                      ),
                    ),
                    Text(
                      ctrl.formatDuration(ctrl.totalDuration.value),
                      style:AppTextStyles.whiteRegularStyle.copyWith(
                          fontSize: 12.px
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),

        getVerticalSpace(height: 14.px),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Rotate Left
            _ToolBtn(
              svgAsset: 'assets/icons/rotate_left.svg',
              label: 'Left',
              onTap: ctrl.rotateLeft,
            ),

            // Rotate Right
            _ToolBtn(
              svgAsset: 'assets/icons/rotate_right.svg',
              label: 'Right',
              onTap: ctrl.rotateRight,
            ),

            Obx(() => GestureDetector(
              onTap: (){
                ctrl.togglePlayPause(true);
              },
              child: Container(
                width: 52.px,
                height: 52.px,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryColor,
                ),
                child: Icon(
                  ctrl.isPlaying.value
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 30.px,
                ),
              ),
            )),

            // Trim
            Obx(() => _ToolBtn(
              svgAsset: 'assets/icons/crop_free.svg',
              label: 'Trim',
              active: ctrl.showTrimmer.value,
              onTap: ctrl.toggleTrimmer,
            )),

            // Mute
            Obx(() => _ToolBtn(
              icon: ctrl.isMuted.value
                  ? Icons.volume_off_rounded
                  : Icons.volume_up_rounded,
              label: ctrl.isMuted.value ? 'Unmute' : 'Mute',
              active: ctrl.isMuted.value,
              onTap: ctrl.toggleMute,
            )),
          ],
        ),


      ],
    );
  }
}

