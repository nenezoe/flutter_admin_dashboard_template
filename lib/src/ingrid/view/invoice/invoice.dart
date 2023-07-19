import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/title.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

import 'chart_transaction.dart';
import 'lastest_invoice.dart';
import 'send_invoice.dart';
import 'transfer_history.dart';

@RoutePage()
class IngridInvoice extends StatelessWidget {
  const IngridInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxBox.h24,
            const RouteTitle(),
            FxBox.h24,
            if (IngridResponsive.isMobile(context) ||
                IngridResponsive.isTablet(context)) ...[
              const ChartTransaction(),
              FxBox.h24,
              const LastestInvoice(),
              FxBox.h24,
              const TransferHistory(),
              FxBox.h24,
              const DetailsCard(
                title: ConstString.yourBalance,
                data: '\$123.66',
                image: 'assets/ingrid/coin.png',
              ),
              FxBox.h24,
              const SendInvoice(),
            ],
            if (IngridResponsive.isSmallWeb(context) ||
                IngridResponsive.isMediumWeb(context)) ...[
              const ChartTransaction(),
              FxBox.h24,
              const LastestInvoice(),
              FxBox.h24,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: TransferHistory(),
                  ),
                  FxBox.w24,
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const DetailsCard(
                          title: ConstString.yourBalance,
                          data: '\$123.66',
                          image: 'assets/ingrid/coin.png',
                        ),
                        FxBox.h24,
                        const SendInvoice(),
                      ],
                    ),
                  ),
                ],
              )
            ],
            if (IngridResponsive.isLargeWeb(context))
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const ChartTransaction(),
                        FxBox.h24,
                        const LastestInvoice(),
                      ],
                    ),
                  ),
                  FxBox.w24,
                  const Expanded(
                    flex: 1,
                    child: TransferHistory(),
                  ),
                  FxBox.w24,
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const DetailsCard(
                          title: ConstString.yourBalance,
                          data: '\$123.66',
                          image: 'assets/ingrid/coin.png',
                        ),
                        FxBox.h24,
                        const SendInvoice(),
                      ],
                    ),
                  ),
                ],
              ),
            SafeArea(child: FxBox.h24),
          ],
        ),
      ),
    );
  }
}
