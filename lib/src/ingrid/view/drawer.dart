import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';

List<List<dynamic>> _option = [
  [ConstString.dashboard, ConstIcons.dashboard, 0],
  [ConstString.email, ConstIcons.email, 1],
  [ConstString.contact, ConstIcons.contact, 2],
  [ConstString.crypto, ConstIcons.crypto, 3],
  [ConstString.kanban, ConstIcons.kanban, 4],
  [ConstString.invoice, ConstIcons.invoice, 5],
  [ConstString.banking, ConstIcons.banking, 6],
  [ConstString.fileManager, ConstIcons.fileManager, 7],
  [ConstString.user, ConstIcons.user, 8],
  [ConstString.calendar, ConstIcons.calendar, 9],
  [ConstString.todoList, ConstIcons.todoList, 10],
  [ConstString.chat, ConstIcons.chat, 11],
];

class IngridDrawer extends StatelessWidget {
  const IngridDrawer({super.key, required this.tabsRouter});

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            bottom: false,
            child: SvgPicture.asset(
              context.isDarkMode ? ConstIcons.darkLogo : ConstIcons.lightLogo,
              height: 54.0,
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              itemCount: _option.length + 1,
              itemBuilder: (context, index) => FxBox.h12,
              separatorBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    tabsRouter.setActiveIndex(_option[index][2]);
                  },
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: '${_option[index][0] == ConstString.calendar ? 'calender' : _option[index][0] == ConstString.fileManager ? 'file-manager' : _option[index][0] == ConstString.todoList ? 'todo-list' : _option[index][0]}'.isActive(context)
                          ? ConstColor.primary.withOpacity(0.05)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: SvgIcon(
                            icon: _option[index][1],
                            color: '${_option[index][0] == ConstString.calendar ? 'calender' : _option[index][0] == ConstString.fileManager ? 'file-manager' : _option[index][0] == ConstString.todoList ? 'todo-list' : _option[index][0]}'.isActive(context)
                                ? ConstColor.primary
                                : ConstColor.hintColor,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            _option[index][0],
                            style: '${_option[index][0] == ConstString.calendar ? 'calender' : _option[index][0] == ConstString.fileManager ? 'file-manager' : _option[index][0] == ConstString.todoList ? 'todo-list' : _option[index][0]}'.isActive(context)
                                ? const TextStyle(
                                    fontSize: 18.0,
                                    color: ConstColor.primary,
                                    fontWeight: FontWeight.bold,
                                  )
                                : const TextStyle(
                                    fontSize: 18.0,
                                    color: ConstColor.hintColor,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
