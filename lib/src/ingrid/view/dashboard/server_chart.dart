import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/widget/button.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

List<int> _chartData = [75, 125, 25, 135, 95, 200, 150];

class ServerChart extends StatelessWidget {
  const ServerChart({super.key});

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
                  ConstString.serverStatus,
                  style: ConstTheme.title(context),
                ),
              ),
              const SvgIcon(
                icon: ConstIcons.menu,
                color: ConstColor.hintColor,
              ),
            ],
          ),
          FxBox.h20,
          const IngridButton(text: 'Active', size: Size.fromWidth(72.0)),
          FxBox.h16,
          SizedBox(
            height: 180.0,
            child: LineChart(
              LineChartData(
                minY: 0.0,
                maxY: 200.0,
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                        _chartData.length,
                        (index) => FlSpot(
                            index.toDouble(), _chartData[index].toDouble())),
                    isCurved: true,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
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
                lineTouchData: LineTouchData(enabled: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
              ),
            ),
          ),
          FxBox.h32,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Country', style: ConstTheme.hintText),
                  Text(
                    'India',
                    style: ConstTheme.text(context)
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Domain', style: ConstTheme.hintText),
                  Text(
                    'website.com',
                    style: ConstTheme.text(context)
                        .copyWith(color: ConstColor.blueAccent),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Storage', style: ConstTheme.hintText),
                  Text(
                    '10 GB',
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
