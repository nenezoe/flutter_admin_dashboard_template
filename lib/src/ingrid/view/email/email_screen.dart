import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/view/email/email_drawer.dart';
import 'package:admin_dashboard/src/ingrid/view/email/email_list.dart';
import 'package:admin_dashboard/src/ingrid/view/email/email_preview.dart';
import 'package:admin_dashboard/src/ingrid/widget/title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  bool isshowButton = false;
  @override
  Widget build(BuildContext context) {
    isshowButton = IngridResponsive.isMobile(context) ||
            IngridResponsive.isTablet(context) ||
            IngridResponsive.isSmallWeb(context) ||
            IngridResponsive.isMediumWeb(context)
        ? true
        : false;

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 24.0, bottom: 24.0, left: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FxBox.h24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const RouteTitle(),
                          (IngridResponsive.isMobile(context) ||
                                  IngridResponsive.isTablet(context))
                              ? IconButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(72.0, 50.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    backgroundColor: ConstColor.primary,
                                  ),
                                  onPressed: () {
                                    showGeneralDialog(
                                      context: context,
                                      barrierLabel: "Barrier",
                                      barrierDismissible: true,
                                      barrierColor:
                                          Colors.black.withOpacity(0.5),
                                      transitionDuration:
                                          const Duration(milliseconds: 700),
                                      pageBuilder: (_, __, ___) {
                                        return Scaffold(
                                          backgroundColor: context.isDarkMode
                                              ? ConstColor.darkAppBar
                                              : ConstColor.white,
                                          body: EmailDrawer(
                                            onPressed: () {
                                              isshowButton = !isshowButton;
                                              setState(() {});
                                            },
                                          ),
                                        );
                                      },
                                      transitionBuilder: (_, anim, __, child) {
                                        Tween<Offset> tween;
                                        if (anim.status ==
                                            AnimationStatus.reverse) {
                                          tween = Tween(
                                              begin: const Offset(-1, 0),
                                              end: Offset.zero);
                                        } else {
                                          tween = Tween(
                                              begin: const Offset(1, 0),
                                              end: Offset.zero);
                                        }

                                        return SlideTransition(
                                          position: tween.animate(anim),
                                          child: FadeTransition(
                                            opacity: anim,
                                            child: child,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: const SvgIcon(
                                    icon: ConstIcons.folderFile,
                                    color: ConstColor.white,
                                  ),
                                )
                              : FxBox.shrink,
                        ],
                      ),
                      FxBox.h24,
                      Container(
                        color: context.theme.cardColor,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                if (IngridResponsive.isSmallWeb(context) ||
                                    IngridResponsive.isLargeWeb(context) ||
                                    IngridResponsive.isMediumWeb(context)) ...[
                                  Expanded(
                                    flex: 2,
                                    child: EmailDrawer(
                                      onPressed: () {
                                        isshowButton = !isshowButton;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ],
                                Expanded(
                                  flex: 6,
                                  child: EmailViewList(
                                    onPressed: () {
                                      if (IngridResponsive.isMobile(context) ||
                                          IngridResponsive.isTablet(context) ||
                                          IngridResponsive.isSmallWeb(
                                              context) ||
                                          IngridResponsive.isMediumWeb(
                                              context)) {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              child: EmailPreview(
                                                onTap: () {
                                                  isshowButton = !isshowButton;
                                                  setState(() {});
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FxBox.w24,
              !isshowButton
                  ? Expanded(
                      child: EmailPreview(
                        onTap: () {
                          isshowButton = !isshowButton;
                          setState(() {});
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          SafeArea(child: FxBox.h24),
        ],
      ),
    );
  }
}
