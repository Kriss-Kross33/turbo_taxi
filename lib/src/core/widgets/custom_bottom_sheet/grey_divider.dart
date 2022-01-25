import 'package:flutter/material.dart';
import 'package:turbo_taxi/src/core/constants/constants.dart';

class GreyDivider extends StatelessWidget {
  final double width;
  final double thickness;
  const GreyDivider(
      {Key? key, this.width = double.infinity, this.thickness = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: width,
        child: Divider(
          color: AppColor.darkGrey.withOpacity(0.7),
          height: 1,
          thickness: thickness,
        ),
      ),
    );
  }
}
