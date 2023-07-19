import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/widget/button.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/stack_user_row.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

enum TeamType { productTeam, developerTeam, designTeam }

class KanbanList extends StatefulWidget {
  const KanbanList(
      {super.key, required this.title, required this.data, this.listValue});

  final String title;
  final List data;
  final List<Map<String, dynamic>>? listValue;

  @override
  State<KanbanList> createState() => _KanbanListState();
}

class _KanbanListState extends State<KanbanList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 288.0,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(widget.title, style: ConstTheme.title(context))),
              GestureDetector(
                onTap: () {
                  widget.listValue?.add(
                    {
                      'title': 'Usability testing to user at Meeting Room',
                      'userCount': 3,
                      'teamType': TeamType.productTeam,
                    },
                  );
                  setState(() {});
                },
                child: const SvgIcon(
                  icon: ConstIcons.plus,
                  color: ConstColor.primary,
                ),
              ),
            ],
          ),
          FxBox.h16,
          widget.data.isEmpty
              ? IngridCard(
                  height: 250,
                  width: 250,
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Recors Found!',
                        style: ConstTheme.text(context),
                      )
                    ],
                  ),
                )
              : ListView.separated(
                  itemCount: widget.data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Draggable(
                      data: widget.data[index],
                      feedback: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(12.0),
                        child: IngridCard(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.data[index]['teamType'] ==
                                  TeamType.productTeam)
                                StatusButton.product(),
                              if (widget.data[index]['teamType'] ==
                                  TeamType.developerTeam)
                                StatusButton.developer(),
                              if (widget.data[index]['teamType'] ==
                                  TeamType.designTeam)
                                StatusButton.design(),
                              FxBox.h16,
                              Text(
                                widget.data[index]['title'],
                                style: ConstTheme.text(context).copyWith(
                                  fontSize: 18.0,
                                ),
                              ),
                              FxBox.h16,
                              Text(
                                '2 March 2023,  12:30 PM',
                                style: ConstTheme.hintText,
                              ),
                              FxBox.h16,
                              StackedUserRow(
                                  itemCount: widget.data[index]['userCount']),
                            ],
                          ),
                        ),
                      ),
                      child: IngridCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.data[index]['teamType'] ==
                                TeamType.productTeam)
                              StatusButton.product(),
                            if (widget.data[index]['teamType'] ==
                                TeamType.developerTeam)
                              StatusButton.developer(),
                            if (widget.data[index]['teamType'] ==
                                TeamType.designTeam)
                              StatusButton.design(),
                            FxBox.h16,
                            Text(
                              widget.data[index]['title'],
                              style: ConstTheme.text(context)
                                  .copyWith(fontSize: 18.0),
                            ),
                            FxBox.h16,
                            Text(
                              '2 March 2023,  12:30 PM',
                              style: ConstTheme.hintText,
                            ),
                            FxBox.h16,
                            StackedUserRow(
                                itemCount: widget.data[index]['userCount']),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => FxBox.h24,
                ),
        ],
      ),
    );
  }
}
