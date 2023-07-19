import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excel/excel.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class ResponsiveTable extends StatelessWidget {
  const ResponsiveTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  languageModel.table.responsiveTable.trim(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                FxButton(
                  borderRadius: 4,
                  onPressed: () {
                    _exportExcel();
                  },
                  text: 'Export',
                ),
              ],
            ),
            FxBox.h20,
            SizedBox(
              height: MediaQuery.of(context).size.height - 240,
              child: DataTable3(
                minWidth: 600,
                dividerThickness: 1,
                showBottomBorder: true,
                columns: _dataColumn(),
                rows: List.generate(
                  50,
                  (index) => DataRow2(
                    cells: [
                      DataCell(sizedBox(text: '${index + 1}')),
                      DataCell(sizedBox(text: "Jane")),
                      DataCell(sizedBox(text: "Deo")),
                      DataCell(sizedBox(text: "@jane_deo")),
                      DataCell(sizedBox(text: "flutter")),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DataColumn2> _dataColumn() {
    return [
      DataColumn2(
        size: ColumnSize.S,
        label: sizedBox(
          text: "#",
          fontwidget: FontWeight.bold,
        ),
      ),
      DataColumn2(
        size: ColumnSize.L,
        label: sizedBox(
          text: languageModel.table.firstName,
          fontwidget: FontWeight.bold,
        ),
      ),
      DataColumn2(
        size: ColumnSize.L,
        label: sizedBox(
          text: languageModel.table.lastName,
          fontwidget: FontWeight.bold,
        ),
      ),
      DataColumn2(
        size: ColumnSize.L,
        label: sizedBox(
          text: languageModel.table.userName,
          fontwidget: FontWeight.bold,
        ),
      ),
      DataColumn2(
        size: ColumnSize.L,
        label: sizedBox(
          text: languageModel.table.department,
          fontwidget: FontWeight.bold,
        ),
      ),
    ];
  }

  Widget sizedBox({String? text, FontWeight? fontwidget = FontWeight.normal}) {
    return Text(
      '$text',
      softWrap: true,
      style: TextStyle(fontSize: 17, fontWeight: fontwidget),
    );
  }

  Future<void> _exportExcel() async {
    List<String> titleList = [
      '#',
      'First Name',
      'Last Name',
      'User Name',
    ];
    var excel = Excel.createExcel();
    excel.sheets['Sheet1']!.insertRowIterables(titleList, 0);

    for (var i = 0; i < 50; i++) {
      final List<String> list = ['${i + 1}', 'Jane', 'Deo', '@flutter'];
      excel.sheets['Sheet1']!.insertRowIterables(list, i + 1);
    }

    excel.save(fileName: 'FlutterAdmin.xlsx');
  }
}
