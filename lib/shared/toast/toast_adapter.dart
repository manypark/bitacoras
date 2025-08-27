import 'package:flutter/material.dart';

abstract class ToastAdapter {
  void showSuccessToast({
    required BuildContext context,
    required String title,
  });

  void showErrorToast({
    required BuildContext context,
    required String title,
  });
}
