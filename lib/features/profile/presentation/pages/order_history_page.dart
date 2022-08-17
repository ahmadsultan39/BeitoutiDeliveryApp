import 'package:beitouti_delivery/features/profile/presentation/widgets/order_history_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/widgets/custom_loader.dart';
import '../../../../injection.dart';
import '../bloc/profile.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final _bloc = sl<ProfileBloc>();

  final _controller = ScrollController();

  @override
  void initState() {
    _bloc.addGetOrdersHistoryEvent(firstRequest: true);
    _controller.addListener(
      () {
        if (_controller.position.pixels ==
            _controller.position.maxScrollExtent) {
          _bloc.addGetOrdersHistoryEvent();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _bloc,
      builder: (context, state) {
        WidgetsBinding.instance?.addPostFrameCallback(
          (_) => message(
            message: state.message,
            isError: state.error,
            bloc: _bloc,
            context: context,
          ),
        );
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text("سجل الطلبات"),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: [
                    ...state.orderHistory.items.map(
                      (order) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 15.h,
                        ),
                        child: Container(
                          width: 375.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0, 10),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                OrderHistoryInfo(
                                  name: 'رقم الطلب',
                                  info: order.id.toString(),
                                  icon: Icons.numbers,
                                ),
                                OrderHistoryInfo(
                                  name: 'اسم الطاهي',
                                  info: order.chefName,
                                  icon: MdiIcons.chefHat,
                                ),
                                OrderHistoryInfo(
                                  name: 'موقع الطاهي',
                                  info: order.chefLocation,
                                  icon: Icons.location_on_rounded,
                                ),
                                OrderHistoryInfo(
                                  name: 'الوجهة',
                                  info: order.destination,
                                  icon: Icons.delivery_dining_rounded,
                                ),
                                OrderHistoryInfo(
                                  name: 'تاريخ التوصيل',
                                  info: order.deliveredAt,
                                  icon: Icons.timer,
                                ),
                                OrderHistoryInfo(
                                  name: 'عدد الوجبات',
                                  info: order.mealsQuantity.toString(),
                                  icon: MdiIcons.food,
                                ),
                                OrderHistoryInfo(
                                  name: 'كلفة التوصيل',
                                  info: order.deliveryCost.round().toString() +
                                      " ل.س",
                                  icon: MdiIcons.cash,
                                ),
                                OrderHistoryInfo(
                                  name: 'الكلفة الإجمالية',
                                  info: order.totalCost.round().toString() +
                                      " ل.س",
                                  icon: MdiIcons.cash,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    state.orderHistory.isLoading ? const Loader() : Container(),
                  ],
                ),
              ),
              if (state.isLoading) const Loader()
            ],
          ),
        );
      },
    );
  }
}
