import 'package:flutter/material.dart';
import 'package:turbo_taxi/src/core/constants/constants.dart';

class ProgressDialog extends StatelessWidget {
  final String message;
  const ProgressDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 6.0,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.violet),
            ),
            const SizedBox(
              width: 26.0,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
