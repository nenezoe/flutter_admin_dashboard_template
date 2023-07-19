import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class TransferHistory extends StatelessWidget {
  const TransferHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ConstString.transferHistory,
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
            title: 'Pay Bills',
            ammount: '-100\$',
            icon: ConstIcons.upArrow,
            color: ConstColor.redAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Sell Foods',
            ammount: '+100\$',
            icon: ConstIcons.downArrow,
            color: ConstColor.blueAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Pay Invoice',
            ammount: '+100\$',
            icon: ConstIcons.upArrow,
            color: ConstColor.redAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Pay Bills',
            ammount: '-100\$',
            icon: ConstIcons.upArrow,
            color: ConstColor.redAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Sell Foods',
            ammount: '+100\$',
            icon: ConstIcons.downArrow,
            color: ConstColor.blueAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Pay Invoice',
            ammount: '+100\$',
            icon: ConstIcons.upArrow,
            color: ConstColor.redAccent,
          ),
          FxBox.h32,
          const DetailTile(
            title: 'Pay Invoice',
            ammount: '+100\$',
            icon: ConstIcons.upArrow,
            color: ConstColor.redAccent,
          ),
        ],
      ),
    );
  }
}

