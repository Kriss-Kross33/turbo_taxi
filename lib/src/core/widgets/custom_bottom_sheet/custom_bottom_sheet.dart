import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<T?> showCustomBottomSheet<T>({
  required BuildContext context,
  String title = '',
  TextStyle? titleStyle,
  TextStyle? contentStyle,
  String content = '',
  Widget? titleWidget,
  Widget? contentWidget,
  List<Widget>? actions,
  double width = 600,
  bool showCloseButton = true,
  double height = 500,
  bool allowBackNavigation = true,
  VoidCallback? onClose,
  TextAlign contentAlign = TextAlign.start,
}) {
  return showMaterialModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    isDismissible: allowBackNavigation,
    builder: (context) => WillPopScope(
      onWillPop: () async => allowBackNavigation,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 10,
        ),
        child: SizedBox(
          height: height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // if (showCloseButton)
                  //   Align(
                  //     alignment: Alignment.topRight,
                  //     child:
                  //   ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 30,
                      ),
                      titleWidget ??
                          Text(
                            title,
                            textAlign: TextAlign.left,
                            style: titleStyle ??
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      height: 1,
                                      fontSize: 16,
                                    ),
                          ),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 24,
                        ),
                        onPressed: onClose ?? () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  contentWidget != null
                      ? Expanded(child: contentWidget)
                      : Text(
                          content,
                          textAlign: contentAlign,
                          style: contentStyle ??
                              Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(height: 1.5),
                        ),

                  const SizedBox(height: 40),

                  // OutlineButton(
                  //   child: Text('GOT IT!'),
                  //   borderSide: BorderSide(color: theme.primaryColor),
                  //   onPressed: () {
                  //     Navigator.of(context).pop();
                  //   },
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (actions != null)
                        ...actions
                      else
                        const SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
