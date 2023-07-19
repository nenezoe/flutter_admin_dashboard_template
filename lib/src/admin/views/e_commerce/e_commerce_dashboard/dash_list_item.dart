import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class DashListItem extends StatefulWidget {
  const DashListItem({Key? key}) : super(key: key);

  @override
  State<DashListItem> createState() => _DashListItemState();
}

class _DashListItemState extends State<DashListItem> {
  final List<Map<String, dynamic>> _listItem = [
    {
      'id': 0,
      'producTitle': languageModel.eCommerceAdmin.totalUser,
      'value': '3,930',
      'boxIcon': Icons.group_sharp,
      'boxColor': ['eb5757', '000000'],
      'percentage': 60,
    },
    {
      'id': 1,
      'producTitle': languageModel.eCommerceAdmin.totalOrders,
      'value': '67,000',
      'boxIcon': Icons.note_alt_rounded,
      'boxColor': ['44A08D', '093637'],
      'percentage': 10,
    },
    {
      'id': 2,
      'producTitle': languageModel.eCommerceAdmin.totalCancelledOrders,
      'value': '1100',
      'boxIcon': Icons.cancel_outlined,
      // 'boxColor': '9B5B1E',
      'boxColor': ['000C40', 'F0F2F0'],
      'percentage': 10,
    },
    {
      'id': 3,
      'producTitle': languageModel.eCommerceAdmin.totalReturnOrder,
      'value': '11,700',
      'boxIcon': Icons.pending_actions_outlined,
      'boxColor': ['E8CBC0', '636FA4'],
      'percentage': -5,
    },
    {
      'id': 4,
      'producTitle': languageModel.eCommerceAdmin.totalVenders,
      'value': '3,200',
      'boxIcon': Icons.group_sharp,
      'boxColor': ['de6161', '2657eb'],
      'percentage': 15,
    },
    {
      'id': 5,
      'producTitle': languageModel.eCommerceAdmin.payoutRequestProgress,
      'value': '40',
      'boxIcon': Icons.watch_later_outlined,
      'boxColor': ['3a6186', '89253e'],
      'percentage': -1,
    },
    {
      'id': 5,
      'producTitle': languageModel.eCommerceAdmin.totalVelueSales,
      'value': '76,675 \$',
      'boxIcon': Icons.shopping_bag_rounded,
      'boxColor': ['4ecdc4', '556270'],
      'percentage': 5,
    },
    {
      'id': 5,
      'producTitle': languageModel.eCommerceAdmin.yourTotalBalance,
      'value': '43,234 \$',
      'boxIcon': Icons.monetization_on_outlined,
      'boxColor': ['ffd89b', '19547b'],
      'percentage': 10,
    },
  ];
  @override
  Widget build(BuildContext context) {
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
        itemCount: _listItem.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _listContainer(
            boxIcon: _listItem[index]['boxIcon'],
            productTitle: _listItem[index]['producTitle'],
            value: _listItem[index]['value'],
            percentage: _listItem[index]['percentage'],
            color: [
              Color(int.parse('0xff${_listItem[index]['boxColor'][0]}')),
              Color(int.parse('0xff${_listItem[index]['boxColor'][1]}'))
            ],
          );
        },
      ),
    );
  }

  Widget _listContainer({
    required IconData boxIcon,
    required String productTitle,
    required String value,
    required List<Color> color,
    required int percentage,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              gradient: LinearGradient(
                colors: color,
              ),
            ),
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ConstText.lightText(
                        text: productTitle,
                        color: ColorConst.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(boxIcon, color: ColorConst.white),
                  ],
                ),
                FxBox.h12,
                ConstText.mediumText(
                  text: value,
                  color: ColorConst.white,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                ConstText.lightText(
                  text: percentage > 0
                      ? '${languageModel.eCommerceAdmin.increasedBy} ${percentage.abs()}%'
                      : '${languageModel.eCommerceAdmin.decreasedBy} ${percentage.abs()}%',
                  color: ColorConst.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Positioned(
            right: -75.0,
            top: -25.0,
            child: Container(
              height: 175,
              width: 175,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConst.white.withOpacity(0.15),
              ),
            ),
          ),
          Positioned(
            bottom: -87.5,
            right: -37.5,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConst.white.withOpacity(0.15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
