import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/provider/table/datatable/bloc/data_table_bloc.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class Datatable extends StatefulWidget {
  const Datatable({Key? key}) : super(key: key);

  @override
  State<Datatable> createState() => _DatatableState();
}

class _DatatableState extends State<Datatable> {
  final DataTableBloc _dataTableBloc = DataTableBloc();
  List<int> ls = List<int>.generate(57, (index) => index + 1);
  int _dropValue = 10;
  int _page = 0;

  int _start = 0;
  int _end = 10;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _dataTableBloc,
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<DataTableBloc, DataTableState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    languageModel.table.dataTable.trim(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _listCounter(),
                  if (Responsive.isMobile(context))
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                          "Showing ${_start + 1} to $_end of ${ls.length} entries"),
                    ),
                  FxBox.h20,
                  SizedBox(
                    height: ls.length < _dropValue
                        ? (ls.length * 48)
                        : (_dropValue + 1) * 48,
                    child: DataTable2(
                      minWidth: 950,
                      // border: TableBorder.all(
                      //   color: isDark
                      //       ? ColorConst.darkFontColor.withOpacity(0.25)
                      //       : ColorConst.lightFontColor,
                      // ),
                      dividerThickness: 1.0,
                      headingRowHeight: 48,
                      dataRowHeight: 48,
                      columns: [
                        DataColumn2(
                          size: ColumnSize.S,
                          label: sizedBox(
                              text: languageModel.table.id,
                              fontwidget: FontWeight.bold),
                        ),
                        DataColumn2(
                          size: ColumnSize.L,
                          label: sizedBox(
                              text: languageModel.table.customerName,
                              fontwidget: FontWeight.bold),
                        ),
                        DataColumn2(
                          size: ColumnSize.L,
                          label: sizedBox(
                              text: languageModel.table.emailID,
                              fontwidget: FontWeight.bold),
                        ),
                        DataColumn2(
                          size: ColumnSize.L,
                          label: sizedBox(
                              text: languageModel.table.productName,
                              fontwidget: FontWeight.bold),
                        ),
                        DataColumn2(
                          size: ColumnSize.M,
                          label: sizedBox(
                              text: languageModel.table.quantity,
                              fontwidget: FontWeight.bold),
                        ),
                        DataColumn2(
                          size: ColumnSize.M,
                          label: sizedBox(
                              text: languageModel.table.amount,
                              fontwidget: FontWeight.bold),
                        ),
                      ],
                      rows: ls
                          .getRange(_start, _end)
                          .map(
                            (e) => DataRow2(
                              cells: [
                                DataCell(sizedBox(text: "$e")),
                                DataCell(sizedBox(text: "Jane Deo")),
                                DataCell(sizedBox(text: "jane@mail.com")),
                                DataCell(sizedBox(text: "Burger")),
                                DataCell(sizedBox(text: "14")),
                                DataCell(sizedBox(text: "1440")),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  FxBox.h20,
                  Responsive.isMobile(context)
                      ? Column(
                          children: _paggination(),
                        )
                      : Row(
                          children: _paggination(),
                        )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _listCounter() {
    return Row(
      children: [
        const Text("Show   "),
        DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            focusColor: Colors.transparent,
            items: <int>[10, 20, 50, 100].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                _dropValue = value;
                _start = 0;
                _end = value < ls.length ? value : ls.length;
                _page = 0;
                _dataTableBloc.add(const DataTableEvent.rebuild());
              }
            },
            value: _dropValue,
          ),
        ),
        const Text(" entries"),
        if (!Responsive.isMobile(context)) const Spacer(),
        if (!Responsive.isMobile(context))
          Text("Showing ${_start + 1} to $_end of ${ls.length} entries"),
      ],
    );
  }

  List<Widget> _paggination() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxButton(
            onPressed: () {
              if (_page > 0) {
                _page = _page - 1;
                _dataTableBloc.add(const DataTableEvent.rebuild());
              }
              updateData();
            },
            text: 'Privious',
            borderRadius: 0.0,
            borderWidth: 0.0,
            color: ColorConst.white,
            textColor: isDark
                ? null
                : Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          Wrap(
            children: List.generate(
              (ls.length / _dropValue).ceil(),
              (index) => FxButton(
                text: '${index + 1}',
                borderRadius: 0.0,
                minWidth: 16.0,
                color: _page == index
                    ? isDark
                        ? Theme.of(context).colorScheme.inversePrimary
                        : Theme.of(context).colorScheme.onPrimaryContainer
                    : ColorConst.white,
                textColor: _page == index
                    ? ColorConst.white
                    : isDark
                        ? null
                        : Theme.of(context).colorScheme.onPrimaryContainer,
                borderWidth: 0.0,
                onPressed: () {
                  _page = index;
                  updateData();
                  _dataTableBloc.add(const DataTableEvent.rebuild());
                },
              ),
            ),
          ),
          FxButton(
            onPressed: () {
              if (_page < (ls.length / _dropValue).ceil() - 1) {
                _page = _page + 1;
                _dataTableBloc.add(const DataTableEvent.rebuild());
              }
              updateData();
            },
            text: Strings.next,
            borderRadius: 0.0,
            borderWidth: 0.0,
            color: ColorConst.white,
            textColor: isDark
                ? null
                : Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ],
      )
    ];
  }

  Widget sizedBox({String? text, FontWeight? fontwidget = FontWeight.normal}) {
    return Text(
      '$text',
      softWrap: true,
      style: TextStyle(fontSize: 17, fontWeight: fontwidget),
    );
  }

  void updateData() {
    if (_page == 0) {
      _start = 0;
      _end = ls.length < _dropValue ? ls.length : _dropValue;
    } else {
      _start = _page * _dropValue;
      _end = _start + (ls.length < _dropValue ? ls.length : _dropValue);
      _end = _end < ls.length ? _end : ls.length;
    }
  }
}
