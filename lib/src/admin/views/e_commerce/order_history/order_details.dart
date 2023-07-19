import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class OrderDetails {
  static Future<Object?> showOrderDetailModel({
    required Map<String, dynamic> orderData,
    required BuildContext context,
  }) async {
    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: 'Model',
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          transformHitTests: false,
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: 1000.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.25),
                    ),
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SelectionArea(
                              child: Text(
                                'Order id: ${orderData['order_code']}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(Icons.close),
                            )
                          ],
                        ),
                      ),
                      const Divider(height: 0),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 178.0,
                        ),
                        child: SingleChildScrollView(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Responsive.isMobile(context)
                                ? Column(
                                    children: [
                                      _products(orderData),
                                      _orderAmountDetails(orderData)
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: _products(orderData),
                                      ),
                                      Expanded(
                                        child: _orderAmountDetails(orderData),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Widget _orderAmountDetails(Map<String, dynamic> orderData) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: ColorConst.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Order Ammount',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(height: 0.0),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _orderAmountText(
                    'Subtotal', orderData['total_amount'].toString()),
                FxBox.h12,
                _orderAmountText('Shipping', '0.0'),
                FxBox.h12,
                _orderAmountText('Tax', '0.0'),
                FxBox.h12,
                _orderAmountText('Coupon', '0.0'),
                FxBox.h12,
                _orderAmountText(
                  'Total',
                  orderData['total_amount'].toString(),
                  valueFontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _orderAmountText(String title, String value,
      {FontWeight? valueFontWeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(
          "\$ $value",
          style: TextStyle(fontWeight: valueFontWeight),
        ),
      ],
    );
  }

  static Widget _products(Map<String, dynamic>? orderData) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: ColorConst.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Order Details',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(height: 0.0),
          Container(
            decoration: BoxDecoration(
              // color: ColorConst.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                DataTable3(
                  showCheckboxColumn: false,
                  columnSpacing: 20.0,
                  minWidth: 500.0,
                  dataRowHeight: 56.0,
                  headingRowHeight: 64.0,
                  border: isDark
                      ? null
                      : const TableBorder(
                          horizontalInside: BorderSide(
                            color: ColorConst.white,
                          ),
                        ),
                  columns: [
                    DataColumn2(
                      label: _tableHeader('#', fontWeight: FontWeight.bold),
                      size: ColumnSize.S,
                    ),
                    DataColumn2(
                      label:
                          _tableHeader('Product', fontWeight: FontWeight.bold),
                      size: ColumnSize.L,
                    ),
                    DataColumn2(
                        size: ColumnSize.S,
                        label: _tableHeader('Quantity',
                            fontWeight: FontWeight.bold)),
                    DataColumn2(
                        label: _tableHeader('Delivery Type',
                            fontWeight: FontWeight.bold)),
                    DataColumn2(
                      label: _tableHeader('Price', fontWeight: FontWeight.bold),
                      size: ColumnSize.S,
                    ),
                  ],
                  rows: List.generate(
                    orderData?['items'].length,
                    (index) {
                      Map<String, dynamic> e = orderData?['items'][index];
                      return DataRow2(
                        cells: [
                          DataCell(_tableHeader('${index + 1}')),
                          DataCell(_tableHeader(e['item_name'])),
                          DataCell(_tableHeader(e['item_quantity'].toString())),
                          DataCell(_tableHeader('Home Delivery')),
                          DataCell(_tableHeader("\$ ${e['item_price']}")),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _tableHeader(String text,
      {Color? color, FontWeight? fontWeight}) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
