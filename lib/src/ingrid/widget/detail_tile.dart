import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class DetailTile extends StatelessWidget {
  const DetailTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.ammount,
    required this.icon,
    required this.color,
  });

  final String title;
  final String? subtitle;
  final String ammount;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 48.0,
          width: 48.0,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SvgIcon(icon: icon, color: color),
        ),
        FxBox.w16,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: ConstTheme.title(context).copyWith(fontSize: 16.0),
              ),
              Text(
                subtitle ?? '2 March 2021, 13:45 PM',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: ConstTheme.hintText.copyWith(fontSize: 12.0),
              ),
            ],
          ),
        ),
        FxBox.w16,
        Text(ammount, style: ConstTheme.title(context).copyWith(color: color)),
      ],
    );
  }
}
