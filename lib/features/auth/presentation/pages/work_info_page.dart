import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../widgets/form_entity.dart';
import '../widgets/page_view_item.dart';

class WorkInfoPage extends StatefulWidget {
  final TextEditingController workDaysTextController;
  final TextEditingController workHourFromTextController;
  final TextEditingController workHourToTextController;
  final VoidCallback onPressed;

  const WorkInfoPage({
    Key? key,
    required this.workDaysTextController,
    required this.workHourFromTextController,
    required this.workHourToTextController,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<WorkInfoPage> createState() => _WorkInfoPageState();
}

class _WorkInfoPageState extends State<WorkInfoPage> {
  String _workHoursErrorMessage = '';
  String _workDaysErrorMessage = '';

  final List<String> _days = [
    'السبت',
    'الأحد',
    'الإثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
  ];

  final List<String> _hours = [
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
  ];

  List<String> _workDays = [];

  String? _workFrom;
  String? _workTo;

  @override
  Widget build(BuildContext context) {
    return PageViewItem(
      buttonText: 'إنشاء الحساب',
      onPressed: () {
        if (_workFrom == null || _workTo == null) {
          setState(() {
            _workHoursErrorMessage = 'الرجاء اختيار ساعات العمل';
          });
        }
        if (_workDays.isEmpty) {
          _workDaysErrorMessage = 'الرجاء اختيار أيام العمل';
        }

        if (_workTo != null && _workFrom != null && _workDays.isNotEmpty) {
          widget.workDaysTextController.text = _workDays.toString();
          widget.onPressed();
        }
      },
      children: [
        FormEntity(
          upperLabel: 'ساعات العمل',
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    DropdownButton<String>(
                      value: _workFrom == null
                          ? _workFrom
                          : _workFrom!.substring(0, 5),
                      hint: const Text("من"),
                      items: [
                        ..._hours.map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        ),
                      ],
                      onChanged: (hour) {
                        if (hour != null) {
                          setState(
                            () {
                              widget.workHourFromTextController.text =
                                  hour + ':00';
                              _workFrom = hour + ':00';
                              if (_workTo != null) {
                                _workHoursErrorMessage = '';
                              }
                            },
                          );
                        }
                      },
                    ),
                    const Spacer(),
                    DropdownButton<String>(
                      hint: const Text("إلى"),
                      value:
                          _workTo == null ? _workTo : _workTo!.substring(0, 5),
                      items: [
                        ..._hours.map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        ),
                      ],
                      onChanged: (hour) {
                        if (hour != null) {
                          setState(
                            () {
                              widget.workHourToTextController.text =
                                  hour + ':00';
                              _workTo = hour + ':00';
                              if (_workFrom != null) {
                                _workHoursErrorMessage = '';
                              }
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
                if (_workHoursErrorMessage.isNotEmpty)
                  SizedBox(
                    height: 5.h,
                  ),
                if (_workHoursErrorMessage.isNotEmpty)
                  Text(
                    _workHoursErrorMessage,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12.sp,
                    ),
                  ),
                if (_workHoursErrorMessage.isNotEmpty)
                  SizedBox(
                    height: 5.h,
                  ),
              ],
            ),
          ),
        ),
        FormEntity(
          upperLabel: 'أيام العمل',
          child: Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ..._days.map(
                  (day) => Row(
                    children: [
                      SizedBox(
                        child: Text(
                          day,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        width: 60.w,
                      ),
                      Checkbox(
                        value: _workDays.contains(day),
                        activeColor: Theme.of(context).colorScheme.tertiary,
                        onChanged: (isSelected) {
                          if (isSelected!) {
                            setState(() {
                              _workDays.add(day);
                            });
                          } else {
                            setState(() {
                              _workDays.remove(day);
                            });
                          }
                          if (_workDays.isEmpty) {
                            setState(() {
                              _workDaysErrorMessage =
                                  'الرجاء اختيار أيام العمل';
                            });
                          } else {
                            setState(() {
                              _workDaysErrorMessage = '';
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                if (_workDaysErrorMessage.isNotEmpty)
                  SizedBox(
                    height: 5.h,
                  ),
                if (_workDaysErrorMessage.isNotEmpty)
                  Text(
                    _workDaysErrorMessage,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12.sp,
                    ),
                  ),
                if (_workDaysErrorMessage.isNotEmpty)
                  SizedBox(
                    height: 5.h,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
