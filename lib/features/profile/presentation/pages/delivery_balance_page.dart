import 'package:beitouti_delivery/features/profile/presentation/widgets/balance_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/widgets/custom_loader.dart';
import '../../../../injection.dart';
import '../bloc/profile.dart';

class DeliveryBalancePage extends StatefulWidget {
  const DeliveryBalancePage({Key? key}) : super(key: key);

  @override
  State<DeliveryBalancePage> createState() => _DeliveryBalancePageState();
}

class _DeliveryBalancePageState extends State<DeliveryBalancePage> {
  final _bloc = sl<ProfileBloc>();

  @override
  void initState() {
    _bloc.addGetBalanceEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _bloc,
      builder: (context, state) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          message(
            message: state.message,
            isError: state.error,
            context: context,
            bloc: _bloc,
          );
        });
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text("الرصيد"),
          ),
          body: Stack(
            children: [
              if (state.balance != null)
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 15.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0, 5),
                                blurRadius: 10,
                              ),
                            ],
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'الرصيد الإجمالي: ',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                Text(
                                  state.balance!.balance.toString() + " ل.س",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      BalanceItem(
                        received: state.balance!.today.received,
                        ordersCount: state.balance!.today.ordersCount,
                        balance: state.balance!.today.balance,
                        title: 'اليوم',
                      ),
                      BalanceItem(
                        received: state.balance!.thisWeek.received,
                        ordersCount: state.balance!.thisWeek.ordersCount,
                        balance: state.balance!.thisWeek.balance,
                        title: 'هذا الأسبوع',
                      ),
                      BalanceItem(
                        received: state.balance!.thisMonth.received,
                        ordersCount: state.balance!.thisMonth.ordersCount,
                        balance: state.balance!.thisMonth.balance,
                        title: 'هذا الشهر',
                      ),
                    ],
                  ),
                ),
              state.isLoading ? const Loader() : Container(),
            ],
          ),
        );
      },
    );
  }
}
