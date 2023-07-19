import 'package:admin_dashboard/src/admin/constant/enum.dart';
import 'package:admin_dashboard/src/admin/utils/charts/chartsutils.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class MorrisChart extends StatefulWidget {
  const MorrisChart({Key? key}) : super(key: key);

  @override
  State<MorrisChart> createState() => _MorrisChartState();
}

class _MorrisChartState extends State<MorrisChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: Responsive.isTablet(context) || Responsive.isMobile(context)
          ? [
              _card(
                  ChartType.lineChart, context, languageModel.chart.lineChart),
              FxBox.h20,
              _card(ChartType.barChart, context, languageModel.chart.barChart),
              FxBox.h20,
              _card(
                  ChartType.areaChart, context, languageModel.chart.areaChart),
              FxBox.h20,
              _card(
                  ChartType.piaChart, context, languageModel.chart.donutChart),
              FxBox.h20,
              _card(ChartType.colomnChart, context,
                  languageModel.chart.columnChart),
            ]
          : [
              Row(
                children: [
                  Expanded(
                    child: _card(ChartType.lineChart, context,
                        languageModel.chart.lineChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.piaChart, context,
                        languageModel.chart.donutChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.barChart, context,
                        languageModel.chart.barChart),
                  ),
                ],
              ),
              FxBox.h20,
              Row(
                children: [
                  Expanded(
                    child: _card(ChartType.areaChart, context,
                        languageModel.chart.areaChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.colomnChart, context,
                        languageModel.chart.columnChart),
                  ),
                ],
              ),
            ],
    );
  }
}

Widget _card(ChartType chartType, BuildContext context, String name) {
  return Card(
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
  );
}
