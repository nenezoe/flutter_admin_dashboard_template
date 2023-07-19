import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class VenderTransaction extends StatefulWidget {
  const VenderTransaction({Key? key}) : super(key: key);

  @override
  State<VenderTransaction> createState() => _VenderTransactionState();
}

class _VenderTransactionState extends State<VenderTransaction> {
  final List<Map<String, dynamic>> _transactionData = [
    {
      'id': 1,
      'name': 'Jane Deo',
      'product': 'Dell Laptop',
      'date': 'November 15, 2022',
      'amount': '\$1200',
      'status': 'Delivered',
    },
    {
      'id': 2,
      'name': 'Marious Den',
      'product': 'Mac',
      'date': 'October 20, 2022',
      'amount': '\$1400',
      'status': 'Pending',
    },
    {
      'id': 3,
      'name': 'Nikolas Jem',
      'product': 'Clothes',
      'date': 'December 29, 2022',
      'amount': '\$1400',
      'status': 'Pending',
    },
    {
      'id': 4,
      'name': 'Morry Hang',
      'product': 'Play Game',
      'date': 'January 21, 2023',
      'amount': '\$500',
      'status': 'Cancle',
    },
    {
      'id': 5,
      'name': 'Jon Show',
      'product': 'Shoe',
      'date': 'February 12, 2023',
      'amount': '\$300',
      'status': 'Delivered',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstText.lightText(
              text: languageModel.eCommerceAdmin.latestTransaction,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h10,
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: (56.0 * 10) + 72.0),
              child: DataTable3(
                showCheckboxColumn: false,
                showBottomBorder: true,
                columnSpacing: 20.0,
                minWidth: 728.0,
                dataRowHeight: 56.0,
                headingRowHeight: 64.0,
                border: TableBorder(
                  bottom: BorderSide(
                    width: 1,
                    color: isDark
                        ? ColorConst.white.withOpacity(0.25)
                        : Colors.grey.shade200,
                  ),
                  horizontalInside: BorderSide(
                    width: 1,
                    color: isDark
                        ? ColorConst.white.withOpacity(0.25)
                        : Colors.grey.shade50,
                  ),
                ),
                columns: [
                  DataColumn2(
                    label: _tableHeader(languageModel.eCommerceAdmin.id),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: _tableHeader(languageModel.eCommerceAdmin.name),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: _tableHeader(languageModel.eCommerceAdmin.product),
                    size: ColumnSize.M,
                  ),
                  DataColumn2(
                    label: _tableHeader(languageModel.eCommerceAdmin.orderDate),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: _tableHeader(languageModel.eCommerceAdmin.amount),
                    size: ColumnSize.M,
                  ),
                  DataColumn2(
                    label: _tableHeader(languageModel.eCommerceAdmin.deliveryStatus),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: _tableHeader(''),
                    size: ColumnSize.S,
                  ),
                ],
                rows: _transactionData.map((e) {
                  return DataRow(
                    onSelectChanged: (value) {},
                    cells: [
                      DataCell(_tableHeader(e['id'].toString())),
                      DataCell(_tableRowImage(e['name'])),
                      DataCell(_tableHeader(e['product'])),
                      DataCell(_tableHeader(e['date'])),
                      DataCell(_tableHeader(e['amount'])),
                      DataCell(
                          _statusBox(defineColor(e['status']), e['status'])),
                      DataCell(_editButton()),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color defineColor(String header) {
    if (header == 'Delivered') {
      return ColorConst.successDark;
    } else if (header == 'Cancle') {
      return ColorConst.errorDark;
    } else {
      return ColorConst.warningDark;
    }
  }

  Widget _tableHeader(String text) {
    return ConstText.lightText(
      text: text,
      fontWeight: FontWeight.w700,
    );
  }

  Widget _tableRowImage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          maxRadius: 15,
          backgroundImage: AssetImage(Images.profileImage),
        ),
        FxBox.w10,
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _statusBox(
    Color? color,
    String text,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
    // return FxBadge(
    //   text: text,
    //   color: color,
    //   radius: 5,
    //   textStyle: TextStyle(
    //     fontSize: MediaQuery.of(context).size.height * 0.011,
    //     color: ColorConst.white,
    //   ),
    // );
  }

  Widget _editButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.mode_edit_rounded),
    );
    // return FxButton(
    //   minWidth: 18,
    //   borderRadius: 6,
    //   color: ColorConst.primary,
    //   onPressed: () {},
    //   textColor: ColorConst.white,
    //   text: Strings.edit,
    // );
  }
}
