import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/view/todo/todo_card.dart';
import 'package:admin_dashboard/src/ingrid/view/todo/todo_data.dart';
import 'package:admin_dashboard/src/ingrid/view/todo/todo_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  String value = 'Newest';
  int pageIndex = 0;
  bool isOpenMenu = true;
  @override
  Widget build(BuildContext context) {
    if (IngridResponsive.isLargeWeb(context) ||
        IngridResponsive.isMediumWeb(context) ||
        IngridResponsive.isSmallWeb(context)) {
      isOpenMenu = true;
    } else {
      isOpenMenu = false;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (IngridResponsive.isMobile(context)) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ConstString.importantTask,
                style: ConstTheme.text(context).copyWith(fontSize: 22.0),
              ),
              const Spacer(),
              const SvgIcon(
                icon: ConstIcons.justify,
                color: ConstColor.hintColor,
                size: 18,
              ),
              FxBox.w32,
              InkWell(
                onTap: () {
                  isOpenMenu = !isOpenMenu;
                  setState(() {});
                  if (IngridResponsive.isMobile(context) ||
                      IngridResponsive.isTablet(context)) {
                    showGeneralDialog(
                      context: context,
                      barrierLabel: "Barrier",
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: const Duration(milliseconds: 700),
                      pageBuilder: (_, __, ___) {
                        return Scaffold(
                          backgroundColor: context.isDarkMode
                              ? ConstColor.darkAppBar
                              : ConstColor.white,
                          body: const ToDoDrawer(),
                        );
                      },
                      transitionBuilder: (_, anim, __, child) {
                        Tween<Offset> tween;
                        if (anim.status == AnimationStatus.reverse) {
                          tween = Tween(
                              begin: const Offset(-1, 0), end: Offset.zero);
                        } else {
                          tween = Tween(
                              begin: const Offset(1, 0), end: Offset.zero);
                        }

                        return SlideTransition(
                          position: tween.animate(anim),
                          child: FadeTransition(
                            opacity: anim,
                            child: child,
                          ),
                        );
                      },
                    );
                  }
                },
                child: SvgIcon(
                  icon: ConstIcons.todoMenu,
                  color:
                      isOpenMenu ? ConstColor.blueAccent : ConstColor.hintColor,
                  size: 18,
                ),
              ),
            ],
          ),
          FxBox.h24,
          Align(
            alignment: Alignment.bottomRight,
            child: _dropDown(),
          ),
        ] else ...[
          Row(
            children: [
              Text(
                ConstString.importantTask,
                style: ConstTheme.text(context).copyWith(fontSize: 22.0),
              ),
              const Spacer(),
              _dropDown(),
              FxBox.w32,
              const SvgIcon(
                icon: ConstIcons.justify,
                color: ConstColor.hintColor,
                size: 18,
              ),
              FxBox.w32,
              InkWell(
                onTap: () {
                  isOpenMenu = !isOpenMenu;
                  setState(() {});
                  if (IngridResponsive.isMobile(context) ||
                      IngridResponsive.isTablet(context)) {
                    showGeneralDialog(
                      context: context,
                      barrierLabel: "Barrier",
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: const Duration(milliseconds: 700),
                      pageBuilder: (_, __, ___) {
                        return Scaffold(
                          backgroundColor: context.isDarkMode
                              ? ConstColor.darkAppBar
                              : ConstColor.white,
                          body: const ToDoDrawer(),
                        );
                      },
                      transitionBuilder: (_, anim, __, child) {
                        Tween<Offset> tween;
                        if (anim.status == AnimationStatus.reverse) {
                          tween = Tween(
                              begin: const Offset(-1, 0), end: Offset.zero);
                        } else {
                          tween = Tween(
                              begin: const Offset(1, 0), end: Offset.zero);
                        }

                        return SlideTransition(
                          position: tween.animate(anim),
                          child: FadeTransition(
                            opacity: anim,
                            child: child,
                          ),
                        );
                      },
                    );
                  }
                },
                child: SvgIcon(
                  icon: ConstIcons.todoMenu,
                  color:
                      isOpenMenu ? ConstColor.blueAccent : ConstColor.hintColor,
                  size: 18,
                ),
              ),
              FxBox.w40,
            ],
          ),
        ],
        FxBox.h24,
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.66,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: ToDoData.todotaskList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ToDoCard(
                  todoStatusList: ToDoData.todotaskList[index]['status'],
                  assignUser: ToDoData.todotaskList[index]['assign_user'],
                  date: ToDoData.todotaskList[index]['date'],
                  todotask: ToDoData.todotaskList[index]['task_name'],
                  icCheck: ToDoData.todotaskList[index]['isCheck'],
                ),
              );
            },
          ),
        ),
        FxBox.h(MediaQuery.of(context).size.height * 0.03),
        _bottomFooter(),
      ],
    );
  }

  Widget _bottomFooter() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstText.lightText(
            text: 'Showing ${pageIndex + 1} of 240 data',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xff98A4B5),
          ),
          _button(),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        ],
      ),
    );
  }

  Widget _button() {
    return SizedBox(
      height: 32,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                pageIndex = index;

                setState(() {});
              },
              child: Container(
                height: 32,
                width: 32,
                margin: const EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                  color: pageIndex == index
                      ? ConstColor.blueAccent
                      : Colors.transparent,
                  border: Border.all(color: ConstColor.blueAccent),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                alignment: Alignment.center,
                child: ConstText.lightText(
                  text: '${index + 1}',
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  color: pageIndex != index
                      ? ConstColor.blueAccent
                      : ConstColor.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }),
    );
  }

  Widget _dropDown() {
    return Container(
      height: 44.0,
      width: 119.0,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        border: Border.all(color: ConstColor.hintColor),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<String>(
            items: <String>['Newest'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            elevation: 0,
            value: value,
            underline: FxBox.shrink,
            icon: FxBox.shrink,
            onChanged: (_) {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0),
            child: SvgIcon(
              icon: ConstIcons.arrowDown,
              color: ConstColor.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
