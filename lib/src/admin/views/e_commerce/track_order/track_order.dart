import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:admin_dashboard/src/admin/widget/textformfield.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  final TextEditingController _orderController = TextEditingController();
  Map<String, dynamic> _searchData = {};
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
  void initState() {
    _orderController.text = '20230313-11135293';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            languageModel.landingPage.trackOrder,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FxBox.h12,
        _orderSearchForm(),
        FxBox.h52,
        if (_searchData.isNotEmpty)
          Column(
            children: [
              _orderSummary(),
              FxBox.h16,
              _product(),
            ],
          ),
      ],
    );
  }

  Widget _orderSearchForm() {
    return SizedBox(
      width: 500.0,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                languageModel.translate('checkYourOrderStatus'),
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(height: 0.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextField(
                controller: _orderController,
                hintText: 'Order Code',
                filled: true,
                fillColor: isDark ? ColorConst.scaffoldDark : ColorConst.white,
              ),
            ),
            FxButton(
              height: 42.0,
              onPressed: () {
                _searchData = _dataList
                    .where(
                      (element) {
                        return element['order_code'].toLowerCase() ==
                            _orderController.text.trim().toLowerCase();
                      },
                    )
                    .toList()
                    .first;
                setState(() {});
                _orderController.clear();
              },
              borderRadius: 4.0,
              text: languageModel.landingPage.trackOrder,
            ),
            FxBox.h12,
          ],
        ),
      ),
    );
  }

  Widget _orderSummary() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              languageModel.translate('orderSummary'),
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(height: 0.0),
          if (Responsive.isWeb(context)) ...{
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _orderSummaryText(
                          '${languageModel.translate('orderCode')}:',
                          _searchData['order_code']),
                      _orderSummaryText(
                          '${languageModel.eCommerceAdmin.customer}:',
                          'Keval Gajera'),
                      _orderSummaryText('${languageModel.form.email}:',
                          'keval.gajera@sarvadhi.com'),
                      _orderSummaryText(
                          '${languageModel.eCommerceWeb.shipping} ${languageModel.landingPage.address.toLowerCase()}:',
                          'Surat, Adoni, India'),
                    ],
                  ),
                ),
                FxBox.w64,
                Expanded(
                  child: Column(
                    children: [
                      _orderSummaryText('${languageModel.dashboard.orderDate}:',
                          _searchData['date']),
                      _orderSummaryText(
                          '${languageModel.eCommerceAdmin.total} ${languageModel.eCommerceAdmin.orderAmount.toLowerCase()}:',
                          '\$ ${_searchData['total_amount']}'),
                      _orderSummaryText(
                          '${languageModel.translate('shippingMethod')}:',
                          'Flat shipping rate'),
                      _orderSummaryText(
                          '${languageModel.translate('paymentMethod')}:',
                          'Cash on delivery'),
                      _orderSummaryText(
                          '${languageModel.dashboard.deliveryStatus}:',
                          'Pending'),
                    ],
                  ),
                )
              ],
            )
          } else ...{
            Column(
              children: [
                _orderSummaryText('${languageModel.translate('orderCode')}:',
                    _searchData['order_code']),
                _orderSummaryText(
                    '${languageModel.eCommerceAdmin.customer.trim()}:',
                    'Keval Gajera'),
                _orderSummaryText('${languageModel.form.email}:',
                    'keval.gajera@sarvadhi.com'),
                _orderSummaryText(
                    '${languageModel.eCommerceWeb.shipping} ${languageModel.landingPage.address.toLowerCase()}:',
                    'Surat, Adoni, India'),
                _orderSummaryText('${languageModel.dashboard.orderDate}:',
                    _searchData['date']),
                _orderSummaryText(
                    '${languageModel.eCommerceAdmin.total} ${languageModel.eCommerceAdmin.orderAmount.toLowerCase()}:',
                    '\$ ${_searchData['total_amount']}'),
                _orderSummaryText(
                    '${languageModel.translate('shippingMethod')}:',
                    'Flat shipping rate'),
                _orderSummaryText(
                    '${languageModel.translate('paymentMethod')}:',
                    'Cash on delivery'),
                _orderSummaryText(
                    '${languageModel.dashboard.deliveryStatus}:', 'Pending'),
              ],
            )
          }
        ],
      ),
    );
  }

  Widget _orderSummaryText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(child: Text(value, textAlign: TextAlign.start)),
        ],
      ),
    );
  }

  Widget _product() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _searchData['items'].length,
      itemBuilder: (context, index) {
        final e = _searchData['items'][index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Divider(height: 0.0),
                DataTable3(
                  showCheckboxColumn: false,
                  minWidth: 500.0,
                  columns: [
                    DataColumn2(
                      size: ColumnSize.L,
                      label: _tableHeader(languageModel.table.productName,
                          fontWeight: FontWeight.bold),
                    ),
                    DataColumn2(
                      label: _tableHeader(languageModel.table.quantity,
                          fontWeight: FontWeight.bold),
                    ),
                    DataColumn2(
                      label: _tableHeader(languageModel.translate('shippedBy'),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                  rows: [
                    DataRow2(
                      cells: [
                        DataCell(_tableHeader(e['item_name'])),
                        DataCell(_tableHeader(e['item_quantity'].toString())),
                        DataCell(_tableHeader('Sarvadhi')),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
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
