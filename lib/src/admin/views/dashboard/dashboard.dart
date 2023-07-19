// ignore_for_file: prefer_const_constructors

import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/views/dashboard/activity.dart';
import 'package:admin_dashboard/src/admin/views/dashboard/chat_screen.dart';
import 'package:admin_dashboard/src/admin/views/dashboard/client_review.dart';
import 'package:admin_dashboard/src/admin/views/dashboard/list_item.dart';
import 'package:admin_dashboard/src/admin/views/dashboard/montly_earning.dart';
import 'package:admin_dashboard/src/admin/views/dashboard/sales_analytics.dart';
import 'package:admin_dashboard/src/admin/views/dashboard/sales_report.dart';
import 'package:admin_dashboard/src/admin/views/dashboard/status_box.dart';
import 'package:admin_dashboard/src/admin/views/dashboard/top_producr_sales_box.dart';
import 'package:admin_dashboard/src/admin/views/dashboard/transaction.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class Dashboard extends StatefulWidget {
   const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Listitem(),
            FxBox.h24,
             Monthlyearning(),
            FxBox.h24,
            Responsive.isWeb(context)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Expanded(
                        child: SalesReport(),
                      ),
                      FxBox.w24,
                       Expanded(
                        child: Salesanalytics(),
                      ),
                    ],
                  )
                : Column(
                    children: [
                       SalesReport(),
                      FxBox.h24,
                       Salesanalytics(),
                    ],
                  ),
            FxBox.h24,
            Responsive.isWeb(context)
                ? Row(
                    children: [
                       Expanded(
                        child: Chatscreen(),
                      ),
                      FxBox.w24,
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                 Expanded(child: StatusBox()),
                                FxBox.w24,
                                 Expanded(child: TopProductSale()),
                              ],
                            ),
                            FxBox.h24,
                             Clienresponse(),
                          ],
                        ),
                      ),
                      FxBox.w24,
                       Expanded(
                        child: Activity(),
                      ),
                    ],
                  )
                : Column(
                    children: [
                       Chatscreen(),
                      FxBox.h24,
                      Responsive.isTablet(context)
                          ? Row(
                              children: [
                                 Expanded(child: StatusBox()),
                                FxBox.w24,
                                 Expanded(child: TopProductSale()),
                              ],
                            )
                          : Column(
                              children: [
                                 StatusBox(),
                                FxBox.h24,
                                 TopProductSale(),
                              ],
                            ),
                      FxBox.h24,
                       Clienresponse(),
                      FxBox.h24,
                       Activity(),
                    ],
                  ),
            FxBox.h24,
             Transaction(),
          ],
        ),
      ],
    );
  }
}
