import 'package:beitouti_delivery/core/util/constants.dart';
import 'package:beitouti_delivery/core/util/enums.dart';
import 'package:beitouti_delivery/core/widgets/custom_loader.dart';
import 'package:beitouti_delivery/features/current_delivery/presentation/widgets/current_delivery_details.dart';
import 'package:beitouti_delivery/features/order/presentation/bloc/order.dart';
import 'package:beitouti_delivery/features/order/presentation/widgets/report_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../injection.dart';

class OrderPage extends StatefulWidget {
  final int orderId;

  const OrderPage({Key? key, required this.orderId}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _bloc = sl<OrderBloc>();

  @override
  void initState() {
    _bloc.addGetOrderEvent(orderId: widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
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
            title: const Text("تفاصيل الطلب"),
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => ReportDialog(
                      report: (reportedOn, reason) {
                        _bloc.addReportOrderEvent(
                          orderId: widget.orderId,
                          reason: reason,
                          reportedOn: reportedOn == 'الطالب' ? 'user' : 'chef',
                        );
                      },
                    ),
                  );
                },
                icon: const Text("إبلاغ"),
              ),
            ],
          ),
          body: Stack(
            children: [
              if (state.order != null)
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 20.h,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.background,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(0, 10)),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                CurrentDeliveryDetails(
                                  title: 'رقم الطلب',
                                  icon: Icons.numbers,
                                  value: state.order!.id.toString(),
                                ),
                                CurrentDeliveryDetails(
                                  title: 'حالة الطلب',
                                  icon: MdiIcons.listStatus,
                                  value: orderStatusToMessage(
                                      state.order!.status!),
                                ),
                                CurrentDeliveryDetails(
                                  title: 'اسم الطالب',
                                  icon: Icons.person,
                                  value: state.order!.userName,
                                ),
                                CurrentDeliveryDetails(
                                  title: 'رقم الطالب',
                                  icon: Icons.phone,
                                  value: state.order!.userPhoneNumber,
                                ),
                                CurrentDeliveryDetails(
                                  title: 'الكلفة',
                                  icon: MdiIcons.cash,
                                  value: state.order!.totalCost
                                          .round()
                                          .toString() +
                                      " ل.س",
                                ),
                                CurrentDeliveryDetails(
                                  title: 'عدد الوجبات',
                                  icon: MdiIcons.menu,
                                  value: state.order!.mealsCount.toString(),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (state.order!.status! ==
                                          OrderStatus.prepared) {
                                        _bloc.addChangeOrderStatusEvent(
                                          orderId: widget.orderId,
                                          newStatus: OrderStatus.picked,
                                        );
                                      } else if (state.order!.status! ==
                                          OrderStatus.picked) {
                                        _bloc.addChangeOrderStatusEvent(
                                          orderId: widget.orderId,
                                          newStatus: OrderStatus.delivered,
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 45.h,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "تغيير حالة الطلب",
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "الوجبات",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      ...state.order!.meals!.map(
                        (meal) => Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 20.w,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.background,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    offset: Offset(0, 10)),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  CurrentDeliveryDetails(
                                    title: 'اسم الوجبة',
                                    value: meal.name,
                                  ),
                                  CurrentDeliveryDetails(
                                    title: 'السعر الإفرادي',
                                    value: meal.price.toString() + ' ل.س',
                                  ),
                                  CurrentDeliveryDetails(
                                    title: 'العدد',
                                    value: meal.quantity.toString(),
                                  ),
                                  CurrentDeliveryDetails(
                                    title: 'الملاحظات',
                                    value: meal.notes ?? 'لا يوجد',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
