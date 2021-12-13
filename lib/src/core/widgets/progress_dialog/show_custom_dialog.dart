import 'package:flutter/material.dart';
import 'package:turbo_taxi/src/core/widgets/progress_dialog/widgets.dart';

Future<void> showCustomDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return ProgressDialog(
        message: message,
      );
    },
  );
}
