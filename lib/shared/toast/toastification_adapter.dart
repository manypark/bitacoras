import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import 'toast_adapter.dart';
import 'package:bitacoras/core/configs/configs.dart';

class ToastificationAdapter implements ToastAdapter {

  const ToastificationAdapter();

  @override
  void showSuccessToast({
    required BuildContext context,
    required String title,
  }) {
    toastification.show(
      context: context,
      style: ToastificationStyle.fillColored,
      type: ToastificationType.success,
      primaryColor: Colors.blueAccent,
      title: Text(
        title, 
        style: GlobalFonts.paragraphBodyLargeRegular.copyWith(color: Colors.white)
      ),
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topCenter,
      borderRadius: BorderRadius.circular(10),
      dragToClose: true,
      direction: TextDirection.ltr,
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
  
  @override
  void showErrorToast({
    required BuildContext context, 
    required String title,
  }) {
    toastification.show(
      context: context,
      style: ToastificationStyle.fillColored,
      type: ToastificationType.error,
      primaryColor: Colors.redAccent,
      title: Text(
        title, 
        style: GlobalFonts.paragraphBodyLargeRegular.copyWith(color: Colors.white)
      ),
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topCenter,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues( alpha: 0.05 ),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(0, 5),
        )
      ],
      dragToClose: true,
      direction: TextDirection.ltr,
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}