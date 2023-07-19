import 'package:admin_dashboard/src/admin/constant/enum.dart';
import 'package:admin_dashboard/src/admin/utils/charts/chartsutils.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class ChartJsChart extends StatefulWidget {
  const ChartJsChart({Key? key}) : super(key: key);

  @override
  State<ChartJsChart> createState() => _ChartJsChartState();
}

class _ChartJsChartState extends State<ChartJsChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: Responsive.isTablet(context) || Responsive.isMobile(context)
          ? [
              _card(ChartType.chartJsBarChart, context,
                  languageModel.chart.barChart),
              FxBox.h20,
              _card(ChartType.multipleStaticChart, context,
                  languageModel.chart.multipleStatisticsChart),
              FxBox.h20,
              _card(ChartType.polarChart, context,
                  languageModel.chart.polarChart),
              FxBox.h20,
            ]
          : [
              Row(
                children: [
                  Expanded(
                    child: _card(ChartType.chartJsBarChart, context,
                        languageModel.chart.barChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.multipleStaticChart, context,
                        languageModel.chart.multipleStatisticsChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.polarChart, context,
                        languageModel.chart.polarChart),
                  ),
                ],
              ),
              FxBox.h20,
              // Row(
              //   children: [
              //     Expanded(
              //       child: _card(
              //           ChartType.polarChart, context, Strings.polarChart),
              //     ),
              //     FxBox.w20,
              //     Expanded(
              //       child: _card(
              //           ChartType.radarChart, context, Strings.radarChart),
              //     ),
              //   ],
              // ),
            ],
    );
  }
}

Widget _card(ChartType chartType, BuildContext context, String name) {
  return SizedBox(
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            FxBox.h12,
            // getChartData(chartType, context),
            FxBox.h12,
            SizedBox(
              width: double.infinity,
              height: 400,
              child: getChart(chartType),
            ),
          ],
        ),
      ),
    ),
  );
}
