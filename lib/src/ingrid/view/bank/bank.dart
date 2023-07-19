import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/view/bank/Earning_categories.dart';
import 'package:admin_dashboard/src/ingrid/view/bank/friend_box.dart';
import 'package:admin_dashboard/src/ingrid/view/bank/income_expose_chart.dart';
import 'package:admin_dashboard/src/ingrid/view/bank/latest_transaction_bank.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class BankScreen extends StatefulWidget {
  const BankScreen({super.key});

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxBox.h24,
            const RouteTitle(),
            FxBox.h24,
            if (IngridResponsive.isMobile(context) ||
                IngridResponsive.isTablet(context)) ...[
              const DetailsCard(
                title: ConstString.yourBalance,
                data: '\$123.66',
                image: 'assets/ingrid/coin.png',
              ),
              FxBox.h24,
              const LatestBankTransaction(),
              FxBox.h24,
              const EarningCategories(),
              FxBox.h24,
              const IncomeExposeChart(
                barColor: ConstColor.primary,
                header: ConstString.income,
                totalIncome: '\$3,741',
                totalIncomepr: '+ 15%',
              ),
              FxBox.h24,
              const IncomeExposeChart(
                barColor: ConstColor.redAccent,
                header: ConstString.expense,
                totalIncome: '\$800,12',
                totalIncomepr: '- 15%',
              ),
              FxBox.h24,
              const FriendBox()
            ],
            if (IngridResponsive.isSmallWeb(context) ||
                IngridResponsive.isMediumWeb(context)) ...[
              const LatestBankTransaction(),
              FxBox.h24,
              Row(
                children: [
                  const Expanded(
                    child: IncomeExposeChart(
                      barColor: ConstColor.primary,
                      header: ConstString.income,
                      totalIncome: '\$3,741',
                      totalIncomepr: '+ 15%',
                    ),
                  ),
                  FxBox.w24,
                  const Expanded(
                    child: IncomeExposeChart(
                      barColor: ConstColor.redAccent,
                      header: ConstString.expense,
                      totalIncome: '\$800,12',
                      totalIncomepr: '- 15%',
                    ),
                  ),
                ],
              ),
              FxBox.h24,
              Row(
                children: [
                  const Expanded(
                    child: FriendBox(),
                  ),
                  FxBox.w24,
                  Expanded(
                    child: Column(
                      children: [
                        const DetailsCard(
                          title: ConstString.yourBalance,
                          data: '\$123.66',
                          image: 'assets/ingrid/coin.png',
                        ),
                        FxBox.h24,
                        const EarningCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
            if (IngridResponsive.isLargeWeb(context)) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                                flex: 6, child: LatestBankTransaction()),
                            FxBox.w24,
                            const Expanded(flex: 4, child: EarningCategories()),
                          ],
                        ),
                        FxBox.h24,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: IncomeExposeChart(
                                barColor: ConstColor.primary,
                                header: ConstString.income,
                                totalIncome: '\$3,741',
                                totalIncomepr: '+ 15%',
                              ),
                            ),
                            FxBox.w24,
                            const Expanded(
                              child: IncomeExposeChart(
                                barColor: ConstColor.redAccent,
                                header: ConstString.expense,
                                totalIncome: '\$800,12',
                                totalIncomepr: '- 15%',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FxBox.w24,
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const DetailsCard(
                        title: ConstString.yourBalance,
                        data: '\$123.66',
                        image: 'assets/ingrid/coin.png',
                      ),
                      FxBox.h24,
                      const FriendBox(),
                    ],
                  )),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
