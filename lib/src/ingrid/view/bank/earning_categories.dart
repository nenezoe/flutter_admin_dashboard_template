import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/view/file_manager/storage_card.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class EarningCategories extends StatefulWidget {
  const EarningCategories({super.key});

  @override
  State<EarningCategories> createState() => _EarningCategoriesState();
}

class _EarningCategoriesState extends State<EarningCategories> {
  final List<Map<String, dynamic>> _earningCateList = [
    {
      'title': 'Crytocurency',
      'sliderValue': 0.17,
      'value': '\$50',
      'color': ConstColor.redAccent,
    },
    {
      'title': 'Digital Assets',
      'sliderValue': 0.5,
      'value': '\$500',
      'color': ConstColor.primary,
    },
    {
      'title': 'Projects',
      'sliderValue': 0.9,
      'value': '\$900',
      'color': ConstColor.yellow,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: context.theme.cardColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24.0,
              left: 24.0,
              bottom: 4.0,
              right: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ConstString.earningCategories,
                  style: ConstTheme.title(context),
                ),
                const SvgIcon(
                  icon: ConstIcons.menu,
                  color: ConstColor.hintColor,
                ),
              ],
            ),
          ),
          FxBox.h6,
          ListView.separated(
            itemCount: _earningCateList.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(right: 24.0, left: 24.0, top: 4.0),
            itemBuilder: (context, index) {
              return DetailEarningTile(
                ammount: _earningCateList[index]['value'],
                color: _earningCateList[index]['color'],
                title: _earningCateList[index]['title'],
                value: _earningCateList[index]['sliderValue'],
              );
            },
            separatorBuilder: (context, index) {
              return FxBox.h(18);
            },
          )
        ],
      ),
    );
  }
}

class DetailEarningTile extends StatelessWidget {
  const DetailEarningTile({
    super.key,
    required this.title,
    required this.ammount,
    required this.color,
    required this.value,
  });

  final String title;
  final String ammount;

  final Color color;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 48.0,
          width: 48.0,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Image.asset(
            'assets/ingrid/coin.png',
            color: color,
            height: 30,
            width: 30,
          ),
        ),
        FxBox.w16,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: ConstTheme.title(context).copyWith(fontSize: 16.0),
              ),
              FxBox.h12,
              CustomeSlider(
                percentageColor: color,
                percentage: percentageValue(value),
              ),
              FxBox.h12,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: ammount,
                      style: ConstTheme.hintText.copyWith(fontSize: 16.0),
                    ),
                    TextSpan(
                      text: ' / from \$1000',
                      style: ConstTheme.hintText.copyWith(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              // Text(
              //   '$ammount / from \$1000',
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              //   style: ConstTheme.hintText.copyWith(fontSize: 12.0),
              // ),
              FxBox.h28,
            ],
          ),
        ),
      ],
    );
  }

  double percentageValue(double value) {
    final width = (300 * value);
    return width;
  }
}
