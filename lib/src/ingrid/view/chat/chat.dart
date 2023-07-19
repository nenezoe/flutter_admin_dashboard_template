import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/view/chat/chatList.dart';
import 'package:admin_dashboard/src/ingrid/view/chat/massage.dart';
import 'package:admin_dashboard/src/ingrid/widget/title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final indexNotiFier = ValueNotifier<int>(3);
  final List<Map<String, dynamic>> _friendList = [
    {
      'title': 'Samantha William',
      'isShow': false,
      'count': '2',
    },
    {
      'title': 'Tony Soap',
      'isShow': false,
      'count': '2',
    },
    {
      'title': 'Nadila Adja',
      'isShow': true,
      'count': '0',
    },
    {
      'title': 'Jordan Nico',
      'isShow': false,
      'count': '0',
    },
    {
      'title': 'Karen Hope',
      'isShow': false,
      'count': '0',
    },
    {
      'title': 'Johnny Ahmad',
      'isShow': false,
      'count': '0',
    },
  ];
  final List<List<Map<String, dynamic>>> _msgData = [
    [
      {
        'msg': [
          'Hey, Jon!',
        ],
        'isMe': false,
        'time': '12:45 PM',
      },
      {
        'msg': [
          'Hey, Samantha William!',
          'What’s up?',
        ],
        'isMe': true,
        'time': '12:45 PM',
      },
      {
        'msg': [
          'Can you arrange schedule for next meeting?',
        ],
        'isMe': false,
        'time': '12:45 PM',
      },
    ],
    [
      {
        'msg': [
          'Hey, Jon!',
        ],
        'isMe': false,
        'time': '12:45 PM',
      },
      {
        'msg': [
          'Hey, Tony Soap!',
          'What’s up?',
        ],
        'isMe': true,
        'time': '12:45 PM',
      },
      {
        'msg': [
          'Can you arrange schedule for next meeting?',
        ],
        'isMe': false,
        'time': '12:45 PM',
      },
    ],
    [
      {
        'msg': [
          'Hey, Jon!',
        ],
        'isMe': false,
        'time': '12:45 PM',
      },
      {
        'msg': [
          'Hello, Nadila Adja!',
          'What’s up?',
        ],
        'isMe': true,
        'time': '12:45 PM',
      },
      {
        'msg': [
          'Can you arrange schedule for next meeting?',
        ],
        'isMe': false,
        'time': '12:45 PM',
      },
    ],
    [
      {
        'msg': [
          'Hello Jon!',
        ],
        'isMe': false,
        'time': '12:45 PM',
      },
      {
        'msg': [
          'Hello Jordan Nico',
          'What’s up?',
        ],
        'isMe': true,
        'time': '12:45 PM',
      },
      {
        'msg': [
          'Can you arrange schedule for next meeting?',
        ],
        'isMe': false,
        'time': '12:45 PM',
      },
    ],
    [
      {
        'msg': [
          'Hello Jon!',
        ],
        'isMe': false,
        'time': '12:45 PM',
      },
      {
        'msg': [
          'Hey, Karen Hope!',
          'What’s up?',
        ],
        'isMe': true,
        'time': '12:45 PM',
      },
      {
        'msg': [
          'Can you arrange schedule for next meeting?',
        ],
        'isMe': false,
        'time': '12:45 PM',
      },
    ],
    [
      {
        'msg': [
          'Hey, Jon!',
        ],
        'isMe': false,
        'time': '12:45 PM',
      },
      {
        'msg': [
          'Hello Johnny Ahmad!',
          'What’s up?',
        ],
        'isMe': true,
        'time': '12:45 PM',
      },
      {
        'msg': [
          'Can you arrange schedule for next meeting?',
        ],
        'isMe': false,
        'time': '12:45 PM',
      },
    ]
  ];
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
                IngridResponsive.isMediumWeb(context)) ...[
              ValueListenableBuilder(
                valueListenable: indexNotiFier,
                builder: (context, index, _) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ChatList(
                          friendList: _friendList,
                          onTap: (tapIndex) {
                            indexNotiFier.value = tapIndex;
                            indexNotiFier.value;
                          },
                          tapIndex: indexNotiFier.value,
                        ),
                      ),
                      FxBox.w24,
                      Expanded(
                        flex: 5,
                        child: Massage(
                          msgData: _msgData.elementAt(index),
                          peerName: _friendList.elementAt(index)['title'],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
            if (IngridResponsive.isMobile(context) ||
                IngridResponsive.isTablet(context) ||
                IngridResponsive.isSmallWeb(context)) ...[
              ValueListenableBuilder(
                valueListenable: indexNotiFier,
                builder: (context, index, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(120, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            backgroundColor: ConstColor.primary,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: ChatList(
                                    friendList: _friendList,
                                    onTap: (tapIndex) {
                                      indexNotiFier.value = tapIndex;
                                      indexNotiFier.value;
                                    },
                                    tapIndex: indexNotiFier.value,
                                  ),
                                );
                              },
                            );
                          },
                          label: ConstText.lightText(
                            text: ConstString.message,
                            fontSize: 16,
                            color: ConstColor.white,
                            fontWeight: FontWeight.w500,
                          ),
                          icon: const SvgIcon(
                            icon: ConstIcons.chat,
                            color: ConstColor.white,
                          )),
                      FxBox.h24,
                      Massage(
                        msgData: _msgData.elementAt(index),
                        peerName: _friendList.elementAt(index)['title'],
                      ),
                    ],
                  );
                },
              ),
            ],
            SafeArea(child: FxBox.h24),
          ],
        ),
      ),
    );
  }
}
