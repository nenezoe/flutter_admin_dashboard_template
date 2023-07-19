import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/view/email/email_card.dart';
import 'package:admin_dashboard/src/ingrid/view/email/email_data.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class EmailViewList extends StatefulWidget {
  const EmailViewList({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  State<EmailViewList> createState() => _EmailViewListState();
}

class _EmailViewListState extends State<EmailViewList> {
  int pageIndex = 0;
  int emailViewTap = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: ListView.separated(
                addAutomaticKeepAlives: true,
                padding: EdgeInsets.zero,
                itemCount: EmailData.emailData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      emailViewTap = index;
                      setState(() {});
                      widget.onPressed!();
                    },
                    child: EmailCard(
                      senderName: EmailData.emailData[index]['sender_name'],
                      mailTitle: EmailData.emailData[index]['mail_title'],
                      mailDes: EmailData.emailData[index]['mail_des'],
                      receiveTime: EmailData.emailData[index]['receive_time'],
                      isFavourite: EmailData.emailData[index]['isFavourite'],
                      isImportant: EmailData.emailData[index]['isImporatant'],
                      isTap: emailViewTap == index,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    color: ConstColor.hintColor,
                  );
                },
              ),
            ),
            FxBox.h10,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.095,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Showing ${pageIndex + 1} of 240 data',
                    style: ConstTheme.text(context)
                        .copyWith(color: ConstColor.hintColor),
                  ),
                  _button(),
                  FxBox.shrink,
                ],
              ),
            ),
          ],
        ),
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
                height: 30,
                width: 30,
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
}
