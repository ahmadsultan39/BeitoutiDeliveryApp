import 'package:beitouti_delivery/core/util/constants.dart';
import 'package:beitouti_delivery/core/util/generate_screen.dart';
import 'package:beitouti_delivery/features/profile/presentation/bloc/profile.dart';
import 'package:beitouti_delivery/features/profile/presentation/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/custom_loader.dart';
import '../../../../injection.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _bloc = sl<ProfileBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _bloc,
      builder: (context, state) {
        message(
          message: state.message,
          isError: state.error,
          context: context,
          bloc: _bloc,
        );
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 120.h,
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "جميع الحقوق محفوظة",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Icon(
                              Icons.copyright_rounded,
                              size: 22.sp,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ProfileTile(
                    title: 'سجل الطلبات',
                    icon: Icons.history,
                    onTap: () {
                      Navigator.of(context).pushNamed(NameScreen.ordersHistory);
                    },
                  ),
                  ProfileTile(
                    title: 'الرصيد',
                    icon: Icons.balance_rounded,
                    onTap: () {
                      Navigator.of(context).pushNamed(NameScreen.balanceScreen);
                    },
                  ),
                  ProfileTile(
                    title: 'الدعم',
                    icon: Icons.contact_support_outlined,
                    onTap: () async {
                      const url = "tel:0953954152";
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  ProfileTile(
                    title: 'تسجيل الخروج',
                    icon: Icons.logout_rounded,
                    onTap: () {
                      _bloc.addLogoutEvent();
                    },
                  ),
                ],
              ),
            ),
            if (state.isLoading) const Loader(),
          ],
        );
      },
    );
  }
}
