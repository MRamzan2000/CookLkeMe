import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublishPostController extends GetxController {
  final descriptionController = TextEditingController();
  final descriptionFocusNode = FocusNode();

  RxBool isDescriptionFocused = false.obs;

  @override
  void onInit() {
    super.onInit();
    descriptionFocusNode.addListener(() {
      isDescriptionFocused.value =
          descriptionFocusNode.hasFocus;
    });  }

  @override
  void onClose() {
    descriptionController.dispose();
    descriptionFocusNode.dispose();
    super.onClose();
  }
}
