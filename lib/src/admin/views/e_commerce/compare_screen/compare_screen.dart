import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  final List<Map<String, dynamic>> _dataList = [
    {
      'item_name':
          'Gas Stove Wok Ring Stove Metal Wok Rack Trivets Cook top Range Pan Holder for Gas Hob Home Kitchen Stand Pack Of 1',
      'item_image': Images.gasStove,
      'item_price': 399,
      'item_brand': 'Loream',
      'item_sub_category': '',
    },
    {
      'item_name': 'Blend Stitched Anarkali Gown',
      'item_image': Images.ladyGaga,
      'item_price': 899,
      'item_brand': 'Loream',
      'item_sub_category': '',
    },
    {
      'item_name': 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
      'item_image': Images.pinkShirt,
      'item_price': 249,
      'item_brand': 'Loream',
      'item_sub_category': '',
    },
    {
      'item_name': 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
      'item_image': Images.blackShirt,
      'item_price': 260,
      'item_brand': 'Loream',
      'item_sub_category': '',
    },
    {
      'item_name': 'Aapkur nevy blue',
      'item_image': Images.blackDress,
      'item_price': 599,
      'item_brand': '',
      'item_sub_category': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          languageModel.landingPage.compare,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        FxBox.h24,
        Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageModel.landingPage.comparison,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    FxButton(
                      borderRadius: 2.0,
                      color: ColorConst.darkFooterText,
                      onPressed: () {},
                      text: languageModel.landingPage.resetCompareList,
                    )
                  ],
                ),
              ),
              const Divider(height: 0.0),
              _dataList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        languageModel.landingPage.emptyCompare,
                        style: const TextStyle(fontSize: 17.0),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DataTable3(
                          showCheckboxColumn: false,
                          showBottomBorder: true,
                          minWidth: 728.0,
                          headingRowHeight: 0.0,
                          border: TableBorder.all(
                            color: ColorConst.lightGrey,
                          ),
                          columns: List.generate(
                            _dataList.length + 1,
                            (index) => index == 0
                                ? DataColumn2(
                                    size: ColumnSize.S, label: FxBox.shrink)
                                : DataColumn2(
                                    size: ColumnSize.L, label: FxBox.shrink),
                          ),
                          rows: [
                            DataRow2(
                              specificRowHeight: 150.0,
                              cells: List.generate(
                                _dataList.length + 1,
                                (index) => DataCell(
                                  _tableHeader(
                                    index == 0
                                        ? languageModel.landingPage.name
                                        : _dataList[index - 1]['item_name'],
                                  ),
                                ),
                              ),
                            ),
                            DataRow2(
                              specificRowHeight: 500.0,
                              cells: List.generate(
                                _dataList.length + 1,
                                (index) => DataCell(
                                  index == 0
                                      ? _tableHeader(
                                          languageModel.landingPage.image)
                                      : _tableRowImage(
                                          _dataList[index - 1]['item_image'],
                                        ),
                                ),
                              ),
                            ),
                            DataRow2(
                              cells: List.generate(
                                _dataList.length + 1,
                                (index) => DataCell(
                                  index == 0
                                      ? _tableHeader(
                                          languageModel.landingPage.price)
                                      : _tableHeader(
                                          "\$ ${_dataList[index - 1]['item_price']}",
                                          color: ColorConst.priceColor,
                                        ),
                                ),
                              ),
                            ),
                            DataRow2(
                              cells: List.generate(
                                _dataList.length + 1,
                                (index) => DataCell(
                                  index == 0
                                      ? _tableHeader(
                                          languageModel.landingPage.brand)
                                      : _tableHeader(
                                          _dataList[index - 1]['item_brand'],
                                          fontWeight: FontWeight.w400,
                                        ),
                                ),
                              ),
                            ),
                            DataRow2(
                              cells: List.generate(
                                _dataList.length + 1,
                                (index) => DataCell(
                                  _tableHeader(
                                    index == 0
                                        ? languageModel.landingPage.subCategory
                                        : _dataList[index - 1]
                                            ['item_sub_category'],
                                  ),
                                ),
                              ),
                            ),
                            DataRow2(
                              cells: List.generate(
                                _dataList.length + 1,
                                (index) => DataCell(
                                  index == 0
                                      ? _tableHeader('')
                                      : Align(
                                          alignment: Alignment.center,
                                          child: FxButton(
                                            // color: ColorConst.black,
                                            borderRadius: 6.0,
                                            onPressed: () {
                                              autoecTabRouter!
                                                  .setActiveIndex(7);
                                            },
                                            text: 'Add to Cart',
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ]),
                    )
            ],
          ),
        )
      ],
    );
  }

  Widget _tableHeader(String text, {Color? color, FontWeight? fontWeight}) {
    return Text(
      text,
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color,
      ),
    );
  }

  Widget _tableRowImage(String image) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(image),
    );
  }
}
