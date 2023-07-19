import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/utils/extainsions/string_extainsions.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/views/dashboard/sales_analytics.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/e_commerce_dashboard/global_sale.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/e_commerce_dashboard/sales_overview.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/e_commerce_dashboard/vender_sales.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/e_commerce_dashboard/vender_transaction.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class EcommerceDashboard extends StatefulWidget {
  const EcommerceDashboard({super.key});

  @override
  State<EcommerceDashboard> createState() => _EcommerceDashboardState();
}

class _EcommerceDashboardState extends State<EcommerceDashboard> {
  final List<Map<String, dynamic>> _typeOfData = [
    {
      "type": "Orders",
      "color": 0xFFf0f0ff,
      "number": "74,516",
    },
    {
      "type": "Revenue",
      "color": 0xFFfef0f6,
      "number": "\$28,947",
    },
    {
      "type": "Avg order value",
      "color": 0xFFe9faf5,
      "number": "\$8,947",
    },
    {
      "type": "Unique visiors",
      "color": 0xFFeaf3ff,
      "number": "45.2 K",
    },
  ];
  final List<int> _height = [80, 60, 90, 54, 42];

  // double _getWidth() {
  //   if (MediaQuery.of(context).size.width <= 550) {
  //     return MediaQuery.of(context).size.width / 2 - 40;
  //   } else if (MediaQuery.of(context).size.width <= 750) {
  //     return (MediaQuery.of(context).size.width / 2) - 50;
  //   } else if (Responsive.isWeb(context)) {
  //     return ((MediaQuery.of(context).size.width - 240) / 4) - 36;
  //   } else {
  //     return (MediaQuery.of(context).size.width / 3) - 36;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _dataItem(),
        // MediaQuery.of(context).size.width > 1250
        //     ? Wrap(
        //         spacing: 28.0,
        //         runSpacing: 26.0,
        //         children: [
        //           Expanded(
        //             child: _dataOfEcommerce('74,516', 0, 0xFFf0f0ff),
        //           ),
        //           Expanded(
        //             child: _dataOfEcommerce('\$28,947', 1, 0xFFfef0f6),
        //           ),
        //           Expanded(
        //             child: _dataOfEcommerce('\$8,947', 2, 0xFFe9faf5),
        //           ),
        //           Expanded(
        //             child: _dataOfEcommerce('45.2 K', 3, 0xFFeaf3ff),
        //           ),
        //         ],
        //       )
        //     : MediaQuery.of(context).size.width > 550
        //         ? Column(
        //             children: [
        //               Row(
        //                 children: [
        //                   Expanded(
        //                     child: _dataOfEcommerce('74,516', 0, 0xFFf0f0ff),
        //                   ),
        //                   const SizedBox(
        //                     width: 28,
        //                   ),
        //                   Expanded(
        //                     child: _dataOfEcommerce('\$28,947', 1, 0xFFfef0f6),
        //                   ),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 26.0,
        //               ),
        //               Row(
        //                 children: [
        //                   Expanded(
        //                     child: _dataOfEcommerce('\$8,947', 2, 0xFFe9faf5),
        //                   ),
        //                   const SizedBox(
        //                     width: 28,
        //                   ),
        //                   Expanded(
        //                     child: _dataOfEcommerce('45.2 K', 3, 0xFFeaf3ff),
        //                   ),
        //                 ],
        //               )
        //             ],
        //           )
        //         : Column(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: [
        //               SizedBox(
        //                 width: double.infinity,
        //                 child: _dataOfEcommerce('74,516', 0, 0xFFf0f0ff),
        //               ),
        //               const SizedBox(
        //                 height: 26.0,
        //               ),
        //               SizedBox(
        //                 width: double.infinity,
        //                 child: _dataOfEcommerce('\$28,947', 1, 0xFFfef0f6),
        //               ),
        //               const SizedBox(
        //                 height: 26.0,
        //               ),
        //               SizedBox(
        //                 width: double.infinity,
        //                 child: _dataOfEcommerce('\$8,947', 2, 0xFFe9faf5),
        //               ),
        //               const SizedBox(
        //                 height: 26.0,
        //               ),
        //               SizedBox(
        //                 width: double.infinity,
        //                 child: _dataOfEcommerce('45.2 K', 3, 0xFFeaf3ff),
        //               ),
        //               const SizedBox(
        //                 height: 26.0,
        //               ),
        //             ],
        //           ),

        FxBox.h24,
        Responsive.isWeb(context)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: VenderSalesReport(),
                  ),
                  FxBox.w24,
                  Expanded(
                    child: _reachdetails(),
                    //  Column(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Expanded(child: newUserBox()),
                    //         FxBox.w24,
                    //         Expanded(child: newsubcriptionBox()),
                    //       ],
                    //     ),
                    //     FxBox.h24,
                    //     totalsubcriptionBox(),
                    //   ],
                    // ),
                  ),
                  FxBox.w24,
                  const Expanded(
                    //flex: 2,
                    child: Salesanalytics(),
                  ),
                ],
              )
            : Column(
                children: [
                  const VenderSalesReport(),
                  FxBox.h24,
                  // Row(
                  //   children: [
                  //     Expanded(child: newUserBox()),
                  //     FxBox.w24,
                  //     Expanded(child: newsubcriptionBox()),
                  //   ],
                  // ),

                  // FxBox.h24,
                  // totalsubcriptionBox(),
                  _reachdetails(),
                  FxBox.h24,
                  const Salesanalytics(),
                ],
              ),
        FxBox.h24,
        Responsive.isWeb(context)
            ? Row(
                children: [
                  const Expanded(child: GlobalSale()),
                  FxBox.w24,
                  Expanded(child: _overViewChart()),
                ],
              )
            : Column(
                children: [
                  const GlobalSale(),
                  FxBox.h24,
                  _overViewChart(),
                ],
              ),
        FxBox.h24,
        const VenderTransaction(),
      ],
    );
  }

  Widget _reachdetails() {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        // alignment: Alignment.center,
        height: 465,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstText.lightText(
              text: languageModel.eCommerceAdmin.monthlyReportUser,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h10,
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 100,
                    right: 300,
                    child: Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(191, 159, 129, 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const CustomText(
                        title: '10%',
                        textColor: ColorConst.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    right: 150,
                    child: Container(
                      alignment: Alignment.center,
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 54, 64, 152),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const CustomText(
                        title: '52%',
                        textColor: ColorConst.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    right: 80,
                    child: Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(170, 191, 156, 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const CustomText(
                        title: '34%',
                        textColor: ColorConst.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    right: 90,
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(219, 211, 206, 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const CustomText(
                        title: '22%',
                        textColor: ColorConst.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FxBox.h12,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _descriptionHeadre(
                  boxColor: const Color.fromRGBO(170, 191, 156, 1),
                  headerText: languageModel.eCommerceAdmin.user,
                ),
                FxBox.w10,
                _descriptionHeadre(
                  boxColor: const Color.fromRGBO(219, 211, 206, 1),
                  headerText: languageModel.eCommerceAdmin.vender.trim(),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _descriptionHeadre(
                  boxColor: const Color.fromRGBO(191, 159, 129, 1),
                  headerText: languageModel.eCommerceAdmin.subscription,
                ),
                FxBox.w10,
                _descriptionHeadre(
                  boxColor: const Color.fromARGB(255, 54, 64, 152),
                  headerText: languageModel.eCommerceAdmin.total,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget newUserBox() {
  //   return Card(
  //     shadowColor: ColorConst.primary.withOpacity(0.5),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(18.0),
  //     ),
  //     elevation: 7,
  //     child: ConstrainedBox(
  //       constraints: BoxConstraints(
  //         minHeight: 200,
  //         minWidth: MediaQuery.of(context).size.width,
  //       ),
  //       child: Container(
  //         padding: const EdgeInsets.all(20),
  //         decoration: BoxDecoration(
  //           // color: ColorConst.primary,
  //           borderRadius: BorderRadius.circular(18.0),
  //         ),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             ConstText.lightText(
  //               text: 'New User',
  //               fontSize: 20,
  //               fontWeight: FontWeight.w600,
  //             ),
  //             ConstText.largeText(
  //               text: '24,800',
  //               fontSize: 33,
  //               color: ColorConst.primary,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget newsubcriptionBox() {
  //   return Card(
  //     shadowColor: ColorConst.primary.withOpacity(0.5),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(18.0),
  //     ),
  //     elevation: 7,
  //     child: ConstrainedBox(
  //       constraints: BoxConstraints(
  //         minHeight: 200,
  //         minWidth: MediaQuery.of(context).size.width,
  //       ),
  //       child: Container(
  //         padding: const EdgeInsets.all(20),
  //         decoration: BoxDecoration(
  //           // color: ColorConst.primary,
  //           borderRadius: BorderRadius.circular(18.0),
  //         ),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             ConstText.lightText(
  //               text: 'New SubScribers',
  //               fontSize: 20,
  //               fontWeight: FontWeight.w600,
  //             ),
  //             ConstText.largeText(
  //               text: '1452',
  //               fontSize: 33,
  //               color: ColorConst.primary,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget totalsubcriptionBox() {
  //   return Card(
  //     shadowColor: ColorConst.primary.withOpacity(0.5),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(18.0),
  //     ),
  //     elevation: 7,
  //     child: ConstrainedBox(
  //       constraints: BoxConstraints(
  //         minHeight: 200,
  //         minWidth: MediaQuery.of(context).size.width,
  //       ),
  //       child: Container(
  //         padding: const EdgeInsets.all(20),
  //         decoration: BoxDecoration(
  //           // color: ColorConst.primary,
  //           borderRadius: BorderRadius.circular(18.0),
  //         ),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             ConstText.lightText(
  //               text: 'Total SubScribers',
  //               fontSize: 20,
  //               fontWeight: FontWeight.w600,
  //             ),
  //             ConstText.largeText(
  //               text: '3200',
  //               fontSize: 33,
  //               color: ColorConst.primary,
  //               fontWeight: FontWeight.bold,
  //             ),
  //             ConstText.lightText(
  //               text: 'Lorem Ipsum is simply dummy text of the printing.',
  //               textAlign: TextAlign.center,
  //               fontSize: 15,
  //               // color: ColorConst.white.withOpacity(0.5),
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _overViewChart() {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        constraints: const BoxConstraints(minHeight: 418),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstText.lightText(
                  text: languageModel.eCommerceAdmin.salesOverview,
                  fontWeight: FontWeight.bold,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _descriptionHeadre(
                      boxColor: const Color(0xff81d7d0),
                      headerText: languageModel.eCommerceAdmin.traffics,
                    ),
                    FxBox.h10,
                    _descriptionHeadre(
                      boxColor: const Color(0xffaab1e6),
                      headerText: languageModel.eCommerceAdmin.sales,
                    ),
                  ],
                ),
              ],
            ),
            FxBox.h40,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 240,
              // child: _chart(),
              child: const SalesOverview(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _descriptionHeadre({
    Color? boxColor,
    required String headerText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2), color: boxColor),
        ),
        FxBox.w10,
        ConstText.lightText(
          text: headerText,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }

  Widget _dataItem() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        gridDelegate: Responsive.isMobile(context)
            ? const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 205,
              )
            : MediaQuery.of(context).size.width < 1500
                ? const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 205,
                  )
                : SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent:
                        MediaQuery.of(context).size.width * 0.24,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 205,
                  ),
        itemCount: _typeOfData.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _dataOfEcommerce(
            name: _typeOfData[index]['type'],
            decidedColor: _typeOfData[index]['color'],
            number: _typeOfData[index]['number'],
            typeOfData: index,
          );
        },
      ),
    );
  }

  Widget _dataOfEcommerce({
    required String number,
    required int typeOfData,
    required int decidedColor,
    required String name,
  }) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                languageModel.translate(name.camelCase()),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Row(
                children: [
                  Icon(
                    typeOfData != 2
                        ? Icons.arrow_upward_outlined
                        : Icons.arrow_downward_rounded,
                    color: typeOfData != 2 ? Colors.green : Colors.red,
                  ),
                  const Text('Since last week')
                ],
              ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < 5; i++) ...[
                Container(
                  height: _height[i].toDouble(),
                  width: 15,
                  // color: Colors.green.withOpacity(0.2),
                  color: Color(decidedColor),
                ),
                const SizedBox(
                  width: 3,
                )
              ],
            ],
          ),
        ],
      ),
    );
  }
}
