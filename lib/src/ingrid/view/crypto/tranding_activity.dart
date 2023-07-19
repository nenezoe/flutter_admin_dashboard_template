import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class TrandingActivity extends StatelessWidget {
  const TrandingActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ConstString.recentTradingActivity,
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
            title: 'Buy Bitcoin',
            ammount: '+100',
            icon: ConstIcons.upArrow,
            color: ConstColor.redAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Sell Ripplecoin',
            ammount: '+100',
            icon: ConstIcons.downArrow,
            color: ConstColor.blueAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Buy Litecoin',
            ammount: '+100',
            icon: ConstIcons.upArrow,
            color: ConstColor.redAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Buy Etherium',
            ammount: '+100',
            icon: ConstIcons.upArrow,
            color: ConstColor.redAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Sell Bitcoin',
            ammount: '+100',
            icon: ConstIcons.downArrow,
            color: ConstColor.blueAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Buy Ripplecoin',
            ammount: '+100',
            icon: ConstIcons.upArrow,
            color: ConstColor.redAccent,
          ),
        ],
      ),
    );
  }
}
