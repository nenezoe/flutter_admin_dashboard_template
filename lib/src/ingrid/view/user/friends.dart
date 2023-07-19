import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

Map<String, dynamic> _data = {
  'Samantha William': 'UX Designer',
  'Tony Soap': 'Web Developer',
  'Nadila Adja': 'Graphic Designer',
  'Jordan Nico': 'Product Manager',
  'Azizi Azazel': 'UX Engineer',
  'Johnny Ahmad': 'Product Owner'
};

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ConstString.friends,
                  style: ConstTheme.title(context),
                ),
              ),
              const SvgIcon(
                icon: ConstIcons.menu,
                color: ConstColor.hintColor,
              ),
            ],
          ),
          FxBox.h24,
          TextField(
            cursorWidth: 1,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hoverColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: context.isDarkMode
                  ? ConstColor.darkFillColor
                  : ConstColor.lightFillColor,
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              hintText: ConstString.search,
              hintStyle: const TextStyle(
                fontSize: 16,
                color: ConstColor.hintColor,
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: SvgIcon(
                  icon: ConstIcons.search,
                  color: ConstColor.hintColor,
                ),
              ),
              isCollapsed: true,
            ),
          ),
          FxBox.h24,
          ListView.separated(
            itemCount: _data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      Images.profileImage,
                      height: 46.0,
                      width: 46.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  FxBox.w28,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _data.keys.elementAt(index),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: ConstTheme.title(context),
                        ),
                        Text(
                          _data.values.elementAt(index),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: ConstTheme.hintText,
                        ),
                      ],
                    ),
                  ),
                  FxBox.w28,
                  const SvgIcon(
                    icon: ConstIcons.chat,
                    color: ConstColor.hintColor,
                    size: 32.0,
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => FxBox.h28,
          ),
        ],
      ),
    );
  }
}
