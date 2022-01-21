import 'package:flutter/material.dart';
import 'package:turbo_taxi/src/core/core.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteBG,
      width: 280,
      child: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 165.0,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColor.scaffoldBGColor,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AssetConsts.userIcon,
                      height: 65.0,
                      width: 65.0,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppConst.profileName,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  fontFamily: 'Bolt',
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          AppConst.visitProfile,
                          style:
                              Theme.of(context).textTheme.subtitle2?.copyWith(
                                    fontFamily: 'Bolt',
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const GreyDivider(),
            const SizedBox(
              height: 12.0,
            ),
            //* history
            ListTile(
              leading: const Icon(
                Icons.history,
              ),
              title: Text(
                AppConst.history,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            //* profile
            ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: Text(
                AppConst.visitProfile,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            //* My addresses
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: Text(
                AppConst.myAddresses,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            //* Settings
            ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: Text(
                AppConst.settings,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            //* About
            ListTile(
              leading: const Icon(
                Icons.info,
              ),
              title: Text(
                AppConst.about,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
