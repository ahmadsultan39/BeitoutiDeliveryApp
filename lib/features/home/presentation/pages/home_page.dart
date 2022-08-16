import 'package:beitouti_delivery/core/util/constants.dart';
import 'package:beitouti_delivery/features/current_delivery/presentation/pages/current_delivery_page.dart';
import 'package:beitouti_delivery/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../app/presentation/bloc/app_bloc.dart';
import '../../../../core/util/generate_screen.dart';
import '../../../../core/widgets/custom_loader.dart';
import '../../../../injection.dart';
import '../../../profile/presentation/bloc/profile.dart';
import '../bloc/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = sl<HomeBloc>();

  @override
  void initState() {
    sl<AppBloc>().addSubscribeToOrderIsPreparedChannelEvent();
    sl<AppBloc>().addSubscribeToOrderIsAssignedChannelEvent();
    _bloc.addGetAvailabilityStatusEvent();
    super.initState();
  }

  final List<Widget> _pages = [
    const CurrentDeliveryPage(),
    const ProfilePage(),
  ];

  int _selectedPage = 0;

  void _onTapChange(int index) {
    if (index != _selectedPage) {
      setState(() {
        _selectedPage = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      bloc: sl<ProfileBloc>(),
      listener: (context, state) {
        sl<ProfileBloc>().addSetLogoutValue();
        if (state.isLoggedOut) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            NameScreen.splashScreen,
            (route) => false,
          );
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: _bloc,
        builder: (context, state) {
          WidgetsBinding.instance?.addPostFrameCallback(
            (_) {
              message(
                message: state.message,
                isError: state.error,
                context: context,
                bloc: _bloc,
              );
            },
          );
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: Text(
                "بَيتوتيْ",
                style: TextStyle(
                  fontSize: 21.sp,
                ),
              ),
              actions: [
                Row(
                  children: [
                    const Text("الحالة"),
                    Switch(
                      value: state.active,
                      activeColor: Theme.of(context).colorScheme.secondary,
                      onChanged: (_) {
                        _bloc.addChangeAvailabilityEvent();
                      },
                    ),
                  ],
                ),
              ],
            ),
            body: Stack(
              children: [
                _pages[_selectedPage],
                if (state.isLoading) const Loader(),
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: 65.h,
              child: GNav(
                onTabChange: _onTapChange,
                backgroundColor: Theme.of(context).colorScheme.primary,
                color: Colors.white,
                activeColor: Theme.of(context).colorScheme.primary,
                tabBackgroundColor: Theme.of(context).colorScheme.tertiary,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                tabs: [
                  GButton(
                    icon: Icons.delivery_dining,
                    text: 'الطلب الحالي',
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'الملف الشخصي',
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
