import 'dart:ui';

import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/provider/theme/bloc/theme_mode_bloc.dart';
import 'package:admin_dashboard/src/admin/utils/extainsions/string_extainsions.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class Pricing extends StatefulWidget {
  const Pricing({Key? key}) : super(key: key);

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  final List<String> headingList = [
    'Starter',
    'Professional',
    'Enterprise',
    'Unlimited',
  ];
  final List<String> priceList = ["9.99", "29.99", "49.99", "99.99"];

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Wrap(
            runSpacing: 20.0,
            children: List.generate(
              4,
              (index) => _pricingCard(
                headingList[index],
                priceList[index],
              ),
            ),
          )
        : Responsive.isWeb(context)
            ? Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: List.generate(
                  4,
                  (index) => _pricingCard(
                    headingList[index],
                    priceList[index],
                  ),
                ),
              )
            : Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: List.generate(
                  4,
                  (index) => _pricingCard(
                    headingList[index],
                    priceList[index],
                  ),
                ),
              );
  }

  Widget _pricingCard(String title, String price) {
    return SizedBox(
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width
          : Responsive.isWeb(context)
              ? MediaQuery.of(context).size.width < 1300
                  ? (MediaQuery.of(context).size.width - 308) / 2
                  : (MediaQuery.of(context).size.width - 348) / 4
              : MediaQuery.of(context).size.width / 2 - 34,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  languageModel.translate(title.camelCase()),
                  style: TextStyle(
                    color: isDark
                        ? ColorConst.darkFontColor
                        : ColorConst.textColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FxBox.h48,
              listTile(
                text: languageModel.extraPage.pricing1,
                icons: Icons.check,
              ),
              listTile(
                text: languageModel.extraPage.pricing2,
                icons: Icons.check,
              ),
              listTile(
                text: languageModel.extraPage.pricing3,
                icons: Icons.check,
              ),
              listTile(
                text: languageModel.extraPage.pricing4,
                icons: Icons.clear,
              ),
              FxBox.h48,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "\$ ",
                    style: TextStyle(
                      fontFeatures: [FontFeature.superscripts()],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BlocBuilder<ThemeModeBloc, ThemeModeState>(
                    builder: (context, state) {
                      return Text(
                        "$price/ ",
                        style: TextStyle(
                          fontSize: 31,
                          color: isDark
                              ? ColorConst.darkFontColor
                              : ColorConst.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  const Text(
                    "Per month",
                    style: TextStyle(
                      fontFeatures: [FontFeature.subscripts()],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              FxBox.h48,
              FxButton(
                height: 48.0,
                borderRadius: 18,
                text: "Sign up Now",
                onPressed: () {},
                fullWidth: true,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listTile({String? text, IconData? icons}) {
    return ListTile(
      title: Row(
        children: [
          const Expanded(
            child: Icon(
              Icons.circle,
              size: 8,
              color: ColorConst.black,
            ),
          ),
          FxBox.w16,
          Expanded(
            flex: 4,
            child: Text(
              "$text",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      minLeadingWidth: 0,
      // leading: const Icon(
      //   Icons.circle,
      //   size: 8,
      //   color: ColorConst.black,
      // ),
      trailing: Expanded(
        child: Icon(
          icons,
          size: 19,
          color: ColorConst.primary,
        ),
      ),
    );
  }
}
