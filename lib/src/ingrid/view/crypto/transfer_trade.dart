import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/widget/button.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class TransferTrade extends StatelessWidget {
  const TransferTrade({super.key});

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ConstString.transferTrade,
              style: ConstTheme.title(context),
            ),
            FxBox.h16,
            const TabBar(
              labelStyle: TextStyle(
                color: ConstColor.primary,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                color: ConstColor.hintColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  text: 'Transfer',
                ),
                Tab(
                  text: 'Trade',
                ),
              ],
            ),
            FxBox.h48,
            Text(
              'Amount',
              style: ConstTheme.text(context).copyWith(fontSize: 18.0),
            ),
            FxBox.h16,
            Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorWidth: 1,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hoverColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: context.isDarkMode
                          ? ConstColor.darkFillColor
                          : ConstColor.lightFillColor,
                      contentPadding: const EdgeInsets.all(12.0),
                      hintText: '0.00',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: ConstColor.hintColor,
                      ),
                      isCollapsed: true,
                    ),
                  ),
                ),
                FxBox.w16,
                SizedBox(
                  width: 96.0,
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: context.isDarkMode
                          ? ConstColor.darkFillColor
                          : ConstColor.lightFillColor,
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'BTC',
                        child: Text('BTC'),
                      ),
                    ],
                    value: 'BTC',
                    style: ConstTheme.text(context).copyWith(fontSize: 18.0),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            FxBox.h16,
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Transfer to',
                    style: ConstTheme.text(context).copyWith(fontSize: 18.0),
                  ),
                ),
                FxBox.w16,
                SizedBox(
                  width: 96.0,
                  child: Text(
                    'Pin',
                    style: ConstTheme.text(context).copyWith(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            FxBox.h16,
            Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorWidth: 1,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hoverColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: context.isDarkMode
                          ? ConstColor.darkFillColor
                          : ConstColor.lightFillColor,
                      contentPadding: const EdgeInsets.all(12.0),
                      hintText: 'email@mail.com',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: ConstColor.hintColor,
                      ),
                      isCollapsed: true,
                    ),
                  ),
                ),
                FxBox.w16,
                SizedBox(
                  width: 96.0,
                  child: TextField(
                    cursorWidth: 1,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hoverColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: context.isDarkMode
                          ? ConstColor.darkFillColor
                          : ConstColor.lightFillColor,
                      contentPadding: const EdgeInsets.all(12.0),
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: ConstColor.hintColor,
                      ),
                      isCollapsed: true,
                    ),
                  ),
                ),
              ],
            ),
            FxBox.h48,
            const IngridButton(text: 'Transfer'),
          ],
        ),
      ),
    );
  }
}
