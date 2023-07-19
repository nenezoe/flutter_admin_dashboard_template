import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/icons.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (Responsive.isWeb(context))
          const Expanded(flex: 2, child: SizedBox.shrink()),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FxBox.h(100),
              _dailog(),
              FxBox.h(100),
            ],
          ),
        ),
        if (Responsive.isWeb(context))
          const Expanded(flex: 2, child: SizedBox.shrink()),
      ],
    );
  }

  Widget _dailog() {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _successBox(),
      ),
    );
  }

  Widget _successBox() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgIcon(
            icon: IconlyBroken.verify,
            size: 120,
            color: ColorConst.successDark,
          ),
          FxBox.h20,
          CustomText(
            textAlign: TextAlign.center,
            title: '${languageModel.eCommerceWeb.successLorem1}'
                '${languageModel.eCommerceWeb.successLorem2}',
          ),
          FxBox.h20,
          FxButton(
            color: ColorConst.primaryDark,
            textColor: ColorConst.white,
            onPressed: () {
              autoTabRouter!.setActiveIndex(0);
            },
            text: 'Go To Home',
          ),
        ],
      ),
    );
  }
}
