import 'package:beitouti_delivery/core/util/constants.dart';
import 'package:beitouti_delivery/features/current_delivery/presentation/pages/current_delivery_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/data/base_local_datasource.dart';
import '../../../../core/data/base_remote_datasource.dart';
import '../../../../injection.dart';
import '../bloc/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = sl<HomeBloc>();

  final List<Widget> _pages = [
    const CurrentDeliveryPage(),
    const Center(
      child: Text("Profile Page"),
    ),
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
    return BlocBuilder<HomeBloc, HomeState>(
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
          appBar: AppBar(
            title: Text(
              "بَيتوتيْ",
              style: TextStyle(
                fontSize: 21.sp,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  _bloc.addChangeAvailabilityStatusEvent();
                },
                icon: const Icon(Icons.change_circle_outlined),
              )
            ],
          ),
          body: _pages[_selectedPage],
          bottomNavigationBar: SizedBox(
            height: 65.h,
            child: GNav(
              onTabChange: _onTapChange,
              backgroundColor: Theme.of(context).colorScheme.primary,
              color: Colors.white,
              activeColor: Theme.of(context).colorScheme.primary,
              tabBackgroundColor: Theme.of(context).colorScheme.tertiary,
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
    );
  }
}
