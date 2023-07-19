import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
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
class ReturnConditionScreen extends StatefulWidget {
  const ReturnConditionScreen({Key? key}) : super(key: key);

  @override
  State<ReturnConditionScreen> createState() => _ReturnConditionScreenState();
}

class _ReturnConditionScreenState extends State<ReturnConditionScreen> {
  bool isShow = false;
  bool isEdit = false;

  final TextEditingController _rCondition = TextEditingController();

  final TextEditingController _search = TextEditingController();

  List<Map<String, dynamic>> _searchList = [];

  final List<Map<String, dynamic>> _venderList = [
    {
      'id': 1,
      'r_condition': 'Wrong Product',
      'date': '12 Jan 2022',
    },
    {
      'id': 2,
      'r_condition': 'Defective Product',
      'date': '2 Feb 2022',
    },
    {
      'id': 3,
      'r_condition': 'Size Issue',
      'date': '28 Feb 2022',
    },
    {
      'id': 4,
      'r_condition': 'Physical Damage Product',
      'date': '03 Nov 2022',
    },
    {
      'id': 5,
      'r_condition': 'Not Define',
      'date': '30 Oct 2022',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _addNewVender(),
        FxBox.h16,
        if (isShow) ...[
          _createVender(),
          FxBox.h16,
        ],
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
                  text: languageModel.eCommerceAdmin.returnCondition.trim(),
                  fontWeight: FontWeight.bold,
                ),
                FxBox.h12,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: CustomTextField(
                    controller: _search,
                    hintText: 'Search',
                    onChanged: (value) {
                      _searchList = _venderList.where((element) {
                        return element['r_condition']
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
                        label: _tableHeader(languageModel
                            .eCommerceAdmin.returnCondition
                            .trim()),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: _tableHeader(languageModel.form.date),
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
                                //autoTabRouter!.setActiveIndex(43);
                              },
                              cells: [
                                DataCell(_tableHeader(e['id'].toString())),
                                DataCell(_tableHeader(e['r_condition'])),
                                DataCell(_tableHeader(e['date'])),
                                DataCell(_editButton(
                                  onPressed: () {
                                    isShow = !isShow;
                                    isEdit = true;

                                    setState(() {});
                                    _rCondition.text = e['r_condition'];
                                  },
                                )),
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
                                DataCell(_tableHeader(e['r_condition'])),
                                DataCell(_tableHeader(e['date'])),
                                DataCell(_editButton(
                                  onPressed: () {
                                    isEdit = true;
                                    isShow = !isShow;

                                    _rCondition.text = e['r_condition'];

                                    setState(() {});
                                  },
                                )),
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

  Widget _editButton({
    required void Function()? onPressed,
  }) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.mode_edit_rounded),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete,
            color: ColorConst.errorDark,
          ),
        ),
      ],
    );
  }

  Widget _createVender() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              title: 'Return Condition Detail',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h16,
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: CustomTextField(
                controller: _rCondition,
                hintText: 'Enter Coupon Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            FxBox.h24,
          ],
        ),
        const Spacer(),
        FxButton(
          height: 50,
          onPressed: () async {
            isShow = !isShow;
            _rCondition.text = '';

            setState(() {});
          },
          fullWidth: false,
          color: ColorConst.primary,
          minWidth: MediaQuery.of(context).size.width / 7,
          textColor: ColorConst.white,
          text: isEdit ? 'Update Return Condition' : 'Add Return Condition',
        ),
        FxBox.w24,
        FxButton(
          height: 50,
          minWidth: 50,
          hoverColor: ColorConst.error.withOpacity(0.1),
          onPressed: () {
            isShow = !isShow;

            setState(() {});
          },
          color: ColorConst.error.withOpacity(0.4),
          icon: const SvgIcon(
            icon: IconlyBroken.closeSquare,
            color: ColorConst.white,
          ),
        ),
      ],
    );
  }

  Widget _addNewVender() {
    return Align(
      alignment: Alignment.centerRight,
      child: FxButton(
        height: 50,
        color: ColorConst.primary,
        fullWidth: false,
        minWidth: MediaQuery.of(context).size.width / 7,
        onPressed: () {
          isShow = !isShow;
          isEdit = false;
          setState(() {});
        },
        textColor: ColorConst.white,
        text: 'New Return Condition',
      ),
    );
  }
}
