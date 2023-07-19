import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/view/calender/add_new_schedule.dart';
import 'package:admin_dashboard/src/ingrid/view/calender/calender_view.dart';
import 'package:admin_dashboard/src/ingrid/widget/title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class InGridCalendar extends StatefulWidget {
  const InGridCalendar({Key? key}) : super(key: key);

  @override
  State<InGridCalendar> createState() => _InGridCalendarState();
}

class _InGridCalendarState extends State<InGridCalendar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxBox.h24,
            const RouteTitle(),
            FxBox.h28,
            IngridResponsive.isMobile(context) ||
                    IngridResponsive.isTablet(context) ||
                    IngridResponsive.isSmallWeb(context)
                ? Column(
                    children: [
                      const AddNewSchedule(),
                      FxBox.h20,
                      const CalenderView(),
                    ],
                  )
                : Row(
                    children: [
                      const Expanded(flex: 2, child: AddNewSchedule()),
                      FxBox.w20,
                      const Expanded(
                        flex: 6,
                        child: CalenderView(),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
