import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/view/todo/todo_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';

class ToDoDrawer extends StatefulWidget {
  const ToDoDrawer({super.key});

  @override
  State<ToDoDrawer> createState() => _ToDoDrawerState();
}

class _ToDoDrawerState extends State<ToDoDrawer> {
  int tapIndex = 0;
  int? labelTapIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: (IngridResponsive.isLargeWeb(context) ||
                IngridResponsive.isMediumWeb(context) ||
                IngridResponsive.isSmallWeb(context))
            ? context.isDarkMode
                ? ConstColor.darkAppBar
                : ConstColor.white
            : null,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _newTaskButton(),
          FxBox.h40,
          ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: ToDoData.todoDrawerList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  tapIndex = index;
                  setState(() {});
                  if (IngridResponsive.isMobile(context) ||
                      IngridResponsive.isTablet(context)) {
                    Navigator.pop(context);
                  }
                },
                leading: SvgPicture.asset(
                  ToDoData.todoDrawerList[index]['folder_icon'],
                  color: tapIndex == index
                      ? ConstColor.blueAccent
                      : ConstColor.hintColor,
                ),
                title: Text(
                  ToDoData.todoDrawerList[index]['folder_name'],
                  style: ConstTheme.title(context).copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: tapIndex == index
                        ? ConstColor.blueAccent
                        : ConstColor.hintColor,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return FxBox.h16;
            },
          ),
          FxBox.h40,
          Text(
            ConstString.label,
            style: ConstTheme.title(context).copyWith(
              color: ConstColor.hintColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          FxBox.h40,
          ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: ToDoData.todoDrawerLabelList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  labelTapIndex = index;
                  setState(() {});
                  if (IngridResponsive.isMobile(context) ||
                      IngridResponsive.isTablet(context) ||
                      IngridResponsive.isSmallWeb(context)) {
                    Navigator.pop(context);
                  }
                },
                leading: SvgPicture.asset(
                  ToDoData.todoDrawerLabelList[index]['folder_icon'],
                  color: labelTapIndex == index
                      ? ConstColor.blueAccent
                      : ConstColor.hintColor,
                ),
                title: Text(
                  ToDoData.todoDrawerLabelList[index]['folder_name'],
                  style: ConstTheme.title(context).copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: labelTapIndex == index
                        ? ConstColor.blueAccent
                        : ConstColor.hintColor,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return FxBox.h16;
            },
          ),
        ],
      ),
    );
  }

  Widget _newTaskButton() {
    return MaterialButton(
      onPressed: () {},
      color: ConstColor.blueAccent,
      height: 50.0,
      minWidth: 230.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        ConstString.newTask,
        style: ConstTheme.title(context).copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: ConstColor.white),
      ),
    );
  }
}
