import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/icons.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
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
class VenderScreen extends StatefulWidget {
  const VenderScreen({Key? key}) : super(key: key);

  @override
  State<VenderScreen> createState() => _VenderScreenState();
}

class _VenderScreenState extends State<VenderScreen> {
  bool isShow = false;

  final TextEditingController _venderName = TextEditingController();
  final TextEditingController _venderEmail = TextEditingController();
  final TextEditingController _venderNumber = TextEditingController();
  final TextEditingController _search = TextEditingController();

  String? defaultValue;
  final List<String> _statusList = [
    'Active',
    'Deactive',
  ];
  @override
  void initState() {
    super.initState();
    defaultValue = _statusList[0];
  }

  List<Map<String, dynamic>> _searchList = [];

  final List<Map<String, dynamic>> _venderList = [
    {
      'id': 1,
      'imagePath': Images.men,
      'Name': 'Margo Jem',
      'Email': 'margojem@gamil.com',
      'phone': '+91 1234567890',
      'status': 'Active',
    },
    {
      'id': 2,
      'imagePath': Images.men,
      'Name': 'Marious morry',
      'Email': 'marious.m@gmail.com',
      'phone': '+91 5678912340',
      'status': 'Deactive',
    },
    {
      'id': 3,
      'imagePath': Images.men,
      'Name': 'Nick Jem',
      'Email': 'nick@gmail.com',
      'phone': '+1 1234567890',
      'status': 'Active',
    },
    {
      'id': 4,
      'imagePath': Images.men,
      'Name': 'Bhavesh Patel',
      'Email': 'b.patel@gmail.com',
      'phone': '+1 5648356639',
      'status': 'Active',
    },
    {
      'id': 5,
      'imagePath': Images.men,
      'Name': 'Hemal Patel',
      'Email': 'h.patel@gmail.com',
      'phone': '+1 4358752594',
      'status': 'Active',
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
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        FxBox.h16,
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
                  text: languageModel.eCommerceAdmin.vender.trim(),
                  fontWeight: FontWeight.bold,
                ),
                FxBox.h10,
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
                        label: _tableHeader(languageModel.eCommerceAdmin.image),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: _tableHeader(languageModel.eCommerceAdmin.name),
                        size: ColumnSize.M,
                      ),
                      DataColumn2(
                        label: _tableHeader(
                            languageModel.eCommerceAdmin.emailAndMobile),
                        size: ColumnSize.M,
                      ),
                      DataColumn2(
                        label:
                            _tableHeader(languageModel.eCommerceAdmin.status),
                        size: ColumnSize.S,
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
                                autoTabRouter!.setActiveIndex(43);
                              },
                              cells: [
                                DataCell(_tableHeader(e['id'].toString())),
                                DataCell(_tableRowImage(e['imagePath'])),
                                DataCell(_tableHeader(e['Name'])),
                                DataCell(_tableValue(e['Email'], e['phone'])),
                                DataCell(_statusBox(
                                    e['status'] == 'Active'
                                        ? ColorConst.successDark
                                        : ColorConst.errorDark,
                                    e['status'])),
                                DataCell(_viewButton()),
                              ],
                            );
                          }).toList()
                        : _searchList.map((e) {
                            return DataRow(
                              onSelectChanged: (value) {
                                autoTabRouter!.setActiveIndex(43);
                              },
                              cells: [
                                DataCell(_tableHeader(e['id'].toString())),
                                DataCell(_tableRowImage(e['imagePath'])),
                                DataCell(_tableHeader(e['Name'])),
                                DataCell(_tableValue(e['Email'], e['phone'])),
                                DataCell(_statusBox(
                                    e['status'] == 'Active'
                                        ? ColorConst.successDark
                                        : ColorConst.errorDark,
                                    e['status'])),
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

  Widget _tableRowImage(String imagepath) {
    return Image.asset(
      imagepath,
      height: 40,
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
  }

  Widget _viewButton() {
    return FxButton(
      onPressed: () {
        autoTabRouter!.setActiveIndex(43);
      },
      text: 'View',
      color: ColorConst.primary,
    );
  }

  Widget _createVender() {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {},
              child: CircleAvatar(
                  radius: 36,
                  backgroundColor: ColorConst.primary.withOpacity(0.2),
                  child: const SvgIcon(
                    icon: IconlyBroken.camera,
                    size: 26,
                  )),
            ),
          ],
        ),
        FxBox.w24,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: CustomTextField(
                controller: _venderName,
                hintText: 'Enter Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            FxBox.h24,
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: CustomTextField(
                controller: _venderEmail,
                hintText: 'Enter Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            FxBox.h24,
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: CustomTextField(
                controller: _venderNumber,
                hintText: 'Enter Number',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            FxBox.h24,
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                value: defaultValue,
                underline: const SizedBox.shrink(),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: _statusList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    defaultValue = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
        const Spacer(),
        FxButton(
          height: 50,
          onPressed: () async {
            isShow = !isShow;

            setState(() {});
          },
          fullWidth: false,
          color: ColorConst.primary,
          minWidth: MediaQuery.of(context).size.width / 7,
          text: 'Add Vendor',
          textColor: ColorConst.white,
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
        textColor: ColorConst.white,
        color: ColorConst.primary,
        fullWidth: false,
        minWidth: MediaQuery.of(context).size.width / 7,
        onPressed: () {
          isShow = !isShow;
          setState(() {});
        },
        text: 'New Vendor',
      ),
    );
  }
}
