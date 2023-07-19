import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/widget/title.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

import 'card.dart';
import 'memory_chart.dart';
import 'review.dart';
import 'server_chart.dart';
import 'sidebar.dart';
import 'statistic_chart.dart';
import 'visitor_chart.dart';

@RoutePage()
class IngridDashboard extends StatelessWidget {
  const IngridDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxBox.h24,
                  const RouteTitle(),
                  FxBox.h24,
                  const DashboardCardList(),
                  FxBox.h24,
                  if (IngridResponsive.isMobile(context) ||
                      IngridResponsive.isTablet(context)) ...[
                    const VisitorChart(),
                    FxBox.h24,
                    const MemoryChart(),
                    FxBox.h24,
                    const StatisticChart(),
                    FxBox.h24,
                    const ServerChart(),
                  ],
                  if (IngridResponsive.isSmallWeb(context) ||
                      IngridResponsive.isMediumWeb(context)) ...[
                    const VisitorChart(),
                    FxBox.h24,
                    const StatisticChart(),
                    FxBox.h24,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(child: MemoryChart()),
                        FxBox.w24,
                        const Expanded(child: ServerChart()),
                      ],
                    ),
                  ],
                  if (IngridResponsive.isLargeWeb(context)) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(flex: 2, child: VisitorChart()),
                        FxBox.w24,
                        const Expanded(child: MemoryChart()),
                      ],
                    ),
                    FxBox.h24,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(flex: 2, child: StatisticChart()),
                        FxBox.w24,
                        const Expanded(child: ServerChart()),
                      ],
                    ),
                  ],
                  FxBox.h24,
                  Text(
                    ConstString.userReview,
                    style: ConstTheme.title(context).copyWith(fontSize: 24.0),
                  ),
                  FxBox.h24,
                  if (IngridResponsive.isMobile(context) ||
                      IngridResponsive.isTablet(context)) ...[
                    const ReviewCard(userName: 'Johnny Ahmad'),
                    FxBox.h24,
                    const ReviewCard(userName: 'Tatang Wijaya'),
                    FxBox.h24,
                    const ReviewCard(userName: 'Budi Prabowo'),
                  ],
                  if (IngridResponsive.isSmallWeb(context) ||
                      IngridResponsive.isMediumWeb(context) ||
                      IngridResponsive.isLargeWeb(context))
                    const ReviewList(),
                  FxBox.h24,
                  if (!IngridResponsive.isLargeWeb(context)) ...[
                    const Sidebar(),
                    FxBox.h24,
                  ],
                ],
              ),
            ),
          ),
          if (IngridResponsive.isLargeWeb(context))
            const Expanded(flex: 1, child: Sidebar()),
        ],
      ),
    );
  }
}
