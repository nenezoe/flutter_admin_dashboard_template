// ignore_for_file: non_constant_identifier_names

import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/icons.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/admin/widget/textformfield.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterx/flutterx.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController dateNtimeController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController ddmmyyyy = TextEditingController();
  final TextEditingController MMMMddyyyy = TextEditingController();
  final TextEditingController mmDDyyyy = TextEditingController();
  final ValueNotifier<int> _selectedRangeIndex = ValueNotifier<int>(0);
  final List<String> _dateRange = [
    'Today',
    'Yesterday',
    'This week',
    'This month',
    'Last month'
  ];
  final ValueNotifier<DateTime> _rangeStart =
      ValueNotifier<DateTime>(DateTime.now());
  final ValueNotifier<DateTime> _rangeEnd =
      ValueNotifier<DateTime>(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Column(
        children: [
          Responsive.isWeb(context)
              ? Row(
                  children: [
                    Expanded(
                      child: _basicDatePicker(),
                    ),
                    FxBox.w16,
                    Expanded(
                      child: _formatedDatePicker(),
                    )
                  ],
                )
              : Column(
                  children: [
                    _basicDatePicker(),
                    FxBox.h16,
                    _formatedDatePicker()
                  ],
                ),
          FxBox.h24,
          SizedBox(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      languageModel.widget.dateRange,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 21.0),
                    ),
                    FxBox.h2,
                    Text(
                      languageModel.widget.datePickerText,
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    FxBox.h2,
                    Responsive.isWeb(context)
                        ? Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ..._range(),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: _calender(),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              ..._range(),
                              _calender(),
                            ],
                          ),
                    FxBox.h2,
                    const Divider(
                      thickness: 0.5,
                    ),
                    ValueListenableBuilder<DateTime>(
                      valueListenable: _rangeEnd,
                      builder: (context, rangeEnd, _) {
                        return ValueListenableBuilder<DateTime>(
                          valueListenable: _rangeStart,
                          builder: (context, randStart, _) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  DateFormat('MMM dd yyyy').format(randStart),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const Text(' - '),
                                Text(
                                  DateFormat('MMM dd yyyy').format(rangeEnd),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                FxBox.w6,
                                FxButton(
                                  onPressed: () {},
                                  text: 'Apply',
                                  borderRadius: 6.0,
                                ),
                              ],
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField(
      String hintText, String type, TextEditingController controller) {
    return SizedBox(
      height: 35,
      child: CustomTextField(
        hintText: hintText,
        readOnly: true,
        suffixIcon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SvgIcon(
            icon: IconlyBroken.calendar,
          ),
        ),
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onTap: () {
          _chooseDate(
              context,
              type == 'yearWithday'
                  ? 'yearWithday'
                  : type == 'day'
                      ? 'day'
                      : type == 'ddmmyyyy'
                          ? 'ddmmyyyy'
                          : type == 'MMMMddyyyy'
                              ? 'MMMMddyyyy'
                              : type == 'mmDDyyyy'
                                  ? 'mmDDyyyy'
                                  : '');
        },
        keyboardType: TextInputType.phone,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
      ),
    );
  }

  Future<DateTime> _chooseDate(BuildContext context, String type) async {
    final DateTime? selecteTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );

    if (selecteTime == null) {
      return DateTime.now();
    } else {
      type == 'yearWithday'
          ? dateNtimeController.text = selecteTime.toString()
          : type == 'day'
              ? dayController.text = DateFormat('EEEE').format(selecteTime)
              : type == 'month'
                  ? monthController.text =
                      DateFormat('MMMM').format(selecteTime)
                  : type == 'ddmmyyyy'
                      ? ddmmyyyy.text =
                          DateFormat('dd/MM/yyyy').format(selecteTime)
                      : type == 'MMMMddyyyy'
                          ? MMMMddyyyy.text =
                              DateFormat('MMMM,dd,yyyy').format(selecteTime)
                          : mmDDyyyy.text =
                              DateFormat('MM,EEEE,yyyy').format(selecteTime);
      return selecteTime;
    }
  }

  Widget _basicDatePicker() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              languageModel.widget.basic,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              thickness: 0.5,
            ),
            FxBox.h16,
            _textField('Select Date', 'yearWithday', dateNtimeController),
            FxBox.h32,
            _textField('Select Day', 'day', dayController),
            FxBox.h32,
            _textField('Select Month', 'month', monthController),
            FxBox.h32,
          ],
        ),
      ),
    );
  }

  Widget _formatedDatePicker() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              languageModel.widget.dateRange,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              thickness: 0.5,
            ),
            FxBox.h16,
            _textField('eg .01/01/2015', 'ddmmyyyy', ddmmyyyy),
            FxBox.h32,
            _textField('eg .January,02,2015', 'MMMMddyyyy', MMMMddyyyy),
            FxBox.h32,
            _textField('eg .01,Monday,2015', 'mmDDyyyy', mmDDyyyy),
            FxBox.h32,
          ],
        ),
      ),
    );
  }

  List<Widget> _range() {
    return [
      for (int i = 0; i < _dateRange.length; i++) ...[
        ValueListenableBuilder<int>(
          valueListenable: _selectedRangeIndex,
          builder: (context, value, child) {
            return ListTile(
              title: Text(
                _dateRange[i],
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              tileColor: value == i
                  ? ColorConst.primary.withOpacity(0.5)
                  : Theme.of(context).listTileTheme.tileColor,
              onTap: () {
                _selectedRangeIndex.value = i;
                if (i == 0) {
                  _rangeStart.value = DateTime.now();
                  _rangeEnd.value = DateTime.now();
                } else if (i == 1) {
                  _rangeStart.value = DateTime.now().subtract(
                    const Duration(days: 1),
                  );
                  _rangeEnd.value = DateTime.now();
                } else if (i == 2) {
                  _rangeStart.value = DateTime.now();
                  _rangeEnd.value = DateTime.now().add(
                    const Duration(days: 7),
                  );
                } else if (i == 3) {
                  _rangeStart.value = DateTime.now();
                  _rangeEnd.value = DateTime.now().add(
                    const Duration(days: 30),
                  );
                } else if (i == 4) {
                  _rangeStart.value = DateTime.now().subtract(
                    const Duration(days: 30),
                  );
                  _rangeEnd.value = DateTime.now();
                }
              },
            );
          },
        ),
      ],
    ];
  }

  Widget _calender() {
    return ValueListenableBuilder<DateTime>(
      valueListenable: _rangeEnd,
      builder: (context, rangeEnd, child) {
        return ValueListenableBuilder<DateTime>(
          valueListenable: _rangeStart,
          builder: (context, rangeStart, value) {
            return TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(2000),
              lastDay: DateTime(2050),
              rangeStartDay: rangeStart,
              rangeEndDay: rangeEnd,
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonShowsNext: true,
                formatButtonVisible: false,
                leftChevronVisible: true,
                rightChevronVisible: true,
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              onRangeSelected: (start, end, focusedDay) {
                _rangeStart.value = start ?? DateTime.now();
                _rangeEnd.value = end ?? DateTime.now();
              },
              rangeSelectionMode: RangeSelectionMode.enforced,
            );
          },
        );
      },
    );
  }
}
