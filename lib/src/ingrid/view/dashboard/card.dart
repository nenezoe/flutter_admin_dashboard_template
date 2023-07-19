import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class DashboardCardList extends StatelessWidget {
  const DashboardCardList({super.key});

  @override
  Widget build(BuildContext context) {
    if (IngridResponsive.isMobile(context) ||
        IngridResponsive.isTablet(context)) {
      return Column(
        children: [
          const DashboardCard(
            color: ConstColor.blueAccent,
            icon: ConstIcons.view,
            title: 'Visitor',
            subtitle: '5.200',
            detail: '+12%',
          ),
          FxBox.h24,
          const DashboardCard(
            color: ConstColor.yellowAccent,
            icon: ConstIcons.user,
            title: 'User',
            subtitle: '2.100',
            detail: '+12%',
          ),
          FxBox.h24,
          const DashboardCard(
            color: ConstColor.redAccent,
            icon: ConstIcons.activity,
            title: 'Activity',
            subtitle: '765',
            detail: '-10%',
          ),
        ],
      );
    }
    return Row(
      children: [
        const Expanded(
          child: DashboardCard(
            color: ConstColor.blueAccent,
            icon: ConstIcons.view,
            title: 'Visitor',
            subtitle: '5.200',
            detail: '+12%',
          ),
        ),
        FxBox.w24,
        const Expanded(
          child: DashboardCard(
            color: ConstColor.yellowAccent,
            icon: ConstIcons.user,
            title: 'User',
            subtitle: '2.100',
            detail: '+12%',
          ),
        ),
        FxBox.w24,
        const Expanded(
          child: DashboardCard(
            color: ConstColor.redAccent,
            icon: ConstIcons.activity,
            title: 'Activity',
            subtitle: '765',
            detail: '-10%',
          ),
        ),
      ],
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.detail,
  });

  final Color color;
  final String icon;
  final String title;
  final String subtitle;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            height: 48.0,
            width: 48.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SvgIcon(icon: icon, color: Colors.white),
          ),
          FxBox.w12,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: ConstTheme.hintText),
              Text(
                subtitle,
                style: ConstTheme.heading.copyWith(
                  color: context.isDarkMode
                      ? Colors.white
                      : const Color(0xff303E65),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(detail, style: ConstTheme.heading.copyWith(color: color)),
        ],
      ),
    );
  }
}
