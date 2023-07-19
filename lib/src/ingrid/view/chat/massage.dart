import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:intl/intl.dart';

class Massage extends StatefulWidget {
  const Massage({
    super.key,
    required this.msgData,
    required this.peerName,
  });
  final List<Map<String, dynamic>> msgData;
  final String peerName;

  @override
  State<Massage> createState() => _MassageState();
}

class _MassageState extends State<Massage> {
  final TextEditingController _msgController = TextEditingController();

  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.84,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: context.theme.cardColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _header(),
          const Divider(height: 36.0, thickness: 1.0),
          _msgView(),
          _sendMsgAction(),
        ],
      ),
    );
  }

  Widget _msgView() {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.33,
      child: ListView.builder(
        itemCount: widget.msgData.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.msgData[index]['msg'].length,
              shrinkWrap: true,
              itemBuilder: (context, msgIndex) {
                return _msgBox(
                  isMe: widget.msgData[index]['isMe'],
                  msg: widget.msgData[index]['msg'][msgIndex],
                  time: widget.msgData[index]['msg'].length - 1 == msgIndex
                      ? widget.msgData[index]['time']
                      : '',
                );
              });
        },
      ),
    );
  }

  Widget _msgBox({
    required String msg,
    required bool isMe,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              color: isMe ? ConstColor.primary : ConstColor.lightwhite,
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(12.0),
                bottomRight: Radius.circular(isMe ? 0.0 : 12.0),
                topLeft: Radius.circular(isMe ? 12.0 : 0.0),
                topRight: const Radius.circular(12.0),
              ),
            ),
            child: Text(
              msg,
              style: ConstTheme.text(context).copyWith(
                  color: isMe ? ConstColor.white : ConstColor.darkFillColor),
            ),
          ),
          time.isEmpty ? FxBox.shrink : FxBox.h10,
          Text(
            time,
            style:
                ConstTheme.text(context).copyWith(color: ConstColor.hintColor),
          ),
        ],
      ),
    );
  }

  Widget _sendMsgAction() {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(24.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: ConstColor.hintColor),
        color: context.isDarkMode
            ? ConstColor.darkFillColor
            : ConstColor.lightFillColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _msgController,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                hintText: 'Write your message...',
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          const SvgIcon(
            icon: ConstIcons.link,
            color: ConstColor.hintColor,
          ),
          FxBox.w24,
          _sendButton(),
        ],
      ),
    );
  }

  Widget _sendButton() {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      onPressed: () {
        widget.msgData.last['time'] ==
                DateFormat('h:mm a').format(DateTime.now())
            ? widget.msgData.last['msg'].add(_msgController.text.trim())
            : widget.msgData.add({
                'msg': [
                  _msgController.text.trim(),
                ],
                'isMe': true,
                'time': DateFormat('h:mm a').format(DateTime.now()),
              });
        setState(() {});
        _msgController.clear();
      },
      color: ConstColor.primary,
      height: 42.0,
      minWidth: 120.0,
      child: Row(
        children: [
          Text(
            ConstString.send,
            style: TextStyle(
              color:
                  context.isDarkMode ? ConstColor.darkAppBar : ConstColor.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          FxBox.w20,
          SvgIcon(
            icon: ConstIcons.send,
            color:
                context.isDarkMode ? ConstColor.darkAppBar : ConstColor.white,
          )
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Container(
            height: 64.0,
            width: 64.0,
            decoration: BoxDecoration(
              color: ConstColor.hintColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(
                Images.profileImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          FxBox.w32,
          _nameAndStatus(),
          const Spacer(),
          _actionButton(),
        ],
      ),
    );
  }

  Widget _actionButton() {
    return Row(
      children: [
        const SvgIcon(
          icon: ConstIcons.phone,
          size: 24,
          color: ConstColor.hintColor,
        ),
        FxBox.w28,
        const SvgIcon(
          icon: ConstIcons.videoCall,
          size: 24,
          color: ConstColor.hintColor,
        ),
        FxBox.w28,
        const SvgIcon(
          icon: ConstIcons.menu,
          size: 24,
          color: ConstColor.hintColor,
        )
      ],
    );
  }

  Widget _nameAndStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.peerName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: ConstTheme.title(context).copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 6.0,
              width: 6.0,
              decoration: const BoxDecoration(
                  color: ConstColor.primary, shape: BoxShape.circle),
            ),
            FxBox.w8,
            Text(
              'Online',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: ConstTheme.text(context).copyWith(),
            ),
          ],
        ),
      ],
    );
  }
}
