import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

List<String> _bottomData = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

class IncomeExposeChart extends StatelessWidget {
  const IncomeExposeChart({
    super.key,
    required this.barColor,
    required this.header,
    required this.totalIncome,
    required this.totalIncomepr,
  });
  final Color barColor;
  final String header;
  final String totalIncome;
  final String totalIncomepr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: IngridCard(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    header,
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
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: totalIncome,
                    style: ConstTheme.title(context).copyWith(fontSize: 36),
                  ),
                  TextSpan(
                    text: totalIncomepr,
                    style: ConstTheme.title(context)
                        .copyWith(fontSize: 18, color: barColor),
                  )
                ],
              ),
            ),
            FxBox.h16,
            SizedBox(
              height: 200.0,
              child: BarChart(
                BarChartData(
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: context.isDarkMode
                          ? Colors.white
                          : ConstColor.darkAppBar,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.toY}0',
                          TextStyle(
                            color: !context.isDarkMode
                                ? Colors.white
                                : ConstColor.darkAppBar,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      },
                    ),
                  ),
                  maxY: 20,
                  titlesData: FlTitlesData(
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 40.0,
                        getTitlesWidget: (value, meta) {
                          String text;
                          if (value == 0) {
                            text = '0';
                          } else if (value == 5) {
                            text = '50';
                          } else if (value == 10) {
                            text = '100';
                          } else if (value == 15) {
                            text = '150';
                          } else if (value == 20) {
                            text = '200';
                          } else {
                            return Container();
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 4.0,
                            child: Text(
                              text,
                              maxLines: 1,
                              style: ConstTheme.hintText,
                            ),
                          );
                        },
                        showTitles: true,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
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
                              _bottomData[value.toInt()],
                              style: ConstTheme.hintText,
                            ),
                          );
                        },
                        showTitles: true,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: [
                    makeGroupData(0, 12),
                    makeGroupData(1, 14),
                    makeGroupData(2, 10),
                    makeGroupData(3, 9),
                    makeGroupData(4, 5),
                    makeGroupData(5, 18),
                    makeGroupData(6, 16),
                  ],
                  gridData: FlGridData(
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: barColor,
          width: 24,
          borderRadius: BorderRadius.circular(12.0),
        ),
      ],
    );
  }
}
