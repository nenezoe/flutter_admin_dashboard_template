import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class LatestBankTransaction extends StatefulWidget {
  const LatestBankTransaction({super.key});

  @override
  State<LatestBankTransaction> createState() => _LatestBankTransactionState();
}

class _LatestBankTransactionState extends State<LatestBankTransaction> {
  final List<Map<String, dynamic>> _latestTranaction = [
    {
      'icon': ConstIcons.upArrow,
      'need': 'Pay Bills',
      'date': '28/2/2021',
      'total': '-\$45',
      'color': ConstColor.redAccent,
    },
    {
      'icon': ConstIcons.downArrow,
      'need': 'Bank Transfer',
      'date': '28/2/2021',
      'total': '-\$15',
      'color': ConstColor.primary,
    },
    {
      'icon': ConstIcons.upArrow,
      'need': 'Monthly Subscription',
      'date': '28/2/2021',
      'total': '-\$75',
      'color': ConstColor.redAccent,
    },
    {
      'icon': ConstIcons.downArrow,
      'need': 'Bank Transfer',
      'date': '28/2/2021',
      'total': '-\$15',
      'color': ConstColor.primary,
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  ConstString.latestTransaction,
                  style: ConstTheme.title(context),
                ),
                const SvgIcon(
                  icon: ConstIcons.menu,
                  color: ConstColor.hintColor,
                ),
              ],
            ),
          ),
          FxBox.h4,
          DataTable3(
            showCheckboxColumn: false,
            minWidth: 500.0,
            showBottomBorder: false,
            dataRowHeight: 80,
            dividerThickness: 0.0,
            columns: [
              DataColumn2(
                size: ColumnSize.S,
                label: _headerText('',
                    fontWeight: FontWeight.w400, color: ConstColor.hintColor),
              ),
              DataColumn2(
                size: ColumnSize.L,
                label: _headerText(ConstString.needs,
                    fontWeight: FontWeight.w400, color: ConstColor.hintColor),
              ),
              DataColumn2(
                size: ColumnSize.L,
                label: _headerText(ConstString.date,
                    fontWeight: FontWeight.w400, color: ConstColor.hintColor),
              ),
              DataColumn2(
                size: ColumnSize.S,
                label: _headerText(ConstString.total,
                    fontWeight: FontWeight.w400, color: ConstColor.hintColor),
              ),
            ],
            rows: _latestTranaction.map((e) {
              return DataRow2(cells: [
                DataCell(
                  _iconBox(e['color'], e['icon']),
                ),
                DataCell(_headerText(e['need'], fontWeight: FontWeight.w500)),
                DataCell(_headerText(e['date'], color: ConstColor.hintColor)),
                DataCell(_headerText(e['total'], color: e['color'])),
              ]);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _headerText(String text, {Color? color, FontWeight? fontWeight}) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
      ),
    );
  }

  Widget _iconBox(
    Color color,
    String icon,
  ) {
    return Container(
      height: 48.0,
      width: 48.0,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SvgIcon(icon: icon, color: color),
    );
  }
}
