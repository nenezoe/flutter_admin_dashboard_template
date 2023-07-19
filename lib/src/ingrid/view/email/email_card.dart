import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class EmailCard extends StatefulWidget {
  EmailCard({
    super.key,
    required this.senderName,
    required this.mailTitle,
    required this.mailDes,
    required this.receiveTime,
    required this.isFavourite,
    required this.isImportant,
    required this.isTap,
  });
  final String senderName;
  final String mailTitle;
  final String mailDes;
  final String receiveTime;
  bool isFavourite;
  bool isImportant;
  final bool isTap;

  @override
  State<EmailCard> createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        constraints: const BoxConstraints(maxWidth: 730),
        child: Row(
          children: [
            widget.isTap
                ? Container(
                    width: 12.0,
                    height: 104.0,
                    color: ConstColor.blueAccent,
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 4.0, top: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      checkColor: ConstColor.white,
                      activeColor: ConstColor.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      value: checkedValue,
                      onChanged: (value) {
                        checkedValue = value!;
                        setState(() {});
                      },
                    ),
                    FxBox.w16,
                    Container(
                      height: 46.0,
                      width: 46.0,
                      decoration: BoxDecoration(
                        color: ConstColor.hintColor,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          Images.profileImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    FxBox.w16,
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.senderName,
                                style: ConstTheme.text(context)
                                    .copyWith(color: ConstColor.hintColor),
                              ),
                              FxBox.w8,
                              InkWell(
                                onTap: () {
                                  widget.isImportant = !widget.isImportant;
                                  setState(() {});
                                },
                                child: SvgIcon(
                                  icon: widget.isImportant
                                      ? ConstIcons.importantYellow
                                      : ConstIcons.important,
                                  color: widget.isImportant
                                      ? ConstColor.yellow
                                      : ConstColor.hintColor,
                                ),
                              )
                            ],
                          ),
                          FxBox.h8,
                          Text(
                            widget.mailTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: ConstTheme.title(context),
                          ),
                          FxBox.h8,
                          Expanded(
                            child: Text(
                              widget.mailDes,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: ConstTheme.text(context)
                                  .copyWith(color: ConstColor.hintColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.receiveTime,
                          style: ConstTheme.text(context)
                              .copyWith(color: ConstColor.hintColor),
                        ),
                        //FxBox.h20,
                        InkWell(
                          onTap: () {
                            widget.isFavourite = !widget.isFavourite;
                            setState(() {});
                          },
                          child: SvgIcon(
                            icon: ConstIcons.favourite,
                            color: widget.isFavourite
                                ? ConstColor.yellow
                                : ConstColor.hintColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
