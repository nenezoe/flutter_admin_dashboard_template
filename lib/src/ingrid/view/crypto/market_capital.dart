import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class MarketCapital extends StatelessWidget {
  const MarketCapital({super.key});

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ConstString.marketCapitalList,
                  style: ConstTheme.title(context),
                ),
              ),
              const SvgIcon(
                icon: ConstIcons.menu,
                color: ConstColor.hintColor,
              ),
            ],
          ),
          FxBox.h40,
          const DetailTile(
            title: 'Alphabet',
            subtitle: 'United State',
            ammount: '919.3\$ Bil.',
            icon: ConstIcons.upArrow,
            color: ConstColor.blueAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Facebook',
            subtitle: 'United State',
            ammount: '583.7\$ Bil.',
            icon: ConstIcons.downArrow,
            color: ConstColor.redAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Alibaba',
            subtitle: 'China',
            ammount: '545.4\$ Bil.',
            icon: ConstIcons.downArrow,
            color: ConstColor.redAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Tencent Holdings',
            subtitle: 'China',
            ammount: '	509.7\$ Bil.',
            icon: ConstIcons.downArrow,
            color: ConstColor.redAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Berkshire Hathaway',
            subtitle: 'United State',
            ammount: '455.4\$ Bil.',
            icon: ConstIcons.upArrow,
            color: ConstColor.blueAccent,
          ),
        ],
      ),
    );
  }
}
