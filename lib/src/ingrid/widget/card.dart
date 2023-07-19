import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class IngridCard extends StatelessWidget {
  const IngridCard(
      {super.key, this.child, this.height, this.width,this.color, this.image,this.padding,});

  final Widget? child;
  final double? height;
  final double? width;
  final Color? color;
  final DecorationImage? image;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: color ?? context.theme.cardColor,
        image: image,
      ),
      child: child,
    );
  }
}

class DetailsCard extends StatelessWidget {
  const DetailsCard(
      {super.key,
      required this.title,
      required this.data,
      this.otherDetails,
      required this.image});

  final String title;
  final String data;
  final String? otherDetails;
  final String image;

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      height: 190,
      color: ConstColor.primary,
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.contain,
        alignment: Alignment.centerRight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style:
                      ConstTheme.title(context).copyWith(color: Colors.white),
                ),
              ),
              FxBox.w8,
              const SvgIcon(
                icon: ConstIcons.menu,
                color: Colors.white,
              ),
            ],
          ),
          Text(
            data,
            style: const TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          if (otherDetails != null) ...[
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                otherDetails!,
                style: ConstTheme.text(context).copyWith(color: Colors.white),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
