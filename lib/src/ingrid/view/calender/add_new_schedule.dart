import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class AddNewSchedule extends StatefulWidget {
  const AddNewSchedule({super.key});

  @override
  State<AddNewSchedule> createState() => _AddNewScheduleState();
}

class _AddNewScheduleState extends State<AddNewSchedule> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: context.isDarkMode ? ConstColor.darkAppBar : ConstColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _addScheduleButton(),
          FxBox.h28,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ConstText.lightText(
              text: 'Upcoming Schedule',
              color: ConstColor.grey,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          FxBox.h20,
          _upcomingSchedule(
            headerText: 'Daily Meeting',
            timeText: '09.00 - 10.00 AM',
            textFirst: 'Urgent',
            textColorFirst: ConstColor.redAccent,
            textSecond: 'Daily',
            textColorSecond: const Color(0xff01A2FD),
          ),
          _divider(),
          FxBox.h20,
          _upcomingSchedule(
            headerText: 'Maintenance',
            timeText: '09.00 - 10.00 AM',
            textFirst: 'Engineering',
            textColorFirst: ConstColor.yellow,
          ),
          _divider(),
          FxBox.h20,
          _upcomingSchedule(
            headerText: 'Research',
            timeText: '09.00 - 10.00 AM',
            textFirst: 'UX Design',
            textColorFirst: ConstColor.lightwhite,
          ),
          _moreSchedule(),
          FxBox.h20,
        ],
      ),
    );
  }

  Widget _moreSchedule() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Align(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {},
          child: ConstText.lightText(
            text: ConstString.moreSchedule,
            color: ConstColor.primary,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _addScheduleButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
      child: Align(
        alignment: Alignment.center,
        child: MaterialButton(
          onPressed: () {},
          minWidth: 255,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          height: 55,
          color: ConstColor.primary,
          child: ConstText.lightText(
            text: ConstString.newSchedule,
            color: ConstColor.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _upcomingSchedule({
    required String headerText,
    required String timeText,
    required String textFirst,
    String? textSecond,
    required Color textColorFirst,
    Color? textColorSecond,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstText.lightText(
            text: headerText,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          FxBox.h10,
          ConstText.lightText(
            text: timeText,
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          FxBox.h16,
          IngridResponsive.isMediumWeb(context)
              ? Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: textColorFirst.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ConstText.lightText(
                        text: textFirst,
                        color: textColorFirst,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (textSecond != null) ...[
                      FxBox.h16,
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: textColorSecond!.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ConstText.lightText(
                          text: textSecond,
                          color: textColorSecond,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                )
              : Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: textColorFirst.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ConstText.lightText(
                        text: textFirst,
                        color: textColorFirst,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (textSecond != null) ...[
                      FxBox.w16,
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: textColorSecond!.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ConstText.lightText(
                          text: textSecond,
                          color: textColorSecond,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
          FxBox.h24,
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      color: Color(0xffDDDDDD),
    );
  }
}
