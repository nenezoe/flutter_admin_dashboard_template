import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/widget/button.dart';
import 'package:admin_dashboard/src/ingrid/widget/datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

final List<List<dynamic>> _tableData = [
  ['INV-001', 'Samanta William', 'Paid', ConstColor.blueAccent],
  ['INV-002', 'John Doe', 'Paid', ConstColor.blueAccent],
  ['INV-003', 'Nadila', 'Pending', ConstColor.redAccent],
];

class LastestInvoice extends StatelessWidget {
  const LastestInvoice({super.key});

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
            padding: const EdgeInsets.only(top: 24.0, left: 24.0, bottom: 4.0),
            child: Text(
              ConstString.lastestInvoice,
              style: ConstTheme.title(context),
            ),
          ),
          FxBox.h4,
          SizedBox(
            height: 64.0 * (_tableData.length + 1),
            child: DataTable3(
              minWidth: 744,
              dividerThickness: 0.5,
              showCheckboxColumn: true,
              dataRowHeight: 64.0,
              headingRowHeight: 64.0,
              columnSpacing: 8.0,
              columns: [
                DataColumn2(
                  label: Text(ConstString.invoiceNumber,
                      style: ConstTheme.hintText),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text(ConstString.customer, style: ConstTheme.hintText),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text(ConstString.status, style: ConstTheme.hintText),
                  size: ColumnSize.M,
                ),
                DataColumn2(
                  label: Text(ConstString.date, style: ConstTheme.hintText),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text(ConstString.action, style: ConstTheme.hintText),
                  size: ColumnSize.S,
                ),
              ],
              rows: List.generate(
                _tableData.length,
                (index) => DataRow2(
                  cells: [
                    DataCell(
                      Text(
                        _tableData[index][0],
                        style: ConstTheme.hintText.copyWith(
                          color: context.isDarkMode
                              ? Colors.white
                              : const Color(0xff333333),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(_tableData[index][1], style: ConstTheme.hintText),
                    ),
                    DataCell(
                      StatusButton(
                        text: _tableData[index][2],
                        color: _tableData[index][3],
                      ),
                    ),
                    DataCell(
                      Text('28/2/2021', style: ConstTheme.hintText),
                    ),
                    const DataCell(
                      SvgIcon(
                        icon: ConstIcons.menu,
                        color: ConstColor.hintColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
