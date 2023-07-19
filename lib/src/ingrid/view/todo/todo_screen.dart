import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/view/todo/todo_drawer.dart';
import 'package:admin_dashboard/src/ingrid/view/todo/todo_list.dart';
import 'package:admin_dashboard/src/ingrid/widget/title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FxBox.h24,
            const RouteTitle(),
            FxBox.h24,
            if (IngridResponsive.isLargeWeb(context) ||
                IngridResponsive.isMediumWeb(context) ||
                IngridResponsive.isSmallWeb(context)) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 2,
                    child: ToDoDrawer(),
                  ),
                  FxBox.w24,
                  const Expanded(
                    flex: 6,
                    child: ToDoList(),
                  ),
                ],
              ),
            ] else ...[
              const ToDoList()
            ],
          ],
        ),
      ),
    );
  }
}
