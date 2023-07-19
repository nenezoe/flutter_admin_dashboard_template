import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/widget/button.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

List<String> _name = [
  'Samantha William',
  'Karen Hope',
  'Jordan Nico',
  'Tony Soap'
];

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    if (IngridResponsive.isSmallWeb(context) ||
        IngridResponsive.isMediumWeb(context)) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(child: _Activity()),
          FxBox.w24,
          const Expanded(child: _Message()),
          FxBox.w24,
          const Expanded(child: _Contact()),
        ],
      );
    }
    return Container(
      color:
          IngridResponsive.isLargeWeb(context) ? context.theme.cardColor : null,
      child: Column(
        children: [
          const _Activity(),
          FxBox.h24,
          const _Message(),
          FxBox.h24,
          const _Contact(),
        ],
      ),
    );
  }
}

class _Activity extends StatelessWidget {
  const _Activity();

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ConstString.lastestActivity,
                  style: ConstTheme.title(context),
                ),
              ),
              const SvgIcon(
                icon: ConstIcons.menu,
                color: ConstColor.hintColor,
              ),
            ],
          ),
          FxBox.h32,
          IngridStepper(
            step: List.generate(
              3,
              (index) => IngridStep(
                title:
                    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean',
                content: '2 March 2023, 13:45 PM',
                titleStyle: ConstTheme.text(context),
              ),
            ),
          ),
          FxBox.h32,
          const IngridButton(text: 'View all activity'),
        ],
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message();

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ConstString.message,
                  style: ConstTheme.title(context),
                ),
              ),
              const SvgIcon(
                icon: ConstIcons.menu,
                color: ConstColor.hintColor,
              ),
            ],
          ),
          FxBox.h32,
          ListView.separated(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 32.0,
                    width: 32.0,
                    decoration: BoxDecoration(
                      color: ConstColor.hintColor,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.asset(
                        Images.profileImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _name[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: ConstTheme.title(context)
                              .copyWith(fontSize: 14.0),
                        ),
                        FxBox.h6,
                        Text(
                          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: ConstTheme.hintText.copyWith(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(height: 48.0, thickness: 1.0),
          ),
          FxBox.h32,
          const IngridButton(text: 'View all activity'),
        ],
      ),
    );
  }
}

class _Contact extends StatelessWidget {
  const _Contact();

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ConstString.contact,
                  style: ConstTheme.title(context),
                ),
              ),
              const SvgIcon(
                icon: ConstIcons.menu,
                color: ConstColor.hintColor,
              ),
            ],
          ),
          FxBox.h16,
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
          FxBox.h32,
          ListView.separated(
            itemCount: _name.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: ConstColor.hintColor,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.asset(
                        Images.profileImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  FxBox.w28,
                  Expanded(
                    child: Text(
                      _name[index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ConstTheme.title(context),
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
