import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/provider/theme/bloc/theme_mode_bloc.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class BasicTable extends StatelessWidget {
  const BasicTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tableCard(title: languageModel.table.simple, child: _basicTable()),
        FxBox.h20,
        _tableCard(title: languageModel.table.striped, child: _stripedTable()),
        FxBox.h20,
        _tableCard(
            title: languageModel.table.hoverable, child: _hoverableTable()),
        FxBox.h20,
        _tableCard(
            title: languageModel.table.contextual, child: _contextualTable()),
        FxBox.h20,
        _tableCard(
            title: languageModel.table.bordered, child: _borderedTable()),
        FxBox.h20,
        _tableCard(
            title: languageModel.table.borderless, child: _borderlessTable()),
        FxBox.h20,
        _tableCard(title: languageModel.table.small, child: _smallTable()),
        FxBox.h20,
        _tableCard(title: languageModel.table.dark, child: _darkTable()),
      ],
    );
  }

  Widget _basicTable() {
    return SizedBox(
      height: 248,
      child: DataTable3(
        minWidth: 600,
        dividerThickness: 1,
        showBottomBorder: true,
        columns: _dataColumn(),
        rows: _dataRow(),
      ),
    );
  }

  Widget _darkTable() {
    return SizedBox(
      height: 248,
      child: DataTable3(
        minWidth: 600,
        showBottomBorder: true,
        headingRowColor: MaterialStateProperty.all(
            isDark ? ColorConst.darkContainer : Colors.black),
        dataRowColor: MaterialStateProperty.all(
            isDark ? ColorConst.darkContainer : Colors.black),
        dataTextStyle: const TextStyle(color: Colors.white),
        headingTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        dividerThickness: 1,
        columns: _dataColumn(),
        rows: _dataRow(),
      ),
    );
  }

  Widget _stripedTable() {
    return BlocBuilder<ThemeModeBloc, ThemeModeState>(
      builder: (context, state) {
        return SizedBox(
          height: 248,
          child: DataTable3(
            minWidth: 600,
            showBottomBorder: true,
            dividerThickness: 1,
            columns: _dataColumn(),
            rows: [
              DataRow2(
                cells: [
                  DataCell(sizedBox(text: "1")),
                  DataCell(sizedBox(text: "Jane Deo")),
                  DataCell(sizedBox(text: "1212121212")),
                  DataCell(sizedBox(text: "999")),
                ],
              ),
              DataRow2(
                color: MaterialStateProperty.all(
                  isDark ? ColorConst.darkContainer : Colors.grey.shade200,
                ),
                cells: [
                  DataCell(sizedBox(text: "2")),
                  DataCell(sizedBox(text: "Joe Blow")),
                  DataCell(sizedBox(text: "4646464646")),
                  DataCell(sizedBox(text: "449")),
                ],
              ),
              DataRow2(
                cells: [
                  DataCell(sizedBox(text: "3")),
                  DataCell(sizedBox(text: "Jhon Wick")),
                  DataCell(sizedBox(text: "1234567890")),
                  DataCell(sizedBox(text: "149")),
                ],
              ),
              DataRow2(
                color: MaterialStateProperty.all(
                  isDark ? ColorConst.darkContainer : Colors.grey.shade200,
                ),
                cells: [
                  DataCell(sizedBox(text: "4")),
                  DataCell(sizedBox(text: "Jane Blow")),
                  DataCell(sizedBox(text: "9292929292")),
                  DataCell(sizedBox(text: "799")),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _borderedTable() {
    return SizedBox(
      height: 248,
      child: DataTable3(
        minWidth: 600,
        border: TableBorder.all(
          color: isDark
              ? ColorConst.darkFontColor.withOpacity(0.25)
              : ColorConst.lightFontColor,
        ),
        dividerThickness: 0,
        columns: _dataColumn(),
        rows: _dataRow(),
      ),
    );
  }

  Widget _borderlessTable() {
    return SizedBox(
      height: 248,
      child: DataTable3(
        minWidth: 600,
        dividerThickness: 0,
        columns: _dataColumn(),
        rows: _dataRow(),
      ),
    );
  }

  Widget _hoverableTable() {
    return SizedBox(
      height: 248,
      child: DataTable3(
        minWidth: 600,
        dividerThickness: 1,
        showCheckboxColumn: false,
        showBottomBorder: true,
        columns: _dataColumn(),
        rows: [
          DataRow2(
            onSelectChanged: (value) {},
            cells: [
              DataCell(sizedBox(text: "1")),
              DataCell(sizedBox(text: "Jane Deo")),
              DataCell(sizedBox(text: "1212121212")),
              DataCell(sizedBox(text: "999")),
            ],
          ),
          DataRow2(
            onSelectChanged: (value) {},
            cells: [
              DataCell(sizedBox(text: "2")),
              DataCell(sizedBox(text: "Joe Blow")),
              DataCell(sizedBox(text: "4646464646")),
              DataCell(sizedBox(text: "449")),
            ],
          ),
          DataRow2(
            onSelectChanged: (value) {},
            cells: [
              DataCell(sizedBox(text: "3")),
              DataCell(sizedBox(text: "Jhon Wick")),
              DataCell(sizedBox(text: "1234567890")),
              DataCell(sizedBox(text: "149")),
            ],
          ),
          DataRow2(
            onSelectChanged: (value) {},
            cells: [
              DataCell(sizedBox(text: "4")),
              DataCell(sizedBox(text: "Jane Blow")),
              DataCell(sizedBox(text: "9292929292")),
              DataCell(sizedBox(text: "799")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _smallTable() {
    return SizedBox(
      height: 248,
      child: DataTable3(
        minWidth: 600,
        dividerThickness: 1,
        showBottomBorder: true,
        dataRowHeight: 35,
        columns: _dataColumn(),
        rows: [
          DataRow2(
            cells: [
              DataCell(sizedBox(text: "1")),
              DataCell(sizedBox(text: "Jane Deo")),
              DataCell(sizedBox(text: "1212121212")),
              DataCell(sizedBox(text: "999")),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(sizedBox(text: "2")),
              DataCell(sizedBox(text: "Joe Blow")),
              DataCell(sizedBox(text: "4646464646")),
              DataCell(sizedBox(text: "449")),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(sizedBox(text: "3")),
              DataCell(sizedBox(text: "Jhon Wick")),
              DataCell(sizedBox(text: "1234567890")),
              DataCell(sizedBox(text: "149")),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(sizedBox(text: "4")),
              DataCell(sizedBox(text: "Jane Blow")),
              DataCell(sizedBox(text: "9292929292")),
              DataCell(sizedBox(text: "799")),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(sizedBox(text: "5")),
              DataCell(sizedBox(text: "Jhon Deo")),
              DataCell(sizedBox(text: "9876543210")),
              DataCell(sizedBox(text: "349")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contextualTable() {
    return SizedBox(
      height: 248,
      child: DataTable3(
        minWidth: 600,
        showBottomBorder: true,
        dividerThickness: 1,
        columns: _dataColumn(),
        rows: [
          DataRow2(
            color: MaterialStateProperty.all(
              ColorConst.success.withOpacity(0.25),
            ),
            cells: [
              DataCell(sizedBox(text: "1")),
              DataCell(sizedBox(text: "Jane Deo")),
              DataCell(sizedBox(text: "1212121212")),
              DataCell(sizedBox(text: "999")),
            ],
          ),
          DataRow2(
            color: MaterialStateProperty.all(
              ColorConst.info.withOpacity(0.25),
            ),
            cells: [
              DataCell(sizedBox(text: "2")),
              DataCell(sizedBox(text: "Joe Blow")),
              DataCell(sizedBox(text: "4646464646")),
              DataCell(sizedBox(text: "449")),
            ],
          ),
          DataRow2(
            color: MaterialStateProperty.all(
              ColorConst.warning.withOpacity(0.25),
            ),
            cells: [
              DataCell(sizedBox(text: "3")),
              DataCell(sizedBox(text: "Jhon Wick")),
              DataCell(sizedBox(text: "1234567890")),
              DataCell(sizedBox(text: "149")),
            ],
          ),
          DataRow2(
            color: MaterialStateProperty.all(
              ColorConst.info.withOpacity(0.25),
            ),
            cells: [
              DataCell(sizedBox(text: "4")),
              DataCell(sizedBox(text: "Jane Blow")),
              DataCell(sizedBox(text: "9292929292")),
              DataCell(sizedBox(text: "799")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tableCard({required String title, required Widget child}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            FxBox.h20,
            child
          ],
        ),
      ),
    );
  }

  List<DataColumn2> _dataColumn() {
    return [
      DataColumn2(
        label: sizedBox(
          text: languageModel.table.id,
          fontwidget: FontWeight.bold,
        ),
      ),
      DataColumn2(
        label: sizedBox(
          text: languageModel.table.customerName,
          fontwidget: FontWeight.bold,
        ),
      ),
      DataColumn2(
        label: sizedBox(
          text: languageModel.table.mobileNo,
          fontwidget: FontWeight.bold,
        ),
      ),
      DataColumn2(
        label: sizedBox(
          text: languageModel.table.amount,
          fontwidget: FontWeight.bold,
        ),
      ),
    ];
  }

  List<DataRow2> _dataRow() {
    return [
      DataRow2(
        cells: [
          DataCell(sizedBox(text: "1")),
          DataCell(sizedBox(text: "Jane Deo")),
          DataCell(sizedBox(text: "1212121212")),
          DataCell(sizedBox(text: "999")),
        ],
      ),
      DataRow2(
        cells: [
          DataCell(sizedBox(text: "2")),
          DataCell(sizedBox(text: "Joe Blow")),
          DataCell(sizedBox(text: "4646464646")),
          DataCell(sizedBox(text: "449")),
        ],
      ),
      DataRow2(
        cells: [
          DataCell(sizedBox(text: "3")),
          DataCell(sizedBox(text: "Jhon Wick")),
          DataCell(sizedBox(text: "1234567890")),
          DataCell(sizedBox(text: "149")),
        ],
      ),
      DataRow2(
        cells: [
          DataCell(sizedBox(text: "4")),
          DataCell(sizedBox(text: "Jane Blow")),
          DataCell(sizedBox(text: "9292929292")),
          DataCell(sizedBox(text: "799")),
        ],
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
}
