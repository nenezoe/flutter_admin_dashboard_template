import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/widget/button.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/stack_user_row.dart';
import 'package:admin_dashboard/src/ingrid/widget/title.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

import 'kanban_list.dart';

List<String> _title = [
  ConstString.toDo,
  ConstString.workInProgress,
  ConstString.underReview,
  ConstString.onHold,
  ConstString.done,
  ConstString.revised,
  ConstString.rejected,
];

List<Map<String, dynamic>> _toDoData = [
  {
    'title': 'Usability testing to user at Meeting Room',
    'userCount': 3,
    'teamType': TeamType.productTeam,
  },
  {
    'title': 'Create Landing Page',
    'userCount': 2,
    'teamType': TeamType.developerTeam,
  },
  {
    'title': 'Create Logo',
    'userCount': 1,
    'teamType': TeamType.designTeam,
  },
];

List<Map<String, dynamic>> _workData = [
  {
    'title': 'Research',
    'userCount': 2,
    'teamType': TeamType.productTeam,
  },
  {
    'title': 'Create Moodboard',
    'userCount': 2,
    'teamType': TeamType.designTeam,
  },
];

List<Map<String, dynamic>> _reviewData = [
  {
    'title': 'Input Database',
    'userCount': 2,
    'teamType': TeamType.developerTeam,
  },
];
List<Map<String, dynamic>> _onHold = [];

List<Map<String, dynamic>> _doneData = [
  {
    'title': 'Create Database',
    'userCount': 1,
    'teamType': TeamType.developerTeam,
  },
  {
    'title': 'A/B Testing',
    'userCount': 2,
    'teamType': TeamType.productTeam,
  },
];

List<Map<String, dynamic>> _revisedData = [
  {
    'title': 'Issues Report',
    'userCount': 2,
    'teamType': TeamType.productTeam,
  },
];

List<Map<String, dynamic>> _rejectedList = [];

bool isAccepted = false;

@RoutePage()
class Kanban extends StatefulWidget {
  const Kanban({super.key});

  @override
  State<Kanban> createState() => _KanbanState();
}

class _KanbanState extends State<Kanban> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxBox.h24,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: RouteTitle(),
          ),
          FxBox.h24,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: IngridCard(
              child: IngridResponsive.isMobile(context) ||
                      IngridResponsive.isTablet(context)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Mystery Food X',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: ConstTheme.title(context)
                              .copyWith(fontSize: 24.0),
                        ),
                        FxBox.h16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SvgIcon(
                              icon: ConstIcons.menu,
                              color: ConstColor.hintColor,
                            ),
                            FxBox.w16,
                            const StackedUserRow(itemCount: 4),
                            FxBox.w16,
                            if (IngridResponsive.isTablet(context))
                              const IngridButton(
                                text: 'Invite',
                                size: Size(128.0, 40.0),
                              ),
                            if (IngridResponsive.isMobile(context))
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add_rounded),
                                style: IconButton.styleFrom(
                                  backgroundColor: ConstColor.primary,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Product Mystery Food X',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: ConstTheme.title(context)
                                .copyWith(fontSize: 24.0),
                          ),
                        ),
                        const SvgIcon(
                          icon: ConstIcons.menu,
                          color: ConstColor.hintColor,
                        ),
                        FxBox.w40,
                        Stack(
                          children: [
                            const StackedUserRow(itemCount: 4),
                            Positioned(
                              right: 0.0,
                              child: Container(
                                height: 48.0,
                                width: 48.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: ConstColor.primary,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: const Text(
                                  '5+',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        FxBox.w40,
                        const IngridButton(
                          text: 'Invite',
                          size: Size(128.0, 40.0),
                        ),
                      ],
                    ),
            ),
          ),
          FxBox.h24,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxBox.w24,
                Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: DragTarget(
                    onLeave: (data) {
                      removeDataFromOldList(data as Map<String, dynamic>);
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      Map<String, dynamic> newMap =
                          data as Map<String, dynamic>;

                      isAccepted = true;
                      removeDataFromOldList(newMap);
                      _toDoData.add(newMap);

                      setState(() {});
                    },
                    builder: (context, candidateData, rejectedData) =>
                        KanbanList(
                      title: _title[0],
                      data: _toDoData,
                      listValue: _toDoData,
                    ),
                  ),
                ),
                FxBox.w40,
                Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  // height: MediaQuery.of(context).size.height,
                  child: DragTarget(
                    onLeave: (data) {
                      removeDataFromOldList(data as Map<String, dynamic>);
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      Map<String, dynamic> newMap =
                          data as Map<String, dynamic>;

                      isAccepted = true;
                      removeDataFromOldList(newMap);
                      _workData.add(newMap);

                      setState(() {});
                    },
                    builder: (context, candidateData, rejectedData) =>
                        KanbanList(
                      title: _title[1],
                      data: _workData,
                      listValue: _workData,
                    ),
                  ),
                ),
                FxBox.w40,
                Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: DragTarget(
                    onLeave: (data) {
                      removeDataFromOldList(data as Map<String, dynamic>);
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      Map<String, dynamic> newMap =
                          data as Map<String, dynamic>;

                      isAccepted = true;
                      removeDataFromOldList(newMap);
                      _reviewData.add(newMap);

                      setState(() {});
                    },
                    builder: (context, candidateData, rejectedData) =>
                        KanbanList(
                      title: _title[2],
                      data: _reviewData,
                      listValue: _reviewData,
                    ),
                  ),
                ),
                FxBox.w40,
                Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: DragTarget(
                    onLeave: (data) {
                      removeDataFromOldList(data as Map<String, dynamic>);
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      Map<String, dynamic> newMap =
                          data as Map<String, dynamic>;

                      isAccepted = true;
                      removeDataFromOldList(newMap);
                      _onHold.add(newMap);

                      setState(() {});
                    },
                    builder: (context, candidateData, rejectedData) =>
                        KanbanList(
                      title: _title[3],
                      data: _onHold,
                      listValue: _onHold,
                    ),
                  ),
                ),
                FxBox.w40,
                Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: DragTarget(
                    onLeave: (data) {
                      removeDataFromOldList(data as Map<String, dynamic>);
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      Map<String, dynamic> newMap =
                          data as Map<String, dynamic>;

                      isAccepted = true;
                      removeDataFromOldList(newMap);
                      _doneData.add(newMap);
                      setState(() {});
                    },
                    builder: (context, candidateData, rejectedData) =>
                        KanbanList(
                      title: _title[4],
                      data: _doneData,
                      listValue: _doneData,
                    ),
                  ),
                ),
                FxBox.w40,
                Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: DragTarget(
                    onLeave: (data) {
                      removeDataFromOldList(data as Map<String, dynamic>);
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      Map<String, dynamic> newMap =
                          data as Map<String, dynamic>;

                      isAccepted = true;
                      removeDataFromOldList(newMap);
                      _revisedData.add(newMap);
                      setState(() {});
                    },
                    builder: (context, candidateData, rejectedData) =>
                        KanbanList(
                      title: _title[5],
                      data: _revisedData,
                      listValue: _reviewData,
                    ),
                  ),
                ),
                FxBox.w40,
                Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: DragTarget(
                    onLeave: (data) {
                      removeDataFromOldList(data as Map<String, dynamic>);
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      Map<String, dynamic> newMap =
                          data as Map<String, dynamic>;

                      isAccepted = true;
                      removeDataFromOldList(newMap);
                      _rejectedList.add(newMap);
                      setState(() {});
                    },
                    builder: (context, candidateData, rejectedData) =>
                        KanbanList(
                      title: _title[6],
                      data: _rejectedList,
                      listValue: _rejectedList,
                    ),
                  ),
                ),
                FxBox.w24,
              ],
            ),
          ),
          SafeArea(child: FxBox.h24),
        ],
      ),
    );
  }

  void removeDataFromOldList(Map<String, dynamic> data) {
    if (_toDoData.contains(data) && isAccepted) {
      _toDoData.remove(data);
    } else if (_workData.contains(data) && isAccepted) {
      _workData.remove(data);
    } else if (_reviewData.contains(data) && isAccepted) {
      _reviewData.remove(data);
    } else if (_onHold.contains(data) && isAccepted) {
      _onHold.remove(data);
    } else if (_doneData.contains(data) && isAccepted) {
      _doneData.remove(data);
    } else if (_revisedData.contains(data) && isAccepted) {
      _revisedData.remove(data);
    } else if (_rejectedList.contains(data) && isAccepted) {
      _rejectedList.remove(data);
    }
  }
}
