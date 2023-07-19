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

List<String> _bottomData = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

class ChartTransaction extends StatelessWidget {
  const ChartTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ConstString.chartTransaction,
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
              Text('Income', style: ConstTheme.hintText),
              FxBox.w16,
              const CircleAvatar(
                backgroundColor: ConstColor.redAccent,
                radius: 3.0,
              ),
              FxBox.w8,
              Text('Outcome', style: ConstTheme.hintText),
            ],
          ),
          FxBox.h24,
          SizedBox(
            height: 256.0,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 350),
                      FlSpot(1, 800),
                      FlSpot(2, 500),
                      FlSpot(3, 1200),
                      FlSpot(4, 700),
                      FlSpot(5, 1400),
                      FlSpot(6, 1200),
                    ],
                    isCurved: true,
                    barWidth: 2,
                    color: ConstColor.redAccent,
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ConstColor.redAccent.withOpacity(0.5),
                          ConstColor.redAccent.withOpacity(0.25),
                          ConstColor.redAccent.withOpacity(0.0),
                        ],
                      ),
                      show: true,
                    ),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                        radius: 4,
                        color: ConstColor.redAccent,
                        strokeColor: ConstColor.redAccent,
                      ),
                    ),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 1250),
                      FlSpot(1, 1750),
                      FlSpot(2, 900),
                      FlSpot(3, 1200),
                      FlSpot(4, 250),
                      FlSpot(5, 1250),
                      FlSpot(6, 650),
                    ],
                    isCurved: true,
                    barWidth: 2,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                        radius: 4,
                        color: ConstColor.blueAccent,
                        strokeColor: ConstColor.blueAccent,
                      ),
                    ),
                    color: ConstColor.blueAccent,
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ConstColor.blueAccent.withOpacity(0.5),
                          ConstColor.blueAccent.withOpacity(0.25),
                          ConstColor.blueAccent.withOpacity(0.0),
                        ],
                      ),
                      show: true,
                    ),
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
                            _bottomData[value.toInt()],
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
                borderData: FlBorderData(
                  border: const Border(
                    left: BorderSide(color: ConstColor.hintColor),
                    bottom: BorderSide(color: ConstColor.hintColor),
                  ),
                ),
                gridData: FlGridData(
                  drawHorizontalLine: true,
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
