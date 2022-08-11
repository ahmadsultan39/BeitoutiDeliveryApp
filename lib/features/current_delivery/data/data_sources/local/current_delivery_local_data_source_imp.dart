import 'package:beitouti_delivery/core/data/base_local_datasource.dart';
import 'package:beitouti_delivery/features/current_delivery/data/data_sources/local/current_delivery_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: CurrentDeliveryLocalDataSource)
class CurrentDeliveryLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements CurrentDeliveryLocalDataSource {
  CurrentDeliveryLocalDataSourceImp({
    required SharedPreferences sharedPreferences,
  }) : super(sharedPreferences: sharedPreferences);
}
