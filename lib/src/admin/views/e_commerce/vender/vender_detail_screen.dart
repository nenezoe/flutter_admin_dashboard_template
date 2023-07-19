// ignore_for_file: prefer_const_constructors

import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';

import 'package:admin_dashboard/src/admin/views/e_commerce/vender/latest_transaction.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/vender/monthly_order_char.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/vender/vender_list_item.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class VenderDetailScreen extends StatefulWidget {
  const VenderDetailScreen({super.key});

  @override
  State<VenderDetailScreen> createState() => _VenderDetailScreenState();
}

class _VenderDetailScreenState extends State<VenderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MediaQuery.of(context).size.width >= 1500
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      venderDetail(),
                      FxBox.h20,
                      _bankDetails(),
                    ],
                  ),
                  _venderRevenue(),
                ],
              )
            : Responsive.isMobile(context) ||
                    islg(context) ||
                    Responsive.isTablet(context)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          venderDetail(),
                          FxBox.h20,
                          _bankDetails(),
                        ],
                      ),
                      _venderRevenue(),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          venderDetail(),
                          FxBox.w20,
                          _bankDetails(),
                        ],
                      ),
                      _venderRevenue(),
                    ],
                  ),
        FxBox.h20,
        MonthlyOrderChart(),
        FxBox.h20,
        LatestTransaction(),
      ],
    );
  }

  Widget _venderRevenue() {
    return Container(
      constraints: BoxConstraints(
          maxWidth: isxl(context)
              // ? (56.0 * 10) + 72.0
              ? 650
              : MediaQuery.of(context).size.width),
      padding: const EdgeInsets.all(20),
      child: VenderListItem(),
    );
  }

  Widget _bankDetails() {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        constraints: MediaQuery.of(context).size.width < 1300
            ? const BoxConstraints(maxWidth: 500.0)
            : const BoxConstraints(maxWidth: (56.0 * 10) + 72.0),
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstText.lightText(
                text: languageModel.form.bankDetails,
                fontWeight: FontWeight.bold,
              ),
              FxBox.h24,
              Row(
                children: [
                  Expanded(
                      child: _headerWithValue(
                          header: languageModel.eCommerceAdmin.bankName,
                          value: 'Money Bank')),
                  Expanded(
                      child: _headerWithValue(
                          header: languageModel.eCommerceAdmin.bankType,
                          value: 'Current Account')),
                ],
              ),
              FxBox.h24,
              _headerWithValue(
                  header: languageModel.eCommerceAdmin.accountNumberName,
                  value: '-'),
            ],
          ),
        ),
      ),
    );
  }

  Widget venderDetail() {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        constraints: const BoxConstraints(maxWidth: (56.0 * 10) + 72.0),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ConstText.lightText(
              text: languageModel.eCommerceAdmin.venderDetail,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h24,
            _profileImage(),
            FxBox.h24,
            _personalInfo(),
          ],
        ),
      ),
    );
  }

  Widget _personalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _emailAndPhone(),
        FxBox.h16,
        _addressAndDate(),
        FxBox.h16,
        _status(),
      ],
    );
  }

  Widget _status() {
    return _headerWithValue(
        header: languageModel.eCommerceAdmin.status, value: 'Active');
  }

  Widget _emailAndPhone() {
    return Row(
      children: [
        Expanded(
            child: _headerWithValue(
                header: languageModel.form.email, value: 'h.patel@gmail.com')),
        Expanded(
            child: _headerWithValue(
                header: languageModel.eCommerceAdmin.phone,
                value: '+1 5654349204')),
      ],
    );
  }

  Widget _addressAndDate() {
    return Row(
      children: [
        Expanded(
            child: _headerWithValue(
                header: languageModel.form.address, value: 'Gujarat, India')),
        Expanded(
            child: _headerWithValue(
                header: languageModel.eCommerceAdmin.dateOfJoin,
                value: '30 Jan 2023')),
      ],
    );
  }

  Widget _headerWithValue({
    String? header,
    String? value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: header,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
        CustomText(
          title: value,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  Widget _profileImage() {
    return Row(
      children: [
        Container(
          height: 160,
          width: 140,
          decoration: BoxDecoration(
            color: ColorConst.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            Images.men,
          ),
        ),
        FxBox.w16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomText(
              title: 'Hemal Patel',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              title: 'Avarage Ratings',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    );
  }
}
