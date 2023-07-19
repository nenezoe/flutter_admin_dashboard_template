import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/order_history/order_details.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final List<Map<String, dynamic>> _dataList = [
    {
      'order_code': '20230313-11135293',
      'date': '13-03-2023',
      'total_amount': 1298,
      'delivery_status': 'Pending',
      'payment_status': 'Unpaid',
      'items': [
        {
          'item_name':
              'Gas Stove Wok Ring Stove Metal Wok Rack Trivets Cook top Range Pan Holder for Gas Hob Home Kitchen Stand Pack Of 1',
          'item_image': Images.gasStove,
          'item_price': 399,
          'item_quantity': 1,
          'item_brand': 'Loream',
          'item_sub_category': '',
        },
        {
          'item_name': 'Blend Stitched Anarkali Gown',
          'item_image': Images.ladyGaga,
          'item_price': 899,
          'item_quantity': 1,
          'item_brand': 'Loream',
          'item_sub_category': '',
        }
      ]
    },
    {
      'order_code': '20230313-11112792',
      'date': '13-03-2023',
      'total_amount': 249,
      'delivery_status': 'Pending',
      'payment_status': 'Unpaid',
      'items': [
        {
          'item_name':
              'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
          'item_image': Images.pinkShirt,
          'item_price': 249,
          'item_quantity': 1,
          'item_brand': 'Loream',
          'item_sub_category': '',
        }
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Purchase History',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(height: 0.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DataTable3(
              showCheckboxColumn: false,
              showBottomBorder: true,
              minWidth: 850.0,
              columns: [
                DataColumn2(
                  size: ColumnSize.L,
                  label: _tableHeader('Code', fontWeight: FontWeight.w700),
                ),
                DataColumn2(
                  label: _tableHeader('Date', fontWeight: FontWeight.w700),
                ),
                DataColumn2(
                  label: _tableHeader('Amount', fontWeight: FontWeight.w700),
                ),
                DataColumn2(
                  label: _tableHeader(
                    'Delivery Status',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                DataColumn2(
                  label: _tableHeader(
                    'Payment Status',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                DataColumn2(
                  label: _tableHeader(
                    'Options',
                    fontWeight: FontWeight.w700,
                  ),
                  size: ColumnSize.L,
                ),
              ],
              rows: List.generate(
                _dataList.length,
                (index) {
                  final e = _dataList[index];
                  return DataRow2(
                    cells: [
                      DataCell(_tableHeader(e['order_code'])),
                      DataCell(_tableHeader(e['date'])),
                      DataCell(_tableHeader('\$ ${e['total_amount']}')),
                      DataCell(_tableHeader(e['delivery_status'])),
                      DataCell(FxBadge(
                        radius: 2.0,
                        text: e['payment_status'],
                        color: ColorConst.error,
                        textStyle: const TextStyle(
                          fontSize: 10.4,
                          color: ColorConst.white,
                        ),
                      )),
                      DataCell(
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                backgroundColor:
                                    ColorConst.lightRed.withOpacity(0.15),
                                radius: 15.0,
                                child: Icon(
                                  Icons.delete_outline,
                                  color: ColorConst.error,
                                  size: 16.0,
                                ),
                              ),
                            ),
                            FxBox.w6,
                            InkWell(
                              onTap: () {
                                OrderDetails.showOrderDetailModel(
                                  orderData: e,
                                  context: context,
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    ColorConst.lightBlue.withOpacity(0.15),
                                radius: 15.0,
                                child: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _tableHeader(String text, {Color? color, FontWeight? fontWeight}) {
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
