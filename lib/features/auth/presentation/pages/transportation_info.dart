import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/custom_expansion_tile.dart';
import '../widgets/form_entity.dart';
import '../widgets/page_view_item.dart';

class TransportationInfo extends StatefulWidget {
  final TextEditingController birthDateTextController;
  final Function(int) transportationTypeController;
  final Function(int) genderController;
  final VoidCallback onPressed;

  const TransportationInfo({
    Key? key,
    required this.birthDateTextController,
    required this.transportationTypeController,
    required this.genderController,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<TransportationInfo> createState() => _TransportationInfoState();
}

class _TransportationInfoState extends State<TransportationInfo> {
  String _pickDateErrorMessage = '';

  // TransportationType
  final List<String> _transportationTypes = [
    'دراجة هوائية',
    'دراجة كهربائية',
    'دراجة نارية',
    'سيارة',
  ];
  bool _isTransportationTypeChanged = true;

  String _transportationType = 'الرجاء إختيار نوع المركبة';

  final GlobalKey<CustomExpansionTileState> _transportationKey = GlobalKey();

  // TransportationType
  final List<String> _gendersList = [
    'ذكر',
    'أنثى',
  ];
  bool _isGenderChanged = true;
  String _gender = 'الرجاء اختيار الجنس';
  final GlobalKey<CustomExpansionTileState> _genderKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return PageViewItem(
      buttonText: "التالي",
      onPressed: () {
        if (_transportationType != 'الرجاء إختيار نوع المركبة' &&
            _transportationType != 'الرجاء اختيار الجنس' &&
            widget.birthDateTextController.text.isNotEmpty) {
          widget.onPressed();
        } else {
          if (_transportationType == 'الرجاء إختيار نوع المركبة') {
            setState(() {
              _isTransportationTypeChanged = false;
            });
          }
          if (_gender == 'الرجاء اختيار الجنس') {
            setState(() {
              _isGenderChanged = false;
            });
          }
          if (widget.birthDateTextController.text.isEmpty) {
            setState(() {
              _pickDateErrorMessage = 'الرجاء اختيار تاريخ الميلاد';
            });
          }
        }
      },
      children: [
        FormEntity(
          controller: widget.birthDateTextController,
          onChanged: (text) {
            if (text.isNotEmpty) {
              setState(() {
                _pickDateErrorMessage = '';
              });
            }
          },
          error: _pickDateErrorMessage,
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1980),
              lastDate: DateTime.now(),
            );
            if (date != null) {
              setState(() {
                widget.birthDateTextController.text =
                    DateFormat('yyyy-MM-dd').format(date);
              });
            }
          },
          prefixIcon: Icons.date_range_rounded,
          enabled: false,
          upperLabel: "تاريخ الميلاد",
          isInputTextValid: widget.birthDateTextController.text.isNotEmpty,
          height: 40.h,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          textSize: 15.sp,
        ),
        FormEntity(
          upperLabel: 'نوع المركبة',
          child: Column(
            children: [
              CustomExpansionTile(
                key: _transportationKey,
                title: Text(
                  _transportationType,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: _isTransportationTypeChanged
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                children: [
                  ..._transportationTypes
                      .map(
                        (transportation) => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _isTransportationTypeChanged = true;
                              _transportationType = transportation;
                              widget.transportationTypeController(
                                _transportationTypes.indexOf(transportation),
                              );
                              _transportationKey.currentState?.collapse();
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.h,
                            ),
                            child: Text(
                              transportation,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: _transportationType == transportation
                                    ? Theme.of(context).colorScheme.tertiary
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
                backgroundColor: Colors.white,
                expandedAlignment: Alignment.centerRight,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                collapsedBackgroundColor: Colors.white,
                childrenPadding: EdgeInsets.symmetric(horizontal: 20.w),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10.h,
                  right: 10.w,
                ),
                child: Row(
                  children: [
                    Text(
                      _isTransportationTypeChanged
                          ? ""
                          : "الرجاء اختيار نوع المركبة",
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FormEntity(
          upperLabel: 'الجنس',
          child: Column(
            children: [
              CustomExpansionTile(
                key: _genderKey,
                title: Text(
                  _gender,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: _isGenderChanged
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                children: [
                  ..._gendersList
                      .map(
                        (gender) => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _isGenderChanged = true;
                              _gender = gender;
                              widget.genderController(
                                _gendersList.indexOf(gender),
                              );
                              _genderKey.currentState?.collapse();
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0.h,
                            ),
                            child: Text(
                              gender,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: _gender == gender
                                    ? Theme.of(context).colorScheme.tertiary
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
                backgroundColor: Colors.white,
                expandedAlignment: Alignment.centerRight,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                collapsedBackgroundColor: Colors.white,
                childrenPadding: EdgeInsets.symmetric(horizontal: 20.w),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10.h,
                  right: 10.w,
                ),
                child: Row(
                  children: [
                    Text(
                      _isGenderChanged ? "" : "الرجاء اختيار الجنس",
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
