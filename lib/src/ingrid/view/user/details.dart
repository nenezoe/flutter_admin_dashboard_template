import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

Map<String, dynamic> _details = {
  'Peterdraw Studio': ConstIcons.briefcase,
  '+123 456 789': ConstIcons.contact,
  'email@mail.com': ConstIcons.email,
};

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!IngridResponsive.isMobile(context)) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                Images.profileImage,
                height: 142.0,
                width: 142.0,
                fit: BoxFit.cover,
              ),
            ),
            FxBox.w36,
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (IngridResponsive.isMobile(context)) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      Images.profileImage,
                      height: 142.0,
                      width: 142.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  FxBox.h8,
                ],
                Text(
                  'John Doe',
                  style: ConstTheme.title(context).copyWith(fontSize: 24.0),
                ),
                FxBox.h8,
                const Text(
                  'UI Designer',
                  style: TextStyle(
                    color: ConstColor.hintColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IngridResponsive.isTablet(context) ||
                        IngridResponsive.isMobile(context)
                    ? FxBox.h24
                    : FxBox.h48,
                if (IngridResponsive.isLargeWeb(context) ||
                    IngridResponsive.isSmallWeb(context) ||
                    IngridResponsive.isMediumWeb(context))
                  Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    children: _details.entries
                        .map((e) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgIcon(
                                  icon: e.value,
                                  color: ConstColor.primary,
                                ),
                                FxBox.w8,
                                Text(
                                  e.key,
                                  style: ConstTheme.text(context),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                if (IngridResponsive.isTablet(context) ||
                    IngridResponsive.isMobile(context))
                  ..._details.entries
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgIcon(
                                  icon: e.value,
                                  color: ConstColor.primary,
                                ),
                                FxBox.w8,
                                Text(
                                  e.key,
                                  style: ConstTheme.text(context),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
              ],
            ),
          ),
          FxBox.w36,
          const SvgIcon(
            icon: ConstIcons.menu,
            color: ConstColor.hintColor,
          ),
        ],
      ),
    );
  }
}
