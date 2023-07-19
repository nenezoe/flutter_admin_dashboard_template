import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class SendInvoice extends StatelessWidget {
  const SendInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ConstString.sendInvoice,
            style: ConstTheme.title(context),
          ),
          FxBox.h24,
          Text(
            'Choose Service',
            style: ConstTheme.hintText.copyWith(fontSize: 18.0),
          ),
          FxBox.h16,
          DropdownButtonFormField(
            isExpanded: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12.0),
              ),
              filled: true,
              fillColor: context.isDarkMode
                  ? ConstColor.darkFillColor
                  : ConstColor.lightFillColor,
              contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            ),
            items: [
              DropdownMenuItem(
                value: 'Research & Development',
                child: Text(
                  'Research & Development',
                  overflow: TextOverflow.ellipsis,
                  style: ConstTheme.text(context).copyWith(fontSize: 16.0),
                ),
              ),
            ],
            value: 'Research & Development',
            style: ConstTheme.text(context).copyWith(fontSize: 18.0),
            onChanged: (value) {},
          ),
          FxBox.h32,
          Text(
            'Amount',
            style: ConstTheme.hintText.copyWith(fontSize: 18.0),
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
              contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              hintText: 'Insert amount',
              hintStyle: ConstTheme.hintText.copyWith(fontSize: 18.0),
              isCollapsed: true,
            ),
          ),
          FxBox.h32,
          Text(
            'Recipient',
            style: ConstTheme.hintText.copyWith(fontSize: 18.0),
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
              contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              hintText: 'Insert email',
              hintStyle: ConstTheme.hintText.copyWith(fontSize: 18.0),
              isCollapsed: true,
            ),
          ),
          FxBox.h32,
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  const MaterialStatePropertyAll(ConstColor.primary),
              fixedSize: MaterialStatePropertyAll(Size(context.width, 38.0)),
              elevation: const MaterialStatePropertyAll(0.0),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SvgIcon(icon: ConstIcons.send, color: Colors.white),
                FxBox.w24,
                const Text(
                  'Send Ivoice',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
