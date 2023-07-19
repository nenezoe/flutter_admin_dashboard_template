import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
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

class StatisticChart extends StatelessWidget {
  const StatisticChart({super.key});

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ConstString.statistic,
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
            child: LineChart(
              LineChartData(
                minY: 0.0,
                maxY: 200.0,
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                        _chartDataOne.length,
                        (index) => FlSpot(
                            index.toDouble(), _chartDataOne[index].toDouble())),
                    isCurved: true,
                    barWidth: 2,
                    color: ConstColor.redAccent,
                    dotData: FlDotData(show: false),
                  ),
                  LineChartBarData(
                    spots: List.generate(
                        _chartDataTwo.length,
                        (index) => FlSpot(
                            index.toDouble(), _chartDataTwo[index].toDouble())),
                    isCurved: true,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                    color: ConstColor.blueAccent,
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: context.isDarkMode
                        ? Colors.white
                        : ConstColor.darkAppBar,
                    fitInsideHorizontally: true,
                    tooltipRoundedRadius: 8.0,
                  ),
                ),
                titlesData: FlTitlesData(
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 40.0,
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
                      showTitles: true,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      getTitlesWidget: (value, meta) {
                        if (value % 1 != 0) {
                          return const SizedBox.shrink();
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 4,
                          child: Text(
                            _bottom[value.toInt()],
                            style: ConstTheme.hintText,
                          ),
                        );
                      },
                      showTitles: true,
                    ),
                  ),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  drawHorizontalLine: false,
                  drawVerticalLine: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
