import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/icons.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/admin/widget/textformfield.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class ReturnOrderScreen extends StatefulWidget {
  const ReturnOrderScreen({Key? key}) : super(key: key);

  @override
  State<ReturnOrderScreen> createState() => _ReturnOrderScreenState();
}

class _ReturnOrderScreenState extends State<ReturnOrderScreen> {
  final TextEditingController _search = TextEditingController();

  List<Map<String, dynamic>> _searchList = [];

  final List<Map<String, dynamic>> _venderList = [
    {
      'id': 1,
      'ReturnID': 'B4556VH',
      'Name': 'Bhavesh V.',
      'Email': 'Bhavesh.v@gmail.com',
      'phone': '+91 4545454567',
      'productName': 'Cap',
      'date': '11 Jan 2023'
    },
    {
      'id': 2,
      'ReturnID': 'B4556YG',
      'Name': 'Hemal M.',
      'Email': 'hemal.m@gmail.com',
      'phone': '+91 2323234567',
      'productName': 'Refrigerator',
      'date': '23 Nov 2022'
    },
    {
      'id': 3,
      'ReturnID': 'AC455VH',
      'Name': 'Mayur s.',
      'Email': 'ms@gmail.com',
      'phone': '+1 9191915676',
      'productName': 'Highliter T-shirt',
      'date': '12 Dec 2022'
    },
    {
      'id': 4,
      'ReturnID': 'CG455VH',
      'Name': 'Parth S.',
      'Email': 'parth.s@gmail.com',
      'phone': '+1 2343562345',
      'productName': 'Play Game',
      'date': '01 Apr 2022'
    },
    {
      'id': 5,
      'ReturnID': 'UN855VH',
      'Name': 'Keval G.',
      'Email': 'Keval.g@gmail.com',
      'phone': '+1 5675677759',
      'productName': 'Bag',
      'date': '31 Jan 2022'
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
                  text: languageModel.eCommerceAdmin.returnOrder.trim(),
                  fontWeight: FontWeight.bold,
                ),
                FxBox.h16,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: CustomTextField(
                    controller: _search,
                    hintText: 'Search',
                    onChanged: (value) {
                      _searchList = _venderList.where((element) {
                        return element['Email']
                                .toLowerCase()
                                .contains(_search.text.toLowerCase()) ||
                            element['Name']
                                .toLowerCase()
                                .contains(_search.text.toLowerCase());
                      }).toList();
                      setState(() {});
                    },
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SvgIcon(
                        icon: IconlyBroken.search,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                FxBox.h16,
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
                        label:
                            _tableHeader(languageModel.eCommerceAdmin.returnID),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: _tableHeader(
                            languageModel.eCommerceAdmin.customerName),
                        size: ColumnSize.M,
                      ),
                      DataColumn2(
                        label: _tableHeader(
                            languageModel.eCommerceAdmin.emailAndMobile),
                        size: ColumnSize.M,
                      ),
                      DataColumn2(
                        label: _tableHeader(
                            languageModel.eCommerceAdmin.productName),
                        size: ColumnSize.M,
                      ),
                      DataColumn2(
                        label: _tableHeader(
                            languageModel.eCommerceAdmin.returnDate),
                        size: ColumnSize.M,
                      ),
                      DataColumn2(
                        label: _tableHeader(''),
                        size: ColumnSize.S,
                      ),
                    ],
                    rows: _searchList.isEmpty
                        ? _venderList.map((e) {
                            return DataRow(
                              onSelectChanged: (value) {
                                autoTabRouter!.setActiveIndex(47);
                              },
                              cells: [
                                DataCell(_tableHeader(e['id'].toString())),
                                DataCell(_tableHeader(e['ReturnID'])),
                                DataCell(_tableHeader(e['Name'])),
                                DataCell(_tableValue(e['Email'], e['phone'])),
                                DataCell(_tableHeader(e['productName'])),
                                DataCell(_tableHeader(e['date'])),
                                DataCell(_viewButton()),
                              ],
                            );
                          }).toList()
                        : _searchList.map((e) {
                            return DataRow(
                              onSelectChanged: (value) {
                                autoTabRouter!.setActiveIndex(47);
                              },
                              cells: [
                                DataCell(_tableHeader(e['id'].toString())),
                                DataCell(_tableHeader(e['ReturnID'])),
                                DataCell(_tableHeader(e['Name'])),
                                DataCell(_tableValue(e['Email'], e['phone'])),
                                DataCell(_tableHeader(e['productName'])),
                                DataCell(_tableHeader(e['date'])),
                                DataCell(_viewButton()),
                              ],
                            );
                          }).toList(),
                  ),
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

  Widget _tableValue(
    String email,
    String number,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstText.lightText(
          text: email,
          fontWeight: FontWeight.w700,
        ),
        ConstText.lightText(
          text: number,
          fontWeight: FontWeight.w700,
        )
      ],
    );
  }

  // Widget _tableRowImage(String imagepath) {
  //   return Image.asset(
  //     imagepath,
  //     height: 40,
  //   );
  // }

  Widget _viewButton() {
    return FxButton(
      onPressed: () {
        autoTabRouter!.setActiveIndex(47);
      },
      text: 'View',
      textColor: ColorConst.white,
      color: ColorConst.primary,
    );
  }
}
