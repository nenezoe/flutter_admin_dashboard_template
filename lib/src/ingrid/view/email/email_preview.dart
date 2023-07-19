import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class EmailPreview extends StatefulWidget {
  const EmailPreview({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  State<EmailPreview> createState() => _EmailPreviewState();
}

class _EmailPreviewState extends State<EmailPreview> {
  String mailText = 'Hi John!\n'
      '\n'
      'Lorem ipsum dolor sit amet, consectetuer\n'
      'adipiscing elit. Aenean commodo ligula eget\n'
      'dolor.\n'
      '\n'
      'Regard,\n'
      'Karen';
  final TextEditingController _emailText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      color: context.theme.cardColor,
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  ConstString.preview,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: context.isDarkMode
                        ? Colors.white
                        : ConstColor.lightTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const SvgIcon(
                  icon: ConstIcons.fullScreen,
                  size: 18.0,
                  color: ConstColor.hintColor,
                ),
                FxBox.w20,
                const SvgIcon(
                  icon: ConstIcons.printer,
                  size: 18.0,
                  color: ConstColor.hintColor,
                ),
                FxBox.w20,
                InkWell(
                  onTap: () {
                    if (IngridResponsive.isMobile(context) ||
                        IngridResponsive.isTablet(context) ||
                        IngridResponsive.isSmallWeb(context) ||
                        IngridResponsive.isMediumWeb(context)) {
                      Navigator.pop(context);
                    }
                    widget.onTap!();
                  },
                  child: const SvgIcon(
                    icon: ConstIcons.close,
                    size: 18.0,
                    color: ConstColor.hintColor,
                  ),
                ),
              ],
            ),
            FxBox.h8,
            Text(
              ConstString.inbox,
              style: ConstTheme.text(context)
                  .copyWith(color: ConstColor.hintColor),
            ),
            FxBox.h28,
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ConstColor.yellow,
                minimumSize: const Size(140.0, 34.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              label: Text(
                ConstString.important,
                style: ConstTheme.text(context).copyWith(
                  color: ConstColor.white,
                ),
              ),
              icon: const SvgIcon(
                icon: ConstIcons.important,
                color: ConstColor.white,
              ),
            ),
            FxBox.h12,
            Text(
              'Meeting Schedule Weekly',
              style: ConstTheme.title(context),
            ),
            FxBox.h8,
            Text(
              '2 hour ago',
              style: ConstTheme.text(context).copyWith(
                color: ConstColor.hintColor,
              ),
            ),
            FxBox.h12,
            const Divider(
              color: ConstColor.hintColor,
            ),
            FxBox.h12,
            Row(
              children: [
                Container(
                  height: 32.0,
                  width: 32.0,
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
                FxBox.w8,
                Text(
                  'Karen Hope',
                  style: ConstTheme.title(context).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            FxBox.h24,
            Text(
              mailText,
              style: ConstTheme.text(context),
            ),
            FxBox.h20,
            Container(
              height: 200.0,
              width: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: ConstColor.hintColor,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, top: 16.0, right: 18.0),
                    child: TextField(
                      controller: _emailText,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: ConstString.writeYourMessage,
                      ),
                    ),
                  ),
                  const Divider(
                    color: ConstColor.hintColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SvgIcon(
                        icon: ConstIcons.link,
                        size: 14.0,
                        color: ConstColor.hintColor,
                      ),
                      SvgIcon(
                        icon: ConstIcons.bold,
                        size: 14.0,
                        color: ConstColor.hintColor,
                      ),
                      SvgIcon(
                        icon: ConstIcons.italic,
                        size: 14.0,
                        color: ConstColor.hintColor,
                      ),
                      SvgIcon(
                        icon: ConstIcons.underline,
                        size: 14.0,
                        color: ConstColor.hintColor,
                      ),
                      SvgIcon(
                        icon: ConstIcons.centerAlign,
                        size: 14.0,
                        color: ConstColor.hintColor,
                      ),
                      SvgIcon(
                        icon: ConstIcons.rightAlign,
                        size: 14.0,
                        color: ConstColor.hintColor,
                      ),
                      SvgIcon(
                        icon: ConstIcons.leftAlign,
                        size: 14.0,
                        color: ConstColor.hintColor,
                      ),
                      SvgIcon(
                        icon: ConstIcons.justify,
                        size: 14.0,
                        color: ConstColor.hintColor,
                      ),
                      SvgIcon(
                        icon: ConstIcons.menu,
                        size: 14.0,
                        color: ConstColor.hintColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FxBox.h16,
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {},
                height: 38.0,
                minWidth: 100.0,
                color: ConstColor.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Text(
                  ConstString.send,
                  style: ConstTheme.text(context)
                      .copyWith(color: ConstColor.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
