import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

List<int> _chartDataOne = [
  100,
  80,
  150,
  100,
  50,
  175,
  120,
  100,
  135,
  145,
  150,
  100
];
List<int> _chartDataTwo = [
  125,
  130,
  115,
  125,
  75,
  150,
  120,
  135,
  115,
  185,
  100,
  100
];
List<String> _bottom = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

class VisitorChart extends StatelessWidget {
  const VisitorChart({super.key});

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
                  ConstString.visitor,
                  style: ConstTheme.title(context),
                ),
              ),
              const SvgIcon(
                icon: ConstIcons.menu,
                color: ConstColor.hintColor,
              ),
            ],
          ),
          FxBox.h16,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CircleAvatar(
                backgroundColor: ConstColor.blueAccent,
                radius: 3.0,
              ),
              FxBox.w8,
              Text('This Month', style: ConstTheme.hintText),
              FxBox.w16,
              const CircleAvatar(
                backgroundColor: ConstColor.redAccent,
                radius: 3.0,
              ),
              FxBox.w8,
              Text('Last Month', style: ConstTheme.hintText),
            ],
          ),
          FxBox.h24,
          SizedBox(
            height: 256.0,
            child: BarChart(
              BarChartData(
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 4.0,
                          child: Text(
                            _bottom[value.toInt() - 1],
                            maxLines: 1,
                            style: ConstTheme.hintText,
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 4.0,
                          child: Text(
                            meta.formattedValue,
                            maxLines: 1,
                            style: ConstTheme.hintText,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                groupsSpace: 4.0,
                barGroups: List.generate(
                  _chartDataOne.length,
                  (index) => BarChartGroupData(
                    x: index + 1,
                    barRods: [
                      BarChartRodData(
                        toY: double.parse('${_chartDataOne[index]}'),
                        color: ConstColor.redAccent,
                        borderRadius: BorderRadius.zero,
                        width: 12.0,
                      ),
                      BarChartRodData(
                        toY: double.parse('${_chartDataTwo[index]}'),
                        color: ConstColor.blueAccent,
                        borderRadius: BorderRadius.zero,
                        width: 12.0,
                      ),
                    ],
                  ),
                ),
                gridData: FlGridData(show: true, drawVerticalLine: false),
                alignment: BarChartAlignment.spaceAround,
                maxY: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
