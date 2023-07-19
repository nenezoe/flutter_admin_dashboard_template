import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/icons.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class Maintenance extends StatefulWidget {
  const Maintenance({Key? key}) : super(key: key);

  @override
  State<Maintenance> createState() => _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Center(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Responsive.isMobile(context)
                        ? Column(
                            children: [
                              SvgPicture.asset(
                                IconlyBroken.adminKitText,
                              ),
                              FxBox.h28,
                              Text(
                                "Site is Under Maintenance",
                                style: TextStyle(
                                  color: isDark
                                      ? ColorConst.darkFontColor
                                      : ColorConst.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                              FxBox.h8,
                              Text(
                                "Please check back in sometime.",
                                style: TextStyle(
                                  color: isDark
                                      ? ColorConst.darkFontColor
                                      : ColorConst.textColor,
                                ),
                              ),
                              FxBox.h32,
                              const CustomText(
                                textAlign: TextAlign.center,
                                title:
                                    'Our website is under construction, we are working \nvery hard to give you the best experience with this one.',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              FxBox.h28,
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 1,
                                child: Image.asset(
                                  Images.maintenance,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          )
                        //Column(children: _list())
                        : Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      IconlyBroken.adminKitText,
                                    ),
                                    FxBox.h28,
                                    Text(
                                      languageModel.extraPage.maintenancaTitle,
                                      style: TextStyle(
                                        color: isDark
                                            ? ColorConst.darkFontColor
                                            : ColorConst.textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                      ),
                                    ),
                                    FxBox.h8,
                                    Text(
                                      languageModel.extraPage.maintenancaSubtitle,
                                      style: TextStyle(
                                        color: isDark
                                            ? ColorConst.darkFontColor
                                            : ColorConst.textColor,
                                      ),
                                    ),
                                    FxBox.h32,
                                    CustomText(
                                      textAlign: TextAlign.center,
                                      title:
                                          languageModel.extraPage.maintenancaText,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Image.asset(
                                    Images.maintenance,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
