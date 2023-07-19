import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/widget/title.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

import 'market_capital.dart';
import 'market_chart.dart';
import 'order_form.dart';
import 'tranding_activity.dart';
import 'transfer_trade.dart';

@RoutePage()
class Crypto extends StatelessWidget {
  const Crypto({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxBox.h24,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: RouteTitle(),
            ),
            FxBox.h24,
            if (IngridResponsive.isMobile(context) ||
                IngridResponsive.isTablet(context)) ...[
              const MarketChart(),
              FxBox.h24,
              const TrandingActivity(),
              FxBox.h24,
              const MarketCapital(),
              FxBox.h24,
              const OrderForm(),
              FxBox.h24,
              const TransferTrade(),
            ],
            if (IngridResponsive.isSmallWeb(context) ||
                IngridResponsive.isMediumWeb(context)) ...[
              const MarketChart(),
              FxBox.h24,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: TrandingActivity()),
                  FxBox.w24,
                  const Expanded(child: MarketCapital()),
                ],
              ),
              FxBox.h24,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: OrderForm()),
                  FxBox.w24,
                  const Expanded(child: TransferTrade()),
                ],
              ),
            ],
            if (IngridResponsive.isLargeWeb(context)) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 2, child: MarketChart()),
                  FxBox.w24,
                  const Expanded(child: TrandingActivity()),
                ],
              ),
              FxBox.h24,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: MarketCapital()),
                  FxBox.w24,
                  const Expanded(child: OrderForm()),
                  FxBox.w24,
                  const Expanded(child: TransferTrade()),
                ],
              ),
            ],
            SafeArea(child: FxBox.h24),
          ],
        ),
      ),
    );
  }
}
