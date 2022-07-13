import 'package:beitouti_delivery/core/data/base_local_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'order_local_data_source.dart';

@LazySingleton(as: OrderLocalDataSource)
class OrderLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements OrderLocalDataSource {
  OrderLocalDataSourceImp({required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);
}
