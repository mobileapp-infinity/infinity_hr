import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CommonUi {
  static GetBar SuccessSnackBar({String title = 'Success', String? message}) {
    Get.log("[$title] $message");
    return GetBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6!
              .merge(const TextStyle(color: Colors.white))),
      messageText: Text(message!,
          style: Get.textTheme.caption!
              .merge(const TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green.withOpacity(0.8),
      icon: const Icon(Icons.done_all, size: 32, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      borderRadius: 8,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 2),
    );
  }

  static GetBar errorSnackBar({String title = 'Error', String? message}) {
    Get.log("[$title] $message", isError: true);
    return GetBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6!
              .merge(const TextStyle(color: Colors.white))),
      messageText: Text(message!,
          style: Get.textTheme.caption!
              .merge(const TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.red.withOpacity(0.8),
      icon: const Icon(Icons.error, size: 32, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
    );
  }

  static GetBar defaultSnackBar({String title = 'Alert', String? message}) {
    Get.log("[$title] $message", isError: false);
    return GetBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6!
              .merge(TextStyle(color: Get.theme.hintColor))),
      messageText: Text(message!,
          style: Get.textTheme.caption!
              .merge(TextStyle(color: Get.theme.focusColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Get.theme.primaryColor,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon: Icon(Icons.warning_amber_rounded,
          size: 32, color: Get.theme.hintColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }

  static GetBar notificationSnackBar(
      {String title = 'Notification', String? message}) {
    Get.log("[$title] $message", isError: false);
    return GetBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6!
              .merge(TextStyle(color: Get.theme.hintColor))),
      messageText: Text(message!,
          style: Get.textTheme.caption!
              .merge(TextStyle(color: Get.theme.focusColor))),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Get.theme.primaryColor,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon:
          Icon(Icons.notifications_none, size: 32, color: Get.theme.hintColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }
}
