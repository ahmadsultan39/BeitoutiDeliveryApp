import 'package:beitouti_delivery/core/util/constants.dart';
import 'package:beitouti_delivery/core/util/generate_screen.dart';
import 'package:beitouti_delivery/core/widgets/custom_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            if (state.currentDelivery != null)
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    NameScreen.orderScreen,
                    arguments: state.currentDelivery!.orders[0].id,
                  );
                },
                child: Center(
                  child: Text("${state.currentDelivery!.totalCost}\n"
                      "${state.currentDelivery!.totalMealCount}\n"
                      "${state.currentDelivery!.id}\n"
                      "${state.currentDelivery!.chefName}\n"
                      "${state.currentDelivery!.chefLocation.longitude}\n"
                      "${state.currentDelivery!.chefLocation.latitude}\n"
                      "${state.currentDelivery!.chefLocation.name}\n"
                      "${state.currentDelivery!.selectedDeliveryTime}\n"
                      "${state.currentDelivery!.destination}\n"
                      "${state.currentDelivery!.orders}\n"),
                ),
              ),
            state.isLoading ? const Loader() : Container(),
          ],
        );
      },
    );
  }
}
