import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

List<String> _title = [
  'Weekly Meeting',
  'Meeting with Stackholder',
  'Research',
  'Break',
  'Research',
  'Do Nothing',
  'Go to Cafe',
  'Go Home',
];

class TimeLine extends StatelessWidget {
  const TimeLine({super.key});

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
                  ConstString.timeline,
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
              _title.length,
              (index) => IngridStep(
                title: _title[index],
                content: '2 March 2023, 13:45 PM',
                runningSpace: 8.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
