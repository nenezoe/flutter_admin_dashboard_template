import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  final _dataGeneralList = [
    'timelineText1',
    'timelineText2',
    'timelineText3',
    'timelineText4',
  ];

  final _generalList = [
    'timelineTitle1',
    'timelineTitle2',
    'timelineTitle3',
    'timelineTitle4',
  ];

  final _dataPricingNplanList = [
    'timelineText1',
    'timelineText3',
    'timelineText2',
    'timelineText4',
  ];

  final _pricingNplanList = [
    'timelineTitle4',
    'timelineTitle2',
    'timelineTitle3',
    'timelineTitle1',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 72,
        right: 72,
        top: 60,
        bottom: 20,
      ),
      child: Column(
        children: [
          Text(
            languageModel.extraPage.faqText,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: isDark ? ColorConst.darkFontColor : ColorConst.textColor,
            ),
          ),
          FxBox.h64,
          Responsive.isWeb(context)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _listOne()),
                    FxBox.w(100.0),
                    Expanded(child: _listTwo())
                  ],
                )
              : Column(
                  children: [
                    _listOne(),
                    FxBox.h44,
                    _listTwo(),
                  ],
                ),
          FxBox.h32,
          TextButton(
            onPressed: () {},
            child: const CustomText(
              title: 'Contact Us',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listOne() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                languageModel.translate('generalQuestions'),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
              leading: const Icon(
                Icons.book_online_rounded,
                color: ColorConst.primary,
              ),
            ),
            FxBox.h16,
            _expansionList(_dataGeneralList, _generalList),
          ],
        ),
      ),
    );
  }

  Widget _listTwo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                languageModel.translate('pricingPlans'),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
              leading: const Icon(
                Icons.book_online_rounded,
                color: ColorConst.primary,
              ),
            ),
            FxBox.h16,
            _expansionList(_dataPricingNplanList, _pricingNplanList),
          ],
        ),
      ),
    );
  }

  Widget _expansionList(List<String> title, List<String> list) {
    return ExpansionPanelList.radio(
      dividerColor: Colors.grey.shade300,
      elevation: 0,
      initialOpenPanelValue: 2,
      expandedHeaderPadding: EdgeInsets.zero,
      children: list.map<ExpansionPanelRadio>(
        (String item) {
          return ExpansionPanelRadio(
            backgroundColor: Colors.transparent,
            canTapOnHeader: true,
            value: item,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                hoverColor: Colors.transparent,
                title: Text(
                  languageModel.translate(item),
                  style: TextStyle(
                    color: isExpanded ? ColorConst.primary : null,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            body: ListTile(
              hoverColor: Colors.transparent,
              title: Text(
                languageModel.translate(title.elementAt(
                  list.indexWhere(
                    (element) => element == item,
                  ),
                )),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
