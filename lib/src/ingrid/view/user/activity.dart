import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/widget/button.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class LastestActivity extends StatelessWidget {
  const LastestActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ConstString.lastestActivity,
                  style: ConstTheme.title(context),
                ),
              ),
              const SvgIcon(
                icon: ConstIcons.menu,
                color: ConstColor.hintColor,
              ),
            ],
          ),
          FxBox.h28,
          IngridStepper(
            step: List.generate(
              5,
              (index) => IngridStep(
                title:
                    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean',
                content: '${index + 2} March 2023, 13:45 PM',
                titleStyle: ConstTheme.text(context),
              ),
            ),
          ),
          FxBox.h16,
          const IngridButton(text: 'View all activity'),
        ],
      ),
    );
  }
}
