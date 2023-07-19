import 'package:admin_dashboard/src/admin/constant/enum.dart';
// import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/admin/utils/charts/chartsutils.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class ChartListChart extends StatefulWidget {
  const ChartListChart({Key? key}) : super(key: key);

  @override
  State<ChartListChart> createState() => _ChartListChartState();
}

class _ChartListChartState extends State<ChartListChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: Responsive.isTablet(context) || Responsive.isMobile(context)
          ? [
              _card(ChartType.animatingPieChart, context,
                  languageModel.chart.animatingDonutWithSvg),
              FxBox.h20,
              _card(ChartType.simplePieChart, context,
                  languageModel.chart.simplePieChart),
              FxBox.h20,
              _card(ChartType.advancedSmileChart, context,
                  languageModel.chart.advancedSmileAnimation),
              FxBox.h20,
              _card(ChartType.simpleLineChart, context,
                  languageModel.chart.simpleLineChart),
              FxBox.h20,
              _card(ChartType.lineScatterChart, context,
                  languageModel.chart.lineScatterDiagram),
              FxBox.h20,
              _card(ChartType.lineChartWithArea, context,
                  languageModel.chart.lineChartWithArea),
              FxBox.h20,
              _card(ChartType.overlapBars, context,
                  languageModel.chart.overlappingChart),
            ]
          : [
              Row(
                children: [
                  Expanded(
                    child: _card(ChartType.animatingPieChart, context,
                        languageModel.chart.animatingDonutWithSvg),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.simplePieChart, context,
                        languageModel.chart.simplePieChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.advancedSmileChart, context,
                        languageModel.chart.advancedSmileAnimation),
                  ),
                ],
              ),
              FxBox.h20,
              Row(
                children: [
                  Expanded(
                    child: _card(ChartType.simpleLineChart, context,
                        languageModel.chart.simpleLineChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.lineScatterChart, context,
                        languageModel.chart.lineScatterDiagram),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.lineChartWithArea, context,
                        languageModel.chart.lineChartWithArea),
                  ),
                ],
              ),
              FxBox.h20,
              Row(
                children: [
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.overlapBars, context,
                        languageModel.chart.overlappingChart),
                  ),
                ],
              ),
              FxBox.h20,
            ],
    );
  }
}

Widget _card(ChartType chartType, BuildContext context, String name) {
  return SizedBox(
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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
