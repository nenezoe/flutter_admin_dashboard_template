import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:admin_dashboard/src/admin/widget/textformfield.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class ECartScreen extends StatefulWidget {
  const ECartScreen({super.key});

  @override
  State<ECartScreen> createState() => _ECartScreenState();
}

class _ECartScreenState extends State<ECartScreen> {
  final List<Map<String, dynamic>> _venderList = [
    {
      'id': '1',
      'product_image': Images.gasStove,
      'product_name':
          'Gas Stove Wok Ring Stove Metal Wok Rack Trivets Cook top Range Pan Holder for Gas Hob Home Kitchen Stand Pack Of 1',
      'qty': '1',
      'price': 399,
      'total': 399,
    },
    {
      'id': '2',
      'product_image': Images.ladyGaga,
      'product_name': 'Blend Stitched Anarkali Gown',
      'qty': '2',
      'price': 899,
      'total': 1798,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        islg(context) || isxl(context)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: _cartDetails(),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: Column(
                      children: [
                        _priceBox(),
                        FxBox.h16,
                        _couponBox(),
                      ],
                    ),
                  ),
                ],
              )
            : Responsive.isTablet(context)
                ? Column(
                    children: [
                      _cartDetails(),
                      FxBox.h20,
                      Row(
                        children: [
                          Expanded(child: _priceBox()),
                          FxBox.w16,
                          Expanded(child: _couponBox()),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      _cartDetails(),
                      FxBox.h20,
                      _priceBox(),
                      FxBox.h20,
                      _couponBox(),
                    ],
                  ),
      ],
    );
  }

  Widget _couponBox() {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstText.lightText(
              text: languageModel.eCommerceWeb.couponInfo,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h12,
            SizedBox(
              height: 50,
              child: CustomTextField(
                hintText: 'Enter Coupon Code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: FxButton(
                  onPressed: () {},
                  height: 65,
                  borderRadius: 10,
                  textColor: ColorConst.white,
                  color: ColorConst.primaryDark.withOpacity(0.8),
                  text: Strings.apply,
                ),
              ),
            ),
            FxBox.h12,
            ConstText.lightText(
              text: languageModel.eCommerceWeb.orderDescription,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            FxBox.h12,
            CustomTextField(
              hintText: 'Order Note',
              maxLines: 3,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FxBox.h12,
            Align(
              alignment: Alignment.bottomRight,
              child: FxButton(
                onPressed: () {
                  autoecTabRouter!.setActiveIndex(14);
                },
                height: 50,
                textColor: ColorConst.white,
                color: ColorConst.calSuccess,
                text: Strings.checkOut,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceBox() {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstText.lightText(
              text: languageModel.eCommerceWeb.priceDetails,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _headerAndValue(
                      text: '${languageModel.eCommerceWeb.subTotal}:',
                      text1: '${languageModel.eCommerceWeb.shipping}:',
                      text2: '${languageModel.eCommerceWeb.tax}:',
                      total: '${languageModel.eCommerceWeb.total}:',
                    ),
                  ],
                ),
                Column(
                  children: [
                    _headerAndValue(
                      text: '\$500',
                      text1: 'Free',
                      text2: '\$30',
                      total: '\$530',
                    ),
                  ],
                ),
                const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerAndValue({
    required String text,
    required String text1,
    required String text2,
    required String total,
  }) {
    return Column(
      children: [
        ConstText.lightText(
          text: text,
          textAlign: TextAlign.right,
          fontWeight: FontWeight.w500,
        ),
        FxBox.h12,
        ConstText.lightText(
          text: text1,
          textAlign: TextAlign.right,
          fontWeight: FontWeight.w500,
        ),
        FxBox.h12,
        ConstText.lightText(
          text: text2,
          textAlign: TextAlign.right,
          fontWeight: FontWeight.w500,
        ),
        FxBox.h12,
        ConstText.lightText(
          text: total,
          textAlign: TextAlign.right,
          fontWeight: FontWeight.w800,
        ),
      ],
    );
  }

  Widget _cartDetails() {
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
              text: languageModel.eCommerceWeb.cartInfo.trim(),
              fontWeight: FontWeight.bold,
            ),
            FxBox.h12,
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: (56.0 * 10) + 72.0),
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
                      label: _tableHeader('#'),
                      size: ColumnSize.S,
                    ),
                    DataColumn2(
                      label:
                          _tableHeader(languageModel.eCommerceWeb.productPhoto),
                      size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label:
                          _tableHeader(languageModel.eCommerceWeb.productName),
                      size: ColumnSize.M,
                    ),
                    DataColumn2(
                      label: _tableHeader(languageModel.eCommerceWeb.quantity),
                      size: ColumnSize.M,
                    ),
                    DataColumn2(
                      label: _tableHeader(languageModel.eCommerceWeb.price),
                      size: ColumnSize.S,
                    ),
                    DataColumn2(
                      label: _tableHeader(languageModel.eCommerceWeb.total),
                      size: ColumnSize.S,
                    ),
                    DataColumn2(
                      label: _tableHeader(''),
                      size: ColumnSize.S,
                    ),
                  ],
                  rows: _venderList.map((e) {
                    return DataRow(
                      onSelectChanged: (value) {},
                      cells: [
                        DataCell(_tableHeader(e['id'].toString())),
                        DataCell(_tableImage(e['product_image'])),
                        DataCell(_tableHeader(e['product_name'])),
                        DataCell(_tableHeader(e['qty'])),
                        DataCell(_tableHeader("\$${e['price']}")),
                        DataCell(_tableHeader("\$${e['total']}")),
                        DataCell(_deleteButton(
                          onPressed: () {},
                        )),
                      ],
                    );
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tableHeader(String text) {
    return ConstText.lightText(
      text: text,
      fontWeight: FontWeight.w700,
    );
  }

  Widget _tableImage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(imagePath),
    );
  }

  Widget _deleteButton({
    required void Function()? onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.delete,
        color: ColorConst.errorDark,
      ),
    );
  }
}
