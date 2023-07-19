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

List<String> _name = [
  'Samantha William',
  'Tony Soap',
  'Nadila Adja',
  'Jordan Nico'
];

class Message extends StatelessWidget {
  const Message({super.key});

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
          FxBox.h40,
          ListView.separated(
            itemCount: _name.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      Images.profileImage,
                      height: 30.0,
                      width: 30.0,
                      fit: BoxFit.cover,
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
                          style: ConstTheme.title(context),
                        ),
                        FxBox.h8,
                        Text(
                          'Lorem ipsum dolor sit amet, consectetuer Aenean commodo ligula eget dolor.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: ConstTheme.hintText.copyWith(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                  FxBox.w8,
                  Column(
                    children: [
                      Text('12:45 PM', style: ConstTheme.hintText),
                      FxBox.h12,
                      if (index == 0 || index == 1)
                        Container(
                          height: 24.0,
                          width: 24.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ConstColor.redAccent,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            '2',
                            style: ConstTheme.text(context)
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      if (index == 2)
                        const SvgIcon(
                          icon: ConstIcons.read,
                          color: ConstColor.primary,
                        ),
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(height: 48.0, thickness: 1.0),
          ),
        ],
      ),
    );
  }
}
