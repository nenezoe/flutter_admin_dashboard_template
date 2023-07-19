import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class Error404 extends StatefulWidget {
  const Error404({Key? key}) : super(key: key);

  @override
  State<Error404> createState() => _Error404State();
}

class _Error404State extends State<Error404> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width < 1200
                ? Responsive.isTablet(context)
                    ? 60
                    : Responsive.isMobile(context)
                        ? 48
                        : 96
                : 228,
          ),
          alignment: Alignment.center,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Responsive.isWeb(context)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "404!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 80,
                                    ),
                                  ),
                                  Text(
                                    languageModel.extraPage.error1,
                                    style: TextStyle(
                                      color: isDark
                                          ? ColorConst.darkFontColor
                                          : ColorConst.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21,
                                    ),
                                  ),
                                  FxBox.h24,
                                  Text(languageModel.lorem2),
                                  FxBox.h48,
                                  FxButton(
                                    borderRadius: 15,
                                    text: "Back to Dashboard",
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.home,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            //FxBox.w(84),
                            Expanded(
                              child: SizedBox(
                                height: 500,
                                width: 600,
                                child: SvgPicture.asset(
                                  'assets/images/error-404.svg',
                                  fit: BoxFit.cover,
                                ),
                                // child: Image.asset("assets/images/image.png"),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "404!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 80,
                              ),
                            ),
                            Text(
                              languageModel.extraPage.error1,
                              style: TextStyle(
                                color: isDark
                                    ? ColorConst.darkFontColor
                                    : ColorConst.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                            FxBox.h24,
                            Text(languageModel.lorem2),
                            FxBox.h48,
                            FxButton(
                              borderRadius: 15,
                              text: "Back to Dashboard",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.home,
                                size: 15,
                              ),
                            ),
                            FxBox.h48,
                            SizedBox(
                              height: 300,
                              width: 400,
                              child: SvgPicture.asset(
                                'assets/images/error-404.svg',
                                fit: BoxFit.cover,
                              ),
                              // child: Image.asset("assets/images/image.png"),
                            ),
                          ],
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
