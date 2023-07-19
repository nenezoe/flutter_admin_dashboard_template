import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/tabbar/tab_view.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutterx/flutterx.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  final labelList =  [languageModel.widget.home, languageModel.widget.profile, languageModel.widget.messages, languageModel.widget.settings, languageModel.widget.extra];
  final labelItemsList =  [
    languageModel.widget.tabLorem,
    languageModel.widget.tabLorem,
    languageModel.widget.tabLorem,
    languageModel.widget.tabLorem,
    languageModel.widget.tabLorem
  ];

  List<IconData> iconsList = const [
    Icons.home,
    Icons.person,
    Icons.email,
    Icons.settings,
    Icons.expand,
  ];

  late final TabController _controller;
  late TextTheme textTheme;

  @override
  void initState() {
    _controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive.isWeb(context) ? _webView(ctx: context) : _mobileView();
  }

  Widget _mobileView() {
    return Center(
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _defaultTabs('Default Tabs', TabType.defaultTabs),
            FxBox.h16,
            _defaultTabs('Justify Tabs', TabType.justifyTab),
            FxBox.h16,
            _defaultTabs('Custom Tabs', TabType.customTab),
          ],
        ),
      ),
    );
  }

  Widget _defaultTabs(String title, TabType type) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            FxBox.h20,
            CustomTabView(
              tabType: type,
              tabsName: labelList,
              tabsElements: labelItemsList,
            ),
          ],
        ),
      ),
    );
  }

  Widget _webView({required BuildContext ctx}) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            child: Row(children: [
              Expanded(
                child: _defaultTabs('Default Tabs', TabType.defaultTabs),
              ),
              FxBox.w20,
              Expanded(
                child: _defaultTabs('Justify Tabs', TabType.justifyTab),
              ),
            ]),
          ),
          FxBox.h20,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: _defaultTabs('Custom Tabs', TabType.customTab)),
              FxBox.w20,
              Expanded(child: FxBox.shrink)
            ],
          ),
        ],
      ),
    );
  }
}
