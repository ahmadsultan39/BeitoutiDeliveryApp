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

  String _workFrom = 'من';
  String _workTo = 'إلى';

  @override
  Widget build(BuildContext context) {
    return PageViewItem(
      buttonText: 'إنشاء الحساب',
      onPressed: () {
        widget.workDaysTextController.text = _workDays.toString();
        widget.onPressed();
      },
      children: [
        FormEntity(
          upperLabel: 'أيام العمل',
          child: Align(
            alignment: Alignment.centerRight,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._days.map(
                  (day) => Row(
                    children: [
                      SizedBox(
                        child: Text(day),
                        width: 60.w,
                      ),
                      Checkbox(
                        value: _workDays.contains(day),
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
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        FormEntity(
          upperLabel: 'ساعات العمل',
          child: Row(
            children: [
              DropdownButton<String>(
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
                        widget.workHourFromTextController.text = hour + ':00';
                      },
                    );
                  }
                },
              ),
              Spacer(),
              DropdownButton<String>(
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
                        widget.workHourToTextController.text = hour + ':00';
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200.h,
        ),
      ],
    );
  }
}
