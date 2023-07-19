import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

Map<String, dynamic> _map = {
  '50.0': ConstColor.lightwhite,
  '10.0': ConstColor.redAccent,
  '40.0': ConstColor.blueAccent
};

class MemoryChart extends StatelessWidget {
  const MemoryChart({super.key});

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
                  ConstString.memory,
                  style: ConstTheme.title(context),
                ),
              ),
              const SvgIcon(
                icon: ConstIcons.menu,
                color: ConstColor.hintColor,
              ),
            ],
          ),
          FxBox.h24,
          SizedBox(
            height: 220.0,
            child: PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 72,
                sections: List.generate(
                  _map.length,
                  (index) => PieChartSectionData(
                    color: _map.values.elementAt(index),
                    value: double.parse(_map.keys.elementAt(index)),
                    radius: 32.0,
                    showTitle: false,
                  ),
                ),
              ),
            ),
          ),
          FxBox.h32,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: CircleAvatar(
                  backgroundColor: ConstColor.redAccent,
                  radius: 3.0,
                ),
              ),
              FxBox.w8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('System', style: ConstTheme.hintText),
                  Text(
                    '1 GB',
                    style: ConstTheme.text(context)
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: CircleAvatar(
                  backgroundColor: ConstColor.blueAccent,
                  radius: 3.0,
                ),
              ),
              FxBox.w8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Used', style: ConstTheme.hintText),
                  Text(
                    '4 GB',
                    style: ConstTheme.text(context)
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: CircleAvatar(
                  backgroundColor: ConstColor.lightwhite,
                  radius: 3.0,
                ),
              ),
              FxBox.w8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Free', style: ConstTheme.hintText),
                  Text(
                    '5 GB',
                    style: ConstTheme.text(context)
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
