import 'package:beitouti_delivery/app/data/data_sources/local/app_local_data_source.dart';
import 'package:beitouti_delivery/core/data/base_local_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AppLocalDataSource)
class AppLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements AppLocalDataSource {
  final Location location;

  AppLocalDataSourceImp({
    required SharedPreferences sharedPreferences,
    required this.location,
  }) : super(sharedPreferences: sharedPreferences);
}
