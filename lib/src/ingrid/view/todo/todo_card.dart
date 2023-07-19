import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/custom_checkbox.dart';
import 'package:admin_dashboard/src/ingrid/widget/stack_user_row.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ToDoCard extends StatefulWidget {
  const ToDoCard({
    super.key,
    required this.todoStatusList,
    required this.date,
    required this.todotask,
    required this.assignUser,
    required this.icCheck,
  });
  final List<String> todoStatusList;
  final String date;
  final String todotask;
  final int assignUser;
  final bool icCheck;

  @override
  State<ToDoCard> createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  @override
  Widget build(BuildContext context) {
    return IngridCard(
      height: MediaQuery.of(context).size.height * 0.11,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomCheckbox(
                    isCheck: widget.icCheck,
                  ),
                  FxBox.w60,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.date,
                        style: ConstTheme.text(context).copyWith(
                          color: ConstColor.hintColor,
                        ),
                      ),
                      Text(
                        widget.todotask,
                        style: ConstTheme.text(context),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 44.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.todoStatusList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: _statusBox(
                            boxColor:
                                _colorDecide(widget.todoStatusList[index]),
                            status: widget.todoStatusList[index],
                          ),
                        );
                      },
                    ),
                  ),
                  FxBox.w20,
                  StackedUserRow(itemCount: widget.assignUser),
                  FxBox.w20,
                  const SvgIcon(
                    icon: ConstIcons.menu,
                    color: ConstColor.hintColor,
                    size: 32.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _colorDecide(String status) {
    if (status == ConstString.high || status == ConstString.urgent) {
      return ConstColor.redAccent;
    } else if (status == ConstString.low || status == ConstString.team) {
      return ConstColor.blueAccent;
    } else if (status == ConstString.important) {
      return ConstColor.yellow;
    } else {
      return ConstColor.blueAccent;
    }
  }

  Widget _statusBox({
    required String status,
    required Color boxColor,
  }) {
    return Container(
      width: 100.0,
      height: 44.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: boxColor.withOpacity(0.25),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        status,
        style: ConstTheme.text(context).copyWith(color: boxColor),
      ),
    );
  }
}
