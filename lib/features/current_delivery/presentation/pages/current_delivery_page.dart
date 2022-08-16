import 'package:beitouti_delivery/core/util/constants.dart';
import 'package:beitouti_delivery/core/util/generate_screen.dart';
import 'package:beitouti_delivery/core/widgets/custom_loader.dart';
import 'package:beitouti_delivery/core/widgets/empty_page.dart';
import 'package:beitouti_delivery/features/current_delivery/presentation/widgets/current_delivery_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../injection.dart';
import '../bloc/current_delivery.dart';

class CurrentDeliveryPage extends StatefulWidget {
  const CurrentDeliveryPage({Key? key}) : super(key: key);

  @override
  State<CurrentDeliveryPage> createState() => _CurrentDeliveryPageState();
}

class _CurrentDeliveryPageState extends State<CurrentDeliveryPage> {
  final _bloc = sl<CurrentDeliveryBloc>();

  @override
  void initState() {
    _bloc.addGetCurrentDeliveryEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentDeliveryBloc, CurrentDeliveryState>(
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
        return Stack(
          children: [
            if(state.currentDelivery == null && !state.isLoading)
              const EmptyPage(title: 'لا يوجد طلبات حالية مسندة إليك\nفي حال وجود طلب سيظهر لك هنا'),
            if (state.currentDelivery != null)
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    NameScreen.orderScreen,
                    arguments: state.currentDelivery!.orders[0].id,
                  );
                },
                child: RefreshIndicator(
                  onRefresh: () async {
                    _bloc.addGetCurrentDeliveryEvent();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
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
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CurrentDeliveryDetails(
                                    title: 'رقم الطلب',
                                    value: state.currentDelivery!.id.toString(),
                                    icon: Icons.numbers,
                                  ),
                                  CurrentDeliveryDetails(
                                    title: 'اسم الطاهي',
                                    value: state.currentDelivery!.chefName,
                                    icon: MdiIcons.chefHat,
                                  ),
                                  CurrentDeliveryDetails(
                                    title: 'عنوان الطاهي',
                                    value: state
                                        .currentDelivery!.chefLocation.name,
                                    icon: Icons.location_on,
                                  ),
                                  CurrentDeliveryDetails(
                                    title: 'رقم الطاهي',
                                    value:
                                        state.currentDelivery!.chefPhoneNumber,
                                    icon: Icons.phone,
                                  ),
                                  CurrentDeliveryDetails(
                                    title: 'وقت التوصيل',
                                    value: state
                                        .currentDelivery!.selectedDeliveryTime,
                                    icon: Icons.timer,
                                  ),
                                  CurrentDeliveryDetails(
                                    title: 'الوجهة',
                                    value: state.currentDelivery!.destination,
                                    icon: Icons.delivery_dining_rounded,
                                  ),
                                  CurrentDeliveryDetails(
                                    title: 'الكلفة',
                                    value: state.currentDelivery!.totalCost
                                            .round()
                                            .toString() +
                                        " ل.س",
                                    icon: MdiIcons.cash,
                                  ),
                                  CurrentDeliveryDetails(
                                    title: 'عدد الوجبات',
                                    value: state.currentDelivery!.totalMealCount
                                        .toString(),
                                    icon: MdiIcons.menu,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            state.isLoading ? const Loader() : Container(),
          ],
        );
      },
    );
  }
}
