import 'dart:async';
import 'dart:math';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  TextEditingController eventController = TextEditingController();

  PageController? newpageController;

  double currentMonthPageIndex = 0.0;

  int tapIndex = 1;

  late Map<DateTime, List<Map<String, dynamic>>> eventMap = {
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {
        'eventName': 'Daily meeting',
        'Boxcolor': ConstColor.redAccent,
      }
    ],
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {
        'eventName': 'Day Off',
        'Boxcolor': ConstColor.primary,
      }
    ],
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {
        'eventName': 'Usability Testing',
        'Boxcolor': ConstColor.lightwhite,
      }
    ],
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {
        'eventName': 'Research',
        'Boxcolor': ConstColor.primary,
      }
    ],
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {
        'eventName': 'Server Maintenance',
        'Boxcolor': ConstColor.yellow,
      }
    ],
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {
        'eventName': 'Weekly meeting',
        'Boxcolor': ConstColor.redAccent,
      }
    ],
  };
  final List<String> _calenderList = ['Daily', 'Month', 'Year'];

  CalendarFormat _calendarFormat = CalendarFormat.month;

  String creatRandomDate({required bool currentmonth}) {
    DateTime date = DateTime(
        DateTime.now().year, DateTime.now().month + (currentmonth ? 1 : 2), 0);
    int rng = Random().nextInt(date.day);

    if (rng == 0) {
      rng = rng + 1;
    }
    String month = DateTime.now().month <= 9
        ? '0${DateTime.now().month}'
        : (DateTime.now().month + (currentmonth ? 0 : 1)).toString();
    String day = rng <= 9 ? '0$rng' : rng.toString();
    return DateTime.parse('${DateTime.now().year}-$month-$day')
        .toString()
        .split(" ")[0];
  }

  List<String> months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    newpageController!.dispose();
    eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.isDarkMode ? ConstColor.darkAppBar : ConstColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TableCalendar(
          onCalendarCreated: (pageController) async {
            newpageController = pageController;
            await Future.delayed(const Duration(seconds: 2));
            currentMonthPageIndex == 0.0
                ? currentMonthPageIndex = pageController.page!
                : null;
          },
          daysOfWeekStyle: DaysOfWeekStyle(
            weekendStyle: TextStyle(
              color:
                  context.isDarkMode ? ConstColor.white : ConstColor.darkAppBar,
            ),
            weekdayStyle: TextStyle(
              color:
                  context.isDarkMode ? ConstColor.white : ConstColor.darkAppBar,
            ),
          ),
          currentDay: DateTime.now(),
          rowHeight: 122,
          availableGestures: AvailableGestures.none,
          daysOfWeekHeight: 40,
          startingDayOfWeek: StartingDayOfWeek.monday,
          firstDay: DateTime.utc(2015, 10, 16),
          lastDay: DateTime.utc(2030, 10, 14),
          focusedDay: DateTime.now(),
          headerVisible: true,
          calendarFormat: _calendarFormat,
          calendarStyle: CalendarStyle(
            defaultDecoration: BoxDecoration(
              border: Border.all(
                  color: !context.isDarkMode
                      ? ConstColor.white
                      : ConstColor.darkAppBar,
                  width: 0.5),
            ),
            canMarkersOverflow: false,
          ),
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonShowsNext: false,
            formatButtonVisible: false,
            leftChevronVisible: false,
            rightChevronVisible: false,
          ),
          calendarBuilders: CalendarBuilders(
            headerTitleBuilder: (context, day) =>
                IngridResponsive.isMobile(context) ||
                        IngridResponsive.isTablet(context) ||
                        IngridResponsive.isMediumWeb(context)
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _dateChangeButton(),
                              _monthTitle(day),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_horiz,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          FxBox.h16,
                          _monthYear(),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _dateChangeButton(),
                          _monthTitle(day),
                          FxBox.w8,
                          _monthYear(),
                          FxBox.w16,
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
            outsideBuilder: (context, day, focusedDay) {
              return _dateBoxUi(
                borderColor: ConstColor.lightGray,
                day: day.day.toString(),
                boxColor: context.isDarkMode
                    ? ConstColor.darkAppBar
                    : ConstColor.white,
                textColor:
                    context.isDarkMode ? ConstColor.grey : ConstColor.lightGray,
              );
            },
            todayBuilder: (context, toDay, events) {
              return Stack(
                children: [
                  _dateBoxUi(
                      borderColor: ConstColor.lightGray,
                      day: toDay.day.toString(),
                      boxColor: context.isDarkMode
                          ? ConstColor.darkAppBar
                          : ConstColor.white,
                      textColor: ConstColor.primary),
                  _scheduleBox(toDay),
                ],
              );
            },
            defaultBuilder: (context, defaultDay, focusedDay) {
              return Stack(
                children: [
                  _dateBoxUi(
                    borderColor: ConstColor.lightGray,
                    day: defaultDay.day.toString(),
                    boxColor: context.isDarkMode
                        ? ConstColor.darkAppBar
                        : ConstColor.white,
                    textColor: defaultDay.weekday == 7
                        ? ConstColor.redAccent
                        : context.isDarkMode
                            ? ConstColor.white
                            : ConstColor.darkAppBar,
                  ),
                  _scheduleBox(defaultDay),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _monthYear() {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        itemCount: _calenderList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        //physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: MaterialButton(
              onPressed: () {
                tapIndex = index;
                _calendarFormat = CalendarFormat.month;
                setState(() {});
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
                side: BorderSide(
                    color: tapIndex == index ? Colors.blue : Colors.grey),
              ),
              minWidth: 110,
              height: 44,
              color: tapIndex == index
                  ? context.isDarkMode
                      ? const Color.fromRGBO(230, 246, 254, 1).withOpacity(0.2)
                      : const Color.fromRGBO(230, 246, 254, 1)
                  : context.isDarkMode
                      ? ConstColor.darkAppBar
                      : ConstColor.white,
              child: ConstText.lightText(
                text: _calenderList[index],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _dateBoxUi({
    required String day,
    required Color textColor,
    required Color borderColor,
    required Color boxColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: borderColor),
      ),
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(6.0),
      child: Text(
        day,
        style: TextStyle(
          fontSize: 18.0,
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _scheduleBox(DateTime date) {
    bool isContains = eventMap.containsKey(date);
    List list = eventMap[date] ?? [];
    return Positioned(
      top: 24.0,
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: !isContains
          ? const SizedBox.shrink()
          : ListView.builder(
              itemCount: list.length,
              reverse: true,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 28,
                      margin: IngridResponsive.isMobile(context)
                          ? const EdgeInsets.all(4.0)
                          : const EdgeInsets.all(12.0),
                      padding: IngridResponsive.isMobile(context) ||
                              IngridResponsive.isTablet(context) ||
                              IngridResponsive.isSmallWeb(context) ||
                              IngridResponsive.isMediumWeb(context)
                          ? const EdgeInsets.all(8.0)
                          : const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 18.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: list[index]['Boxcolor'],
                      ),
                      alignment: Alignment.center,
                      child: Tooltip(
                        message: list[index]['eventName'],
                        child: Text(
                          list[index]['eventName'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: context.isDarkMode
                                  ? list[index]['Boxcolor'] ==
                                          ConstColor.lightwhite
                                      ? ConstColor.darkFillColor
                                      : ConstColor.white
                                  : ConstColor.white,
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }

  Widget _dateChangeButton() {
    return Row(
      children: [
        FxButton(
          minWidth: 27.5,
          color: ConstColor.primary,
          onPressed: () {
            if (newpageController != null) {
              newpageController!.previousPage(
                duration: const Duration(microseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
          icon: const Icon(
            Icons.navigate_before,
            color: ConstColor.white,
          ),
          borderRadius: 4.0,
        ),
        FxBox.w4,
        FxButton(
          minWidth: 27.5,
          color: ConstColor.primary,
          onPressed: () {
            if (newpageController != null) {
              newpageController!.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn);
            }
          },
          icon: const Icon(
            Icons.navigate_next,
            color: ConstColor.white,
          ),
          borderRadius: 4.0,
        ),
      ],
    );
  }

  Widget _monthTitle(DateTime day) {
    return Expanded(
      child: Center(
        child: Text(
          '${months.elementAt(day.month - 1)} ${day.year}'.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
