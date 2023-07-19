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
class SubScriptionScreen extends StatefulWidget {
  const SubScriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubScriptionScreen> createState() => _SubScriptionScreenState();
}

class _SubScriptionScreenState extends State<SubScriptionScreen> {
  final TextEditingController _search = TextEditingController();

  List<Map<String, dynamic>> _searchList = [];

  final List<Map<String, dynamic>> _venderList = [
    {
      'id': 1,
      'Name': 'Bhavesh V.',
      'Email': 'Bhavesh.v@gmail.com',
      'dateAndTime': '30 Jan 2022',
      'status': 'Active',
    },
    {
      'id': 2,
      'Name': 'Hemal M.',
      'Email': 'hemal.m@gmail.com',
      'dateAndTime': '22 Feb 2022',
      'status': 'Deactive',
    },
    {
      'id': 3,
      'Name': 'Mayur s.',
      'Email': 'ms@gmail.com',
      'dateAndTime': '12 Apr 2022',
      'status': 'Active',
    },
    {
      'id': 4,
      'Name': 'Parth S.',
      'Email': 'parth.s@gmail.com',
      'dateAndTime': '17 Nov 2022',
      'status': 'Active',
    },
    {
      'id': 5,
      'Name': 'Keval G.',
      'Email': 'Keval.g@gmail.com',
      'dateAndTime': '8 Dec 2022',
      'status': 'Active',
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
                  text: languageModel.eCommerceAdmin.subscription.trim(),
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
                        label: _tableHeader(languageModel.eCommerceAdmin.name),
                        size: ColumnSize.M,
                      ),
                      DataColumn2(
                        label: _tableHeader(languageModel.form.email),
                        size: ColumnSize.M,
                      ),
                      DataColumn2(
                        label: _tableHeader(languageModel.form.date),
                        size: ColumnSize.M,
                      ),
                      DataColumn2(
                        label: _tableHeader(languageModel.eCommerceAdmin.status),
                        size: ColumnSize.S,
                      ),
                    ],
                    rows: _searchList.isEmpty
                        ? _venderList.map((e) {
                            return DataRow(
                              onSelectChanged: (value) {
                                // autoTabRouter!.setActiveIndex(43);
                              },
                              cells: [
                                DataCell(_tableHeader(e['id'].toString())),
                                DataCell(_tableHeader(e['Name'])),
                                DataCell(_tableHeader(e['Email'])),
                                DataCell(_tableHeader(e['dateAndTime'])),
                                DataCell(_statusBox(
                                    e['status'] == 'Active'
                                        ? ColorConst.successDark
                                        : ColorConst.errorDark,
                                    e['status'])),
                              ],
                            );
                          }).toList()
                        : _searchList.map((e) {
                            return DataRow(
                              onSelectChanged: (value) {
                                //autoTabRouter!.setActiveIndex(43);
                              },
                              cells: [
                                DataCell(_tableHeader(e['id'].toString())),
                                DataCell(_tableHeader(e['Name'])),
                                DataCell(_tableHeader(e['Email'])),
                                DataCell(_tableHeader(e['dateAndTime'])),
                                DataCell(_statusBox(
                                    e['status'] == 'Active'
                                        ? ColorConst.successDark
                                        : ColorConst.errorDark,
                                    e['status'])),
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

  // Widget _tableRowImage(String imagepath) {
  //   return Image.asset(
  //     imagepath,
  //     height: 40,
  //   );
  // }

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
  }

  // Widget _viewButton() {
  //   return FxButton(
  //     onPressed: () {
  //       autoTabRouter!.setActiveIndex(43);
  //     },
  //     text: 'View',
  //     color: ColorConst.primary,
  //   );
  // }
}
