import 'package:beitouti_delivery/core/data/base_local_datasource.dart';
import 'package:beitouti_delivery/features/profile/data/data_sources/local/profile_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements ProfileLocalDataSource {
  ProfileLocalDataSourceImp({
    required SharedPreferences sharedPreferences,
  }) : super(sharedPreferences: sharedPreferences);
}
