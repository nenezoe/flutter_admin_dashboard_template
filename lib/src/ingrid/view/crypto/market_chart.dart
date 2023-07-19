import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';

List<dynamic> _chartData = [10, 8, 12, 10.8, 15, 5, 13.9, 17, 20, 16.2];

Map<String, dynamic> _map = {
  'Bitcoin': 'BTC / IRD',
  'Price': '666.2',
  'Rate': '-0.0182%/hr',
  'Volume': '100k',
};

class MarketChart extends StatelessWidget {
  const MarketChart({super.key});

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
          FxBox.h32,
          if (IngridResponsive.isTablet(context) ||
              IngridResponsive.isMobile(context)) ...[
            Row(
              children: [
                SvgPicture.asset(ConstIcons.bitcoin),
                FxBox.w16,
                Text(
                  'Bitcoin',
                  style: ConstTheme.title(context),
                ),
                IngridResponsive.isMobile(context) ? FxBox.w16 : FxBox.w40,
                SvgPicture.asset(ConstIcons.ethereum),
                FxBox.w16,
                Text(
                  'Etherium',
                  style: ConstTheme.title(context),
                ),
              ],
            ),
            FxBox.h16,
            Row(
              children: [
                SvgPicture.asset(ConstIcons.litecoin),
                FxBox.w16,
                Text(
                  'Litecoin',
                  style: ConstTheme.title(context),
                ),
                IngridResponsive.isMobile(context) ? FxBox.w16 : FxBox.w40,
                SvgPicture.asset(ConstIcons.ripple),
                FxBox.w16,
                Text(
                  'Ripplecoin',
                  style: ConstTheme.title(context),
                ),
              ],
            ),
          ],
          if (!IngridResponsive.isTablet(context) &&
              !IngridResponsive.isMobile(context))
            Row(
              children: [
                SvgPicture.asset(ConstIcons.bitcoin),
                FxBox.w16,
                Text(
                  'Bitcoin',
                  style: ConstTheme.title(context),
                ),
                FxBox.w40,
                SvgPicture.asset(ConstIcons.ethereum),
                FxBox.w16,
                Text(
                  'Etherium',
                  style: ConstTheme.title(context),
                ),
                FxBox.w40,
                SvgPicture.asset(ConstIcons.litecoin),
                FxBox.w16,
                Text(
                  'Litecoin',
                  style: ConstTheme.title(context),
                ),
                FxBox.w40,
                SvgPicture.asset(ConstIcons.ripple),
                FxBox.w16,
                Text(
                  'Ripplecoin',
                  style: ConstTheme.title(context),
                ),
              ],
            ),
          FxBox.h48,
          if (IngridResponsive.isTablet(context) ||
              IngridResponsive.isMobile(context)) ...[
            SizedBox(
              height: 64.0,
              child: ListView.separated(
                itemCount: 2,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _map.keys.elementAt(index),
                        style:
                            ConstTheme.text(context).copyWith(fontSize: 18.0),
                      ),
                      FxBox.h4,
                      if (_map.keys.elementAt(index) == 'Price')
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _map.values.elementAt(index),
                              style: ConstTheme.title(context)
                                  .copyWith(fontSize: 24.0),
                            ),
                            FxBox.w8,
                            const Text(
                              '- 15%',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: ConstColor.redAccent,
                              ),
                            ),
                          ],
                        ),
                      if (_map.keys.elementAt(index) != 'Price')
                        Text(
                          _map.values.elementAt(index),
                          style: ConstTheme.title(context)
                              .copyWith(fontSize: 24.0),
                        ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => VerticalDivider(
                    width: IngridResponsive.isMobile(context) ? 40.0 : 80.0),
              ),
            ),
            FxBox.h8,
            SizedBox(
              height: 64.0,
              child: ListView.separated(
                itemCount: 2,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _map.keys.elementAt(index + 2),
                        style:
                            ConstTheme.text(context).copyWith(fontSize: 18.0),
                      ),
                      FxBox.h4,
                      Text(
                        _map.values.elementAt(index + 2),
                        style:
                            ConstTheme.title(context).copyWith(fontSize: 24.0),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => VerticalDivider(
                    width: IngridResponsive.isMobile(context) ? 40.0 : 80.0),
              ),
            ),
          ],
          if (!IngridResponsive.isTablet(context) &&
              !IngridResponsive.isMobile(context))
            SizedBox(
              height: 64.0,
              child: ListView.separated(
                itemCount: _map.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _map.keys.elementAt(index),
                        style:
                            ConstTheme.text(context).copyWith(fontSize: 18.0),
                      ),
                      FxBox.h4,
                      if (_map.keys.elementAt(index) == 'Price')
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _map.values.elementAt(index),
                              style: ConstTheme.title(context)
                                  .copyWith(fontSize: 24.0),
                            ),
                            FxBox.w8,
                            const Text(
                              '- 15%',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: ConstColor.redAccent,
                              ),
                            ),
                          ],
                        ),
                      if (_map.keys.elementAt(index) != 'Price')
                        Text(
                          _map.values.elementAt(index),
                          style: ConstTheme.title(context)
                              .copyWith(fontSize: 24.0),
                        ),
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    const VerticalDivider(width: 80.0),
              ),
            ),
          FxBox.h40,
          SizedBox(
            height: 280.0,
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
                            '${value.toInt()}',
                            maxLines: 1,
                            style: ConstTheme.hintText,
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      interval: 5,
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
                barGroups: List.generate(
                  _chartData.length,
                  (index) => BarChartGroupData(
                    x: index + 1,
                    barRods: [
                      BarChartRodData(
                        toY: double.parse('${_chartData[index]}'),
                        color: ConstColor.redAccent,
                      )
                    ],
                  ),
                ),
                gridData: FlGridData(show: true),
                alignment: BarChartAlignment.spaceAround,
                maxY: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
