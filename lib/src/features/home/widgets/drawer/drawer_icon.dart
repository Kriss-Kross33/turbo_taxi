import 'package:flutter/material.dart';
import 'package:turbo_taxi/src/core/core.dart';

class DrawerIcon extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DrawerIcon({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20),
      child: Container(
        decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.all(Radius.circular(22.0))),
        child: CircleAvatar(
          backgroundColor: AppColor.white,
          child: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: AppColor.chineseBlack,
            ),
          ),
        ),
      ),
    );
  }
}
