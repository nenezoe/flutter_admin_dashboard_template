import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ChatList extends StatefulWidget {
  const ChatList({
    super.key,
    required this.friendList,
    required this.onTap,
    required this.tapIndex,
  });
  final List<Map<String, dynamic>> friendList;
  final ValueChanged<int> onTap;
  final int tapIndex;

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return IngridCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    ConstString.message,
                    style: ConstTheme.title(context),
                  ),
                ),
                const SvgIcon(
                  icon: ConstIcons.menu,
                  color: ConstColor.hintColor,
                ),
              ],
            ),
          ),
          FxBox.h16,
          _searchTextField(),
          FxBox.h16,
          _friendBox(),
          FxBox.h16,
        ],
      ),
    );
  }

  Widget _friendBox() {
    return ListView.separated(
      itemCount: widget.friendList.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            widget.onTap(index);
            if (IngridResponsive.isMobile(context) ||
                IngridResponsive.isTablet(context) ||
                IngridResponsive.isSmallWeb(context)) {
              Navigator.pop(context);
            }
          },
          child: ChatListTile(
            title: widget.friendList[index]['title'],
            countMsg: widget.friendList[index]['count'],
            isShow: widget.friendList[index]['isShow'],
            tapColor: widget.tapIndex == index
                ? context.isDarkMode
                    ? ConstColor.darkFillColor
                    : ConstColor.lightBackgroundColor
                : context.theme.cardColor,
            isTap: widget.tapIndex == index,
          ),
        );
      },
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Divider(
          // height: 36.0,
          thickness: 1.0,
        ),
      ),
    );
  }

  Widget _searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        height: 48,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: context.isDarkMode
                ? ConstColor.darkFillColor
                : ConstColor.lightFillColor,
            hintText: 'Search...',
            prefixIcon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: SvgIcon(
                icon: ConstIcons.search,
                color: ConstColor.hintColor,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
    required this.title,
    required this.countMsg,
    required this.isShow,
    required this.tapColor,
    this.isTap = false,
  });

  final String title;
  final String countMsg;
  final bool isShow;
  final Color tapColor;
  final bool isTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: tapColor,
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: tapColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30.0,
                  width: 30.0,
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
                FxBox.w16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: ConstTheme.title(context)
                                  .copyWith(fontSize: 16.0),
                            ),
                          ),
                          if (!IngridResponsive.isMediumWeb(context)) ...[
                            const Spacer(),
                            Expanded(
                              child: Text(
                                '12:45 PM',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: ConstTheme.hintText,
                              ),
                            ),
                          ],
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetuer Aenean commodo ligula eget dolor. ',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  ConstTheme.hintText.copyWith(fontSize: 12.0),
                            ),
                          ),
                          FxBox.w24,
                          if (!isTap) ...[
                            countMsg != '0'
                                ? Container(
                                    height: 24.0,
                                    width: 24.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: ConstColor.redAccent,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Text(
                                      countMsg,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: ConstTheme.hintText.copyWith(
                                        color: ConstColor.darkAppBar,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgIcon(
                                      icon: ConstIcons.read,
                                      color: isShow
                                          ? ConstColor.primary
                                          : ConstColor.hintColor,
                                    ),
                                  ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: tapColor,
          height: 10.0,
        ),
      ],
    );
  }
}
