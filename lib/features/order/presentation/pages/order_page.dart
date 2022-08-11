import 'package:beitouti_delivery/core/util/constants.dart';
import 'package:beitouti_delivery/core/util/enums.dart';
import 'package:beitouti_delivery/core/widgets/custom_loader.dart';
import 'package:beitouti_delivery/features/order/presentation/bloc/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          appBar: AppBar(),
          body: Stack(
            children: [
              if (state.order != null)
                Center(
                  child: Column(
                    children: [
                      Text(state.order!.id.toString()),
                      Text(state.order!.status.toString()),
                      Text(state.order!.totalCost.toString()),
                      Text(state.order!.meals!.toString()),
                      Text(state.order!.hasNotes.toString()),
                      Text(state.order!.mealsCount.toString()),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 20.h,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (state.order!.status! == OrderStatus.prepared) {
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
                            width: 200.w,
                            height: 100.h,
                            color: Colors.grey,
                            child: const Center(
                              child: Text("Change Order Status"),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 20.h,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _bloc.addReportOrderEvent(
                              orderId: widget.orderId,
                              reason: "reason",
                              reportedOn: 'user',
                            );
                          },
                          child: Container(
                            width: 200.w,
                            height: 100.h,
                            color: Colors.grey,
                            child: const Center(
                              child: Text("Report Order"),
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
