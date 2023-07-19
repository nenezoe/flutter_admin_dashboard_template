import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class GlobalSale extends StatefulWidget {
  const GlobalSale({Key? key}) : super(key: key);

  @override
  State<GlobalSale> createState() => _GlobalSaleState();
}

class _GlobalSaleState extends State<GlobalSale> {
  final List<Map<String, dynamic>> _venderList = [
    {
      'id': 1,
      'imagePath': Images.usa,
      'coutry_name': 'USA',
      'total_order': '1200',
    },
    {
      'id': 2,
      'imagePath': Images.aus,
      'coutry_name': 'Australia',
      'total_order': '1000',
    },
    {
      'id': 3,
      'imagePath': Images.canada,
      'coutry_name': 'Canada',
      'total_order': '1590',
    },
    {
      'id': 4,
      'imagePath': Images.switzerland,
      'coutry_name': 'Switzerland',
      'total_order': '1700',
    },
    {
      'id': 5,
      'imagePath': Images.germany,
      'coutry_name': 'Germany',
      'total_order': '700',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
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
                  text: languageModel.eCommerceAdmin.globalSales,
                  fontWeight: FontWeight.bold,
                ),
                FxBox.h12,
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: (56.0 * 10) + 72.0),
                  child: DataTable3(
                      showCheckboxColumn: false,
                      showBottomBorder: true,
                      columnSpacing: 20.0,
                      minWidth: 728.0,
                      dataRowHeight: Responsive.isMobile(context)
                          ? 100
                          : Responsive.isTablet(context)
                              ? 95
                              : islg(context)
                                  ? 90
                                  : 56.0,
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
                          label: _tableHeader(languageModel.eCommerceAdmin.countryLogo),
                          size: ColumnSize.S,
                        ),
                        DataColumn2(
                          label: _tableHeader(languageModel.eCommerceAdmin.countryName),
                          size: ColumnSize.M,
                        ),
                        DataColumn2(
                          label: _tableHeader(languageModel.eCommerceAdmin.totalSales),
                          size: ColumnSize.S,
                        ),
                      ],
                      rows: _venderList.map((e) {
                        return DataRow(
                          onSelectChanged: (value) {
                            //autoTabRouter!.setActiveIndex(43);
                          },
                          cells: [
                            DataCell(_tableHeader(e['id'].toString())),
                            DataCell(_tableImage(e['imagePath'])),
                            DataCell(_tableHeader(e['coutry_name'])),
                            DataCell(_tableHeader(e['total_order'])),
                          ],
                        );
                      }).toList()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _tableHeader(String text) {
    return ConstText.lightText(
      text: text,
      fontWeight: FontWeight.w700,
    );
  }

  Widget _tableImage(String path) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        path,
        width: 60,
      ),
    );
  }
}
