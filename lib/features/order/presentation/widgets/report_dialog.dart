import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportDialog extends StatefulWidget {
  final Function(String, String) report;

  const ReportDialog({
    Key? key,
    required this.report,
  }) : super(key: key);

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  final TextEditingController _reportTextFieldController =
      TextEditingController();

  bool _isSelectedReportedOnValid = true;

  String _selectedReportedOnErrorMessage = '';

  bool _isReasonValid = true;

  String _reasonErrorMessage = '';

  String? _reportedOn;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setDialogState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          TextButton(
            onPressed: () {
              if (_reportedOn == null) {
                setDialogState(() {
                  _isSelectedReportedOnValid = false;
                  _selectedReportedOnErrorMessage = 'الرجاء اختيار المبلغ عنه';
                });
              }
              if (_reportTextFieldController.text.isEmpty) {
                setDialogState(() {
                  _isReasonValid = false;
                  _reasonErrorMessage = 'الرجاء توضيح سبب الإبلاغ';
                });
              } else {
                widget.report(_reportedOn!, _reportTextFieldController.text);
                Navigator.of(context).pop();
              }
            },
            child: Text(
              "إرسال الإبلاغ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
        title: Text(
          "الإبلاغ عن الطلب",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<String>(
              items: [
                DropdownMenuItem(
                  child: Text(
                    "الطاهي",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  value: 'الطاهي',
                ),
                DropdownMenuItem(
                  child: Text(
                    "الطالب",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  value: 'الطالب',
                ),
              ],
              onChanged: (selected) {
                if (selected == null) {
                  setDialogState(() {
                    _isSelectedReportedOnValid = false;
                    _selectedReportedOnErrorMessage =
                        'الرجاء اختيار المبلغ عنه';
                  });
                } else {
                  setDialogState(
                    () {
                      _isSelectedReportedOnValid = true;
                      _reportedOn = selected;
                    },
                  );
                }
              },
              value: _reportedOn,
              hint: Text(
                "اختر المبلغ عنه",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            if (!_isSelectedReportedOnValid)
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5.h,
                ),
                child: Text(
                  _selectedReportedOnErrorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            SizedBox(
              height: 100.h,
              child: TextField(
                controller: _reportTextFieldController,
                textInputAction: TextInputAction.done,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 6,
                decoration: InputDecoration(
                  // LABEL
                  labelText: 'سبب الإبلاغ',
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12.sp,
                  ),

                  alignLabelWithHint: true,

                  // FILL COLOR
                  filled: true,
                  fillColor: Colors.white,

                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.w,
                  ),

                  // ENABLE BORDER
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),

                  // ENABLE BORDER
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),

                  // FOCUSED BORDER
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                onChanged: (reason) {
                  if (reason.isNotEmpty) {
                    setDialogState(
                      () {
                        _isReasonValid = true;
                      },
                    );
                  }
                },
              ),
            ),
            if (!_isReasonValid)
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5.h,
                ),
                child: Text(
                  _reasonErrorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.sp,
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
