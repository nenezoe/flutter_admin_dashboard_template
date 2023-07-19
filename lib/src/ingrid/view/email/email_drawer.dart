import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/view/email/email_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';

class EmailDrawer extends StatefulWidget {
  const EmailDrawer({super.key, this.onPressed});

  final void Function()? onPressed;
  @override
  State<EmailDrawer> createState() => _EmailDrawerState();
}

class _EmailDrawerState extends State<EmailDrawer> {
  int tapIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: ConstColor.lightGray),
        ),
      ),
      child: Column(
        children: [
          _newEmailButton(),
          FxBox.h40,
          Expanded(
            child: ListView.separated(
              itemCount: EmailData.emailDrawerList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    tapIndex = index;
                    setState(() {});
                    if (IngridResponsive.isMobile(context) ||
                        IngridResponsive.isTablet(context) ||
                        IngridResponsive.isSmallWeb(context)) {
                      Navigator.pop(context);
                    }
                  },
                  leading: SvgPicture.asset(
                    EmailData.emailDrawerList[index]['folder_icon'],
                    color: tapIndex == index
                        ? ConstColor.blueAccent
                        : ConstColor.hintColor,
                  ),
                  title: Text(
                    EmailData.emailDrawerList[index]['folder_name'],
                    style: ConstTheme.title(context).copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: tapIndex == index
                          ? ConstColor.blueAccent
                          : ConstColor.hintColor,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return FxBox.h20;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _newEmailButton() {
    return MaterialButton(
      onPressed: widget.onPressed,
      color: ConstColor.blueAccent,
      height: 50.0,
      minWidth: 197.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        ConstString.newEmail,
        style: ConstTheme.title(context).copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: ConstColor.white),
      ),
    );
  }
}
