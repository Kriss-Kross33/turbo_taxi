import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:turbo_taxi/src/core/core.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: AppColor.whiteBG,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColor.chineseBlack,
              blurRadius: 0.5,
              spreadRadius: 0.1,
              offset: Offset(0.7, 0.7),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 18.0,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: GreyDivider(
                      thickness: 5.0,
                      width: 80.0,
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            splashColor: Colors.transparent,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.search,
                                color: AppColor.darkGrey,
                                size: 20,
                              ),
                              hintText: 'Enter the location',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.darkGrey,
                                  ),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: AppColor.lightGrey.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColor.lightGrey.withOpacity(0.4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    5.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Add Home',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            ?.copyWith(
                                              color: AppColor.darkGrey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.home,
                                        color:
                                            AppColor.darkGrey.withOpacity(0.6),
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColor.lightGrey.withOpacity(0.4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    5.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Add Office',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            ?.copyWith(
                                              color: AppColor.darkGrey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.building,
                                        color:
                                            AppColor.darkGrey.withOpacity(0.6),
                                        size: 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 135,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.lightGrey.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              // Image.asset(
              //   AssetConsts.logo,
              //   height: 80,
              //   width: 80,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
