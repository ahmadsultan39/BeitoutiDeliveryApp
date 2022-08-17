import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryInfo extends StatelessWidget {
  final String name;
  final String info;
  final IconData icon;

  const OrderHistoryInfo({
    Key? key,
    required this.name,
    required this.info,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
        horizontal: 10.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.tertiary,
            size: 22.sp,
          ),
          SizedBox(width: 5.w),
          Text(
            "$name:  ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(
            width: 160.w,
            child: Text(
              info,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
